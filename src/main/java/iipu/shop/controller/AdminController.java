package iipu.shop.controller;

import iipu.shop.enumeration.UserRole;
import iipu.shop.repository.UserRepository;
import iipu.shop.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

    private final UserRepository userRepository;
    private final UserServiceImpl userService;

    @Autowired
    public AdminController(UserRepository userRepository, UserServiceImpl userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("admins", userRepository.findUsersByRole(UserRole.ADMIN));
        model.addAttribute("users", userRepository.findUsersByRole(UserRole.USER));
        return "admin";
    }

    @PostMapping("/admin/change_status/{user_id}")
    public String changeStatus(@PathVariable long user_id) {
        userService.changeStatusById(user_id);
        return "redirect:/admin";
    }
}
