package iipu.shop.controller;

import iipu.shop.model.User;
import iipu.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/user/{user_id}")
    public String userAccount(@PathVariable long user_id, Model model) {
        model.addAttribute("user", userRepository.getById(user_id));
        return "user";
    }

    @GetMapping("/user/{user_id}/edit")
    public String editUser(@PathVariable long user_id, Model model) {
        model.addAttribute("user", userRepository.getById(user_id));
        return "edit";
    }

    @PostMapping("/user/{user_id}/edit")
    public String saveUpdate(User user, @PathVariable long user_id) {
        User userToUpdate = userRepository.getById(user_id);
        userToUpdate.setFirstName(user.getFirstName());
        userToUpdate.setLastName(user.getLastName());
        userToUpdate.setEmail(user.getEmail());
        userRepository.save(userToUpdate);
        return "redirect:/user/" + user_id;
    }
}
