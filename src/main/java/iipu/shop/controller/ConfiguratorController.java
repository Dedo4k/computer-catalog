package iipu.shop.controller;

import iipu.shop.model.Computer;
import iipu.shop.model.User;
import iipu.shop.repository.ComputerRepository;
import iipu.shop.service.ComputerServiceImpl;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ConfiguratorController {

    private final ComputerRepository computerRepository;
    private final ComputerServiceImpl computerService;

    public ConfiguratorController(ComputerRepository computerRepository, ComputerServiceImpl computerService) {
        this.computerRepository = computerRepository;
        this.computerService = computerService;
    }

    @GetMapping("/config")
    public String configurator(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("computers", computerRepository.findAllByUser(user));
        return "configurator";
    }

    @GetMapping("/config/computer/{id}")
    public String computer(@PathVariable long id, Model model) {
        model.addAttribute("computer", computerRepository.getById(id));
        return "computer";
    }

    @GetMapping("/config/computer/{id}/edit")
    public String editComputer(@PathVariable long id, Model model) {
        model.addAttribute("computer", computerRepository.getById(id));
        return "computer_edit";
    }

    @PostMapping("/config/computer/new")
    public String newComputer(@AuthenticationPrincipal User user, @RequestParam("title") String title, Model model) {
        Computer computer = new Computer();
        computer.setUser(user);
        computer.setTitle(title);
        computerRepository.save(computer);
        model.addAttribute("computer", computer);
        return "computer_menu";
    }

    @PostMapping("/config/computer/{id}/{component}/delete")
    public String deleteComponent(@PathVariable String component, @PathVariable long id) {
        computerService.deleteComponentFromComputer(id, component);
        return "redirect:/config/computer/" + id + "/edit";
    }

    @PostMapping("/config/computer/{id}/{component}/{component_id}/add")
    public String addComponent(@PathVariable long id, @PathVariable String component, @PathVariable long component_id, HttpServletRequest request, Model model) {
        model.addAttribute("computer", computerService.addComponentById(id, component, component_id));
        if (computerService.checkByIdIfNotEmpty(id)) {
            request.getSession().removeAttribute("computer_id");
            return "redirect:/config";
        }
        return "computer_menu";
    }

    @PostMapping("/config/computer/{id}/delete")
    public String deleteComputer(@PathVariable long id, HttpServletRequest request) {
        request.getSession().removeAttribute("computer_id");
        computerRepository.deleteById(id);
        return "redirect:/config";
    }
}
