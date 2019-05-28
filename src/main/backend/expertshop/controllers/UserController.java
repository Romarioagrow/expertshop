package expertshop.controllers;
import expertshop.domain.User;
import expertshop.services.OrderService;
import expertshop.services.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Log
@Controller
@AllArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final OrderService orderService;

    @GetMapping("/registration")
    public String registrationPage(Model model) {
        model.addAttribute("order", orderService.getCurrentOrder());
        return "pages/registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model)
    {
        if (!userService.registerUser(user))
        {
            log.info("User already exists!");
            model.put("message", "User exists!");
            return "pages/registration";
        }
        return "redirect:/user/login";
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("order", orderService.getCurrentOrder());
        return "pages/login";
    }

    @GetMapping("/cabinet")
    public String userCabinet(Model model) {
        model.addAttribute("order", orderService.getCurrentOrder());
        return "pages/cabinet";
    }
}