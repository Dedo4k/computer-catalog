package iipu.shop.controller;

import iipu.shop.model.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CatalogController {

    @GetMapping("/catalog")
    public String catalog(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("user", user);
        return "catalog";
    }
}
