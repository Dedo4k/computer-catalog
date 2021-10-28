package iipu.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(name = "/")
public class MainPageController {

    @GetMapping("/main")
    public String main() {
        return "main";
    }
}
