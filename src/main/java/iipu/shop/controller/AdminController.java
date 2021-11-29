package iipu.shop.controller;

import iipu.shop.enumeration.ExceptionMessage;
import iipu.shop.enumeration.UserRole;
import iipu.shop.model.User;
import iipu.shop.model.component.Component;
import iipu.shop.model.component.Processor;
import iipu.shop.repository.ComponentRepository;
import iipu.shop.repository.UserRepository;
import iipu.shop.service.ComponentServiceImpl;
import iipu.shop.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
public class AdminController {

    private final UserRepository userRepository;
    private final UserServiceImpl userService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final ComponentServiceImpl componentService;
    private final ComponentRepository componentRepository;

    @Autowired
    public AdminController(UserRepository userRepository, UserServiceImpl userService, BCryptPasswordEncoder passwordEncoder, ComponentServiceImpl componentService, ComponentRepository componentRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.componentService = componentService;
        this.componentRepository = componentRepository;
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("admins", userRepository.findUsersByRole(UserRole.ADMIN));
        model.addAttribute("users", userRepository.findUsersByRole(UserRole.USER));
        return "admin";
    }

    @GetMapping("/admin/add")
    public String addAdmin(@ModelAttribute("user") User user) {
        return "admin_create";
    }

    @GetMapping("/admin/content")
    public String content(@RequestParam(value = "type", required = false) String type, Model model) {
        if (type != null) {
            componentService.getViewForComponents(type, model);
        } else {
            componentService.getViewForComponents("processors", model);
        }
        List<String> types = Arrays.asList("processors", "graphics_cards", "rams", "hdds", "ssds", "mother_boards", "power_units", "cases");
        model.addAttribute("types", types);
        return "content";
    }

    @GetMapping("/admin/content/new")
    public String newComponent(@RequestParam(value = "type") String type, Model model) {
        return componentService.getViewForComponentToAdd(type, model);
    }

    @PostMapping("/admin/{component}/new")
    public String addComponent(@PathVariable String component,
                               String producer, String model, String price,
                               String core, int coreNumber, String crystalName, String socket, String thermalPower, String minFreq, String maxFreq,
                               @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                               Model modell) {
        Component newComponent = null;
        switch (component) {
            case "processor": {
                Processor processor = new Processor();
                processor.setProducer(producer);
                processor.setModel(model);
                try {
                    processor.setPrice(Double.parseDouble(price));
                } catch (NumberFormatException ex) {
                    modell.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                    return "redirect:/admin/content/new";
                }
                processor.setCore(core);
                processor.setCoreNumber(coreNumber);
                processor.setSocket(socket);
                processor.setCrystalName(crystalName);
                try {
                    processor.setThermalPower(Integer.parseInt(thermalPower));
                } catch (NumberFormatException ex) {
                    modell.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                    return "redirect:/admin/content/new";
                }
                try {
                    processor.setMinFreq(Double.parseDouble(minFreq));
                } catch (NumberFormatException ex) {
                    modell.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                    return "redirect:/admin/content/new";
                }
                try {
                    processor.setMaxFreq(Double.parseDouble(maxFreq));
                } catch (NumberFormatException ex) {
                    modell.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                    return "redirect:/admin/content/new";
                }
                newComponent = processor;
                break;
            }
        }
        if (newComponent != null) {
            componentRepository.save(newComponent);
        }
        return "redirect:/admin/content";
    }

    @PostMapping("/admin/add")
    public String createAdmin(@ModelAttribute("user") @Valid User user, BindingResult bindingResult, String confirm, Model model) {
        if (bindingResult.hasErrors()) {
            return "admin_create";
        }

        if (userRepository.findUserByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("error",
                    String.format(ExceptionMessage.MAIL_IS_TAKEN.toString(), user.getEmail()));
            return "admin_create";
        }

        if (!user.getPassword().equals(confirm)) {
            model.addAttribute("error", ExceptionMessage.INVALID_CONFIRM_PASSWORD.toString());
            return "admin_create";
        }

        user.setActive(true);
        user.setRole(UserRole.ADMIN);
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);
        return "redirect:/admin";
    }

    @PostMapping("/admin/change_status/{user_id}")
    public String changeStatus(@PathVariable long user_id) {
        userService.changeStatusById(user_id);
        return "redirect:/admin";
    }

    @PostMapping("/admin/delete/{user_id}")
    public String deleteUser(@PathVariable long user_id) {
        userRepository.deleteById(user_id);
        return "redirect:/admin";
    }
}
