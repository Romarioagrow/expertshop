package expertshop.controllers;
import expertshop.domain.User;
import expertshop.repos.OrderRepo;
import expertshop.repos.UserRepo;
import expertshop.services.OrderService;
import expertshop.services.UserService;
import expertshop.util.ControllerService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.validation.Valid;
import java.util.Map;

@Log
@Controller
@AllArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final OrderService orderService;
    private final OrderRepo orderRepo;
    private final UserRepo userRepo;

    @GetMapping("/registration")
    public String registrationPage(Model model) {
        model.addAttribute("order", orderService.getSessionOrder());
        model.addAttribute("sessionID", orderService.getSessionID());
        return "pages/registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid User user, BindingResult validResult, Model model, @RequestParam String sessionID, @RequestParam String passwordConfirm) {
        model.addAttribute("sessionID", orderService.getSessionID());

        if (validResult.hasErrors())
        {
            Map<String, String> validErrors = ControllerService.getValidErrors(validResult);
            model.mergeAttributes(validErrors);
            model.addAttribute("user", user);
            return "pages/registration";
        }
        else
        {
            if (!userService.registerUser(user, sessionID, passwordConfirm, model)) {
                return "pages/registration";
            }
            else return "redirect:/user/login";
        }
    }

    @GetMapping("/login")
    public String loginPage(Model model, @AuthenticationPrincipal User user)
    {
        model.addAttribute("order", orderService.resolveOrder(user));
        return "pages/login";
    }

    @GetMapping("/cabinet")
    public String userCabinet(Model model, @AuthenticationPrincipal User user)
    {
        User reloadUser = userRepo.findByUserID(user.getUserID());
        log.info(reloadUser.getBonus().toString());
        log.info(user.getBonus().toString());
        model.addAttribute("bonus", reloadUser.getBonus().toString());
        model.addAttribute("orders", orderService.showUserOrders(user.getUserID()));
        model.addAttribute("completedOrders", orderRepo.findAllByUserIDAndCompletedTrue(user.getUserID()));
        return "pages/cabinet";
    }
}
