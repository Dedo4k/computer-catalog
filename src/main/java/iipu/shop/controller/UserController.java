package iipu.shop.controller;

import iipu.shop.model.User;
import iipu.shop.repository.ComputerRepository;
import iipu.shop.repository.ReviewRepository;
import iipu.shop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;
    private final ComputerRepository computerRepository;

    @Autowired
    public UserController(UserRepository userRepository, ReviewRepository reviewRepository, ComputerRepository computerRepository) {
        this.userRepository = userRepository;
        this.reviewRepository = reviewRepository;
        this.computerRepository = computerRepository;
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

    @PostMapping("/user/{id}/comment/{commentId}/delete")
    public String deleteComment(@PathVariable Long id, @PathVariable Long commentId) {
        reviewRepository.deleteById(commentId);
        return "redirect:/user/" + id;
    }

    @PostMapping("/user/{id}/computer/{computerId}/delete")
    public String deleteComputer(@PathVariable Long id, @PathVariable Long computerId) {
        computerRepository.deleteById(computerId);
        return "redirect:/user/" + id;
    }
}
