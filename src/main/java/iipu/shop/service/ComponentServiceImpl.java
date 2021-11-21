package iipu.shop.service;

import iipu.shop.model.component.Component;
import iipu.shop.model.component.Processor;
import iipu.shop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;

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
                Set<String> producers = processorRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> cores = processorRepository.findAll().stream().map(Processor::getCore).collect(Collectors.toSet());
                Set<String> sockets = processorRepository.findAll().stream().map(Processor::getSocket).collect(Collectors.toSet());
                model.addAttribute("processors", processorRepository.findAll());
                model.addAttribute("producers_set", producers);
                model.addAttribute("cores_set", cores);
                model.addAttribute("sockets_set", sockets);
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

    public String filter(String component, Map<String, String[]> map, Model model) {
        Set<String> keys = map.keySet();
        List<Component> filteredComponent = new ArrayList<>();
        switch (component) {
            case "processors": {
                if (keys.isEmpty()) {
                    return getViewForComponents(component, model);
                }
                filteredComponent.addAll(processorRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "producer":
                            final List<Component> temp = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp.stream()
                                        .filter(component1 -> component1.getProducer().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        case "core":
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((Processor) component1).getCore().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        case "socket":
                            final List<Component> temp2 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp2.stream()
                                        .filter(component1 -> ((Processor) component1).getSocket().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                    }
                }
                Set<String> producers = processorRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> cores = processorRepository.findAll().stream().map(Processor::getCore).collect(Collectors.toSet());
                Set<String> sockets = processorRepository.findAll().stream().map(Processor::getSocket).collect(Collectors.toSet());
                model.addAttribute("processors", filteredComponent);
                model.addAttribute("producers_set", producers);
                model.addAttribute("cores_set", cores);
                model.addAttribute("sockets_set", sockets);
                break;
            }
        }
        return "components/" + component;
    }
}
