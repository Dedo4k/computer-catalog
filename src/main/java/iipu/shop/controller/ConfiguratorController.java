package iipu.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConfiguratorController {

    @GetMapping("/config")
    public String configurator() {
        return "configurator";
    }
}
