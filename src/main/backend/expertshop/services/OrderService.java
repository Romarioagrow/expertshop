package expertshop.services;
import expertshop.domain.Order;
import expertshop.domain.OrderedProduct;
import expertshop.domain.User;
import expertshop.repos.OrderRepo;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;

@Log
@Service
@AllArgsConstructor
public class OrderService {
    private final OrderRepo orderRepo;
    private final MailService mailService;

    public Order getCurrentOrder() {
        return orderRepo.findBySessionUUID(RequestContextHolder.currentRequestAttributes().getSessionId());
    }

    public void confirmOrder(Map<String, String> contacts, User user) {
        log.info(user.getUsername());

        if (user.getUsername() == null) {

        }

        /*Order order = orderRepo.findByOrderID(Integer.parseInt(contacts.get("orderID")));


        order.setName   (contacts.get("name"));
        order.setSurname(contacts.get("surname"));
        order.setMobile (contacts.get("mobile"));
        order.setEmail  (contacts.get("email"));

        Set<OrderedProduct> orderedProducts = order.getOrderedProducts();
        StringBuilder orderList = new StringBuilder();

        for (OrderedProduct product : orderedProducts) {
            StringJoiner item = new StringJoiner (", ");
            item    .add("\n" + product.getType() + " " + product.getBrand() + " " + product.getModel())
                    .add("кол-во: " + product.getAmount().toString())
                    .add("итого \u20BD: " + product.getTotalPrice().toString())
                    .add("id товара: " + product.getProductID().toString());
            orderList.append(item.toString());
        }

        log.info(orderList.toString());
        mailService.sendOrderDetail(orderList, order.getOrderID());
        mailService.sendEmailToCustomer(order, orderList);

        order.setAccepted(true);
        orderRepo.save(order);*/
    }
}