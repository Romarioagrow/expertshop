package expertshop.controllers;
import expertshop.domain.Order;
import expertshop.domain.User;
import expertshop.domain.categories.Category;
import expertshop.domain.categories.SubCategory;
import expertshop.services.OrderService;
import expertshop.services.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Log
@Controller
@AllArgsConstructor
public class CategoriesController {
    private final ProductService productService;
    private final OrderService orderService;

    @GetMapping("/")
    public String showAll(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("url", "");
        model.addAttribute("order", order(user));
        //model.addAttribute("order", orderService.getSessionOrder());
        model.addAttribute("products", productService.findAll());
        return "pages/hello";
    }

    @GetMapping("/categories")
    public String categories(Model model) {
        return "redirect:/hello";
    }

    @GetMapping("/subcats")
    public String subCategories( Model model) {
        return "redirect:/hello";
    }

    @GetMapping("/categories/{category}")
    public String showByCategories(Model model, @PathVariable String category, @AuthenticationPrincipal User user)
    {
        log.info("Category: " + category);

        model.addAttribute("url", category);
        model.addAttribute("order", order(user));
        model.addAttribute("products", productService.findProducts(Category.valueOf(category)));
        return "pages/categories";
    }

    @GetMapping("/subcats/{req_subcategory}")
    public String showSubCategories( Model model, @PathVariable String req_subcategory, @AuthenticationPrincipal User user)
    {
        log.info("Category: " + req_subcategory);

        model.addAttribute("url", req_subcategory);
        model.addAttribute("order", order(user));
        model.addAttribute("products", productService.findProducts(SubCategory.valueOf(req_subcategory)));
        return "pages/main";
    }

    @GetMapping("/order")
    public String order(Model model, @AuthenticationPrincipal User user)
    {
        Order order = order(user);

        model.addAttribute("order", order);
        model.addAttribute("orderedProducts", orderService.showOrderedProducts(user));
        return "pages/order";
    }

    private Order order(User user) {
        if (user != null) return orderService.getUserOrder(user.getUserID());
        else return orderService.getSessionOrder();
    }
}


