package iipu.shop.controller;

import iipu.shop.model.User;
import iipu.shop.model.component.Component;
import iipu.shop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CatalogController {

    private final ComponentRepository componentRepository;
    private final ProcessorRepository processorRepository;
    private final GraphicsCardRepository graphicsCardRepository;
    private final MotherBoardRepository motherBoardRepository;
    private final RamRepository ramRepository;
    private final SsdRepository ssdRepository;
    private final HddRepository hddRepository;
    private final PowerUnitRepository powerUnitRepository;
    private final ComputerCaseRepository computerCaseRepository;

    @Autowired
    public CatalogController(ComponentRepository componentRepository, ProcessorRepository processorRepository,
                             GraphicsCardRepository graphicsCardRepository,
                             MotherBoardRepository motherBoardRepository,
                             RamRepository ramRepository,
                             SsdRepository ssdRepository,
                             HddRepository hddRepository,
                             PowerUnitRepository powerUnitRepository,
                             ComputerCaseRepository computerCaseRepository) {
        this.componentRepository = componentRepository;
        this.processorRepository = processorRepository;
        this.graphicsCardRepository = graphicsCardRepository;
        this.motherBoardRepository = motherBoardRepository;
        this.ramRepository = ramRepository;
        this.ssdRepository = ssdRepository;
        this.hddRepository = hddRepository;
        this.powerUnitRepository = powerUnitRepository;
        this.computerCaseRepository = computerCaseRepository;
    }

    @GetMapping("/catalog")
    public String catalog(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("user", user);
        return "catalog";
    }

    @GetMapping("/catalog/{component}")
    public String componentsList(@PathVariable String component, Model model) {
        switch (component) {
            case "processors" : {
                model.addAttribute("title", "label.components.processors");
                model.addAttribute("components", processorRepository.findAll());
                break;
            }
            case "graphics_cards" : {
                model.addAttribute("title", "label.components.graphiccards");
                model.addAttribute("components", graphicsCardRepository.findAll());
                break;
            }
            case "mother_boards" : {
                model.addAttribute("title", "label.components.motherboards");
                model.addAttribute("components", motherBoardRepository.findAll());
                break;
            }
            case "rams" : {
                model.addAttribute("title", "label.components.rams");
                model.addAttribute("components", ramRepository.findAll());
                break;
            }
            case "hdds" : {
                model.addAttribute("title", "label.components.hdds");
                model.addAttribute("components", hddRepository.findAll());
                break;
            }
            case "ssds" : {
                model.addAttribute("title", "label.components.ssds");
                model.addAttribute("components", ssdRepository.findAll());
                break;
            }
            case "power_units" : {
                model.addAttribute("title", "label.components.powerunits");
                model.addAttribute("components", powerUnitRepository.findAll());
                break;
            }
            case "cases" : {
                model.addAttribute("title", "label.components.cases");
                model.addAttribute("components", computerCaseRepository.findAll());
                break;
            } default: {
                return "redirect:/catalog";
            }
        }
        return "components";
    }

    @GetMapping("/catalog/**/{id}")
    public String componentInfo(@PathVariable Long id, Model model) {
        Component component = componentRepository.findById(id).get();
        model.addAttribute("component", component);
        return "component/perspage";
    }
}
