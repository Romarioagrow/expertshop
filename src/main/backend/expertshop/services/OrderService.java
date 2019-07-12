package expertshop.services;
import expertshop.domain.Order;
import expertshop.domain.OrderedProduct;
import expertshop.domain.Product;
import expertshop.domain.User;
import expertshop.domain.dto.OrderContacts;
import expertshop.repos.OrderRepo;
import expertshop.repos.OrderedRepo;
import expertshop.repos.ProductRepo;

import expertshop.repos.UserRepo;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.*;

@Log
@Service
@AllArgsConstructor
public class OrderService {
    private final MailService   mailService;
    private final OrderRepo     orderRepo;
    private final ProductRepo   productRepo;
    private final OrderedRepo   orderedRepo;
    private final UserRepo      userRepo;

    public boolean checkUserOrder(User user) {
        return orderRepo.findByUserIDAndAcceptedFalse(user.getUserID()) != null;
    }

    private boolean checkSessionOrder() {
        return orderRepo.findBySessionUUIDAndAcceptedFalse(getSessionID()) != null;
    }

    public Order getSessionOrder()
    { ///
        Order sessionOrder = orderRepo.findBySessionUUIDAndAcceptedFalse(getSessionID());
        return (sessionOrder != null && sessionOrder.isAccepted()) ? null : sessionOrder;
    }

    ///
    public Order getUserOrder(Long userID) {
        return orderRepo.findByUserIDAndAcceptedFalse(userID);
    }

    ///
    public Order resolveOrder(User user) {
        return user != null ? getUserOrder(user.getUserID()) : getSessionOrder();
    }

    public Set<OrderedProduct> showOrderedProducts(User user)
    {
        if (user != null && checkUserOrder(user)) {
            return orderRepo.findByUserIDAndAcceptedFalse(user.getUserID()).getOrderedProducts();
        }
        else if (checkSessionOrder()) {
            return orderRepo.findBySessionUUIDAndAcceptedFalse(getSessionID()).getOrderedProducts();
        }
        else return new HashSet<>();
    }

    public Integer addProductToOrder(String productID, User user)
    {
        Order order;
        OrderedProduct orderedProduct = new OrderedProduct();
        Product product = productRepo.findByProductID(productID);

        if (user == null)
        {
            order = orderRepo.findBySessionUUIDAndAcceptedFalse(getSessionID());

            if (!checkSessionOrder())
            {
                order = new Order();
                order.setSessionUUID(getSessionID());
                order.setTotalBonus(product.getBonus());
            }
            ///
            orderedProduct.constructOrderedProduct(product);///
            order.addProductToOrder(orderedProduct);
            order.setTotalBonus(order.extractTotalBonus());

            setOrderStats(order, orderedProduct.getTotalPrice());
            orderRepo.save(order);
        }
        else
        {
            order = orderRepo.findByUserIDAndAcceptedFalse(user.getUserID());

            if (order == null)
            {
                log.info("NO ORDER, NEW ONE!");
                order = new Order();
                order.setUserID(user.getUserID());
                order.setTotalBonus(product.getBonus());
            }
            ///
            orderedProduct.constructOrderedProduct(product); ///
            order.addProductToOrder(orderedProduct);
            order.setTotalBonus(order.getTotalBonus() + product.getBonus());

            setOrderStats(order, orderedProduct.getTotalPrice());

            orderRepo.save(order);
        }

        System.out.println("\n");
        log.info("Product with ID " + productID + " add to getOrder");
        log.info("Product bonus: " + product.getBonus());

        return order.getProductsAmount();
    }

    public Queue<Object> changeAmount(User user, Map<String, String> data)
    {
        OrderedProduct orderedProduct = orderedRepo.findByOrderedID(Long.valueOf(data.get("orderedID")));

        if (data.get("action").contains("product-less")) {
            if (orderedProduct.getOrderedAmount() > 1) {
                orderedProduct.setOrderedAmount(orderedProduct.getOrderedAmount() - 1);
            }
            else return null;
        }
        else {
            orderedProduct.setOrderedAmount(orderedProduct.getOrderedAmount() + 1);
        }

        orderedProduct.setTotalPrice(orderedProduct.getProductPrice() * orderedProduct.getOrderedAmount());
        orderedRepo.save(orderedProduct);

        Order order = resolveOrder(user);
        order.setTotalPrice (order.extractTotalOrderPrice());
        order.setTotalAmount(order.extractTotalProductsAmount());
        order.setTotalBonus (order.extractTotalBonus());
        orderRepo.save(order);

        log.info("Order total price: " + order.getTotalPrice());
        return packageOrderAndProduct(order, orderedProduct);
    }
    private Queue<Object> packageOrderAndProduct(Order order, OrderedProduct orderedProduct)
    {
        Queue<Object> orderAndProduct = new LinkedList<>();
        orderAndProduct.add(order);
        orderAndProduct.add(orderedProduct);
        return orderAndProduct;
    }

    public Order removeProductFromOrder(User user, String orderedID)
    {
        OrderedProduct orderedProduct = orderedRepo.findByOrderedID(Long.parseLong(orderedID));
        Order order = resolveOrder(user);
        order.getOrderedProducts().remove(orderedProduct);

        order.setTotalPrice     (order.getTotalPrice()      - orderedProduct.getTotalPrice());
        order.setProductsAmount (order.getOrderedProducts().size());
        order.setTotalAmount    (order.extractTotalProductsAmount());
        order.setTotalBonus     (order.extractTotalBonus());
        orderRepo.save(order);
        orderedRepo.delete(orderedProduct);
        return order;
    }

    private void setOrderStats(Order order, Integer productTotalPrice)
    {
        if (order.getTotalPrice() == null)
        {
            order.setTotalPrice     (productTotalPrice);
            order.setProductsAmount (1);
            order.setTotalAmount    (1);
        }
        else
        {
            order.setTotalPrice     (order.getTotalPrice()      + productTotalPrice);
            order.setProductsAmount (order.getProductsAmount()  + 1);
            order.setTotalAmount    (order.getTotalAmount()     + 1);
        }
    }

    public void confirmOrder(OrderContacts orderContacts, User user)
    {
        Order order;

        if (user == null)
        {
            order = getSessionOrder();

            order.setName   (orderContacts.getFirstName());
            order.setSurname(orderContacts.getLastName());
            order.setMobile (orderContacts.getUsername());
            order.setEmail  (orderContacts.getEmail());

            acceptOrder(order);
        }
        else
        {
            order = orderRepo.findByUserIDAndAcceptedFalse(user.getUserID());

            order.setName   (user.getFirstName());
            order.setSurname(user.getLastName());
            order.setMobile (user.getEmail());
            order.setEmail  (user.getUsername());

            user.setBonus(order.getTotalBonus());
            userRepo.save(user);
            acceptOrder(order);
        }
    }

    private void acceptOrder(Order order)
    {
        StringBuilder orderList = new StringBuilder();

        for (OrderedProduct product : order.getOrderedProducts())
        {
            StringJoiner item = new StringJoiner (", ");
            item    .add("\n" + product.getProductType() + " " + product.getProductName())
                    .add("кол-во: " + product.getOrderedAmount().toString())
                    .add("итого \u20BD: " + product.getTotalPrice().toString())
                    .add("orderedID товара: " + product.getProductID().toString());
            orderList.append(item.toString());
        }

        log.info(orderList.toString());
        mailService.sendOrderDetail(orderList, order);
        //mailService.sendEmailToCustomer(order, orderList);

        order.setAccepted(true);
        orderRepo.save(order);
    }

    public Set<Order> showUserOrders(Long userID) {
        return orderRepo.findOrdersByUserIDAndAcceptedTrue(userID);
    }

    public String getSessionID() {
        return RequestContextHolder.currentRequestAttributes().getSessionId();
    }
}
