package iipu.shop.controller;

import iipu.shop.model.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {

    @GetMapping({"/", "/main"})
    public String main(@AuthenticationPrincipal User user) {
        return "main";
    }
}