package iipu.shop.service;

import iipu.shop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.transaction.Transactional;

@Service
public class ComponentServiceImpl implements ComponentService {

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
    public ComponentServiceImpl(ComponentRepository componentRepository, ProcessorRepository processorRepository,
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

    @Transactional
    @Override
    public String getViewForComponents(String component, Model model) {
        switch (component) {
            case "processors": {
                model.addAttribute("processors", processorRepository.findAll());
                break;
            }
            case "graphics_cards": {
                model.addAttribute("graphics_cards", graphicsCardRepository.findAll());
                break;
            }
            case "mother_boards": {
                model.addAttribute("mother_boards", motherBoardRepository.findAll());
                break;
            }
            case "rams": {
                model.addAttribute("rams", ramRepository.findAll());
                break;
            }
            case "hdds": {
                model.addAttribute("hdds", hddRepository.findAll());
                break;
            }
            case "ssds": {
                model.addAttribute("ssds", ssdRepository.findAll());
                break;
            }
            case "power_units": {
                model.addAttribute("power_units", powerUnitRepository.findAll());
                break;
            }
            case "cases": {
                model.addAttribute("cases", computerCaseRepository.findAll());
                break;
            }
            default: {
                return "redirect:/catalog";
            }
        }
        return "components/" + component;
    }

    @Override
    public String getViewForComponentById(String component, Long id, Model model) {
        switch (component) {
            case "processor": {
                model.addAttribute("processor", processorRepository.findById(id).get());
                break;
            }
            case "graphics_card": {
                model.addAttribute("graphics_card", graphicsCardRepository.findById(id).get());
                break;
            }
            case "mother_board": {
                model.addAttribute("mother_board", motherBoardRepository.findById(id).get());
                break;
            }
            case "ram": {
                model.addAttribute("ram", ramRepository.findById(id).get());
                break;
            }
            case "hdd": {
                model.addAttribute("hdd", hddRepository.findById(id).get());
                break;
            }
            case "ssd": {
                model.addAttribute("ssd", ssdRepository.findById(id).get());
                break;
            }
            case "power_unit": {
                model.addAttribute("power_unit", powerUnitRepository.findById(id).get());
                break;
            }
            case "ccase": {
                model.addAttribute("ccase", computerCaseRepository.findById(id).get());
                break;
            }
            default: {
                return "redirect:/catalog";
            }
        }
        return "components/component/" + component;
    }
}
