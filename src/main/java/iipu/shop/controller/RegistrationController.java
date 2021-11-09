package iipu.shop.controller;

import iipu.shop.enumeration.ExceptionMessage;
import iipu.shop.enumeration.UserRole;
import iipu.shop.model.User;
import iipu.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class RegistrationController {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public RegistrationController(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/sign-up")
    public String signUp(@ModelAttribute("user") User user) {
        return "registration";
    }

    @PostMapping("/sign-up")
    public String createUser(@ModelAttribute("user") @Valid User user, BindingResult bindingResult, String confirm, Model model) {
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        if (userRepository.findUserByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("error",
                    String.format(ExceptionMessage.MAIL_IS_TAKEN.toString(), user.getEmail()));
            return "registration";
        }

        if (!user.getPassword().equals(confirm)) {
            model.addAttribute("error", ExceptionMessage.INVALID_CONFIRM_PASSWORD.toString());
            return "registration";
        }

        user.setActive(true);
        user.setRole(UserRole.USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);

        return "redirect:/sign-in";
    }
}
