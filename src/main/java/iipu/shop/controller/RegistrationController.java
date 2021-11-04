package iipu.shop.controller;

import iipu.shop.enumeration.ExceptionMessage;
import iipu.shop.enumeration.UserRole;
import iipu.shop.model.User;
import iipu.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String signUp(Model model) {
        return "registration";
    }

    @PostMapping("/sign-up")
    public String createUser(User user, String confirm, Model model) {
        if (userRepository.findUserByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("error",
                    String.format(ExceptionMessage.MAIL_IS_TAKEN.toString(), user.getEmail()));
            model.addAttribute("user", user);
            return "registration";
        }

        if (!user.getPassword().equals(confirm)) {
            model.addAttribute("error",
                    String.format(ExceptionMessage.INVALID_CONFIRM_PASSWORD.toString(), user.getEmail()));
            model.addAttribute("user", user);
            return "registration";
        }

        user.setActive(true);
        user.setRole(UserRole.USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);

        return "redirect:/sign-in";
    }
}
