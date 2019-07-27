package expertshop.controllers;

import expertshop.domain.User;
import expertshop.products.ProductParser;
import expertshop.products.ProductMatcher;
import expertshop.services.OrderService;
import expertshop.services.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Log
@Controller
@AllArgsConstructor
@RequestMapping("/supplier")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {
    private final ProductParser catalogParser;
    private final ProductMatcher productMatcher;
    private final ProductService productService;
    private final OrderService orderService;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String supplier(Model model)
    {
        model.addAttribute("url", "db");
        return "pages/supplier";
    }

    @GetMapping("/products")
    @PreAuthorize("hasAuthority('ADMIN')")
    private String products(@RequestParam String request, @RequestParam (value = "mapped", required = false) String mapped, @RequestParam (value = "withpic", required = false) String withpic, Model model) {
        model.addAttribute("url", "products");
        model.addAttribute("request", request);
        model.addAttribute("products", productService.showReqProducts(request.trim(), mapped, withpic, model));
        return "pages/supplier";
    }

    @GetMapping("/orders")
    private String orders(Model model, @RequestParam String request) {
        model.addAttribute("url", "orders");
        model.addAttribute("orders", orderService.showAcceptedOrders(request));
        return "pages/supplier";
    }

    @PostMapping("/updateDB")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String loadCSV(@RequestParam("file") MultipartFile file, Model model, @AuthenticationPrincipal User user)
    {
        productMatcher.updateProductDB(file);
        //catalogParser.parseBase(file);
        //catalogParser.parseBrandProducts(file);
        model.addAttribute("url", "db");
        return "pages/supplier";
    }

    /*@PostMapping("/match-products")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String matchProducts(Model model)
    {
        productMatcher.matchProducts();
        model.addAttribute("url", "db");
        return "pages/supplier";
    }*/
    @PostMapping("/xxx")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String matchDuplicates(Model model)
    {
        productMatcher.xxx();
        model.addAttribute("url", "db");
        return "pages/supplier";
    }

    @PostMapping("/pics")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String checkProductPics(Model model)
    {
        catalogParser.parseRusBT();
        model.addAttribute("url", "db");
        return "pages/supplier";
    }
}
