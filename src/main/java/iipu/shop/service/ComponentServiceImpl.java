package iipu.shop.service;

import iipu.shop.enumeration.ExceptionMessage;
import iipu.shop.model.component.*;
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
                Set<String> producers = graphicsCardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> gpu_models = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuModel).collect(Collectors.toSet());
                Set<String> gpu_producers = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuProducer).collect(Collectors.toSet());
                Set<Integer> video_memories = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemory).collect(Collectors.toSet());
                Set<String> video_memory_types = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemoryType).collect(Collectors.toSet());
                model.addAttribute("graphics_cards", graphicsCardRepository.findAll());
                model.addAttribute("producers_set", producers);
                model.addAttribute("gpu_models_set", gpu_models);
                model.addAttribute("gpu_producers_set", gpu_producers);
                model.addAttribute("video_memories_set", video_memories);
                model.addAttribute("video_memories_types_set", video_memory_types);
                break;
            }
            case "mother_boards": {
                Set<String> producers = motherBoardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> form_factors = motherBoardRepository.findAll().stream().map(MotherBoard::getFormFactor).collect(Collectors.toSet());
                Set<String> sockets = motherBoardRepository.findAll().stream().map(MotherBoard::getSocket).collect(Collectors.toSet());
                Set<Integer> memory_slots = motherBoardRepository.findAll().stream().map(MotherBoard::getMemorySlots).collect(Collectors.toSet());
                Set<String> video_memory_types = motherBoardRepository.findAll().stream().map(MotherBoard::getMemoryType).collect(Collectors.toSet());
                Set<Integer> m_twos = motherBoardRepository.findAll().stream().map(MotherBoard::getMTwo).collect(Collectors.toSet());
                model.addAttribute("mother_boards", motherBoardRepository.findAll());
                model.addAttribute("producers_set", producers);
                model.addAttribute("form_factors_set", form_factors);
                model.addAttribute("sockets_set", sockets);
                model.addAttribute("memory_slots_set", memory_slots);
                model.addAttribute("video_memories_types_set", video_memory_types);
                model.addAttribute("m_twos_set", m_twos);
                break;
            }
            case "rams": {
                Set<String> producers = ramRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> memory_types = ramRepository.findAll().stream().map(Ram::getType).collect(Collectors.toSet());
                Set<Integer> capacity = ramRepository.findAll().stream().map(Ram::getCapacity).collect(Collectors.toSet());
                model.addAttribute("rams", ramRepository.findAll());
                model.addAttribute("producers_set", producers);
                model.addAttribute("memory_types_set", memory_types);
                model.addAttribute("capacity_set", capacity);
                break;
            }
            case "hdds": {
                model.addAttribute("hdds", hddRepository.findAll());
                break;
            }
            case "ssds": {
                Set<String> producers = ssdRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> form_factors = ssdRepository.findAll().stream().map(Ssd::getFormFactor).collect(Collectors.toSet());
                Set<Integer> capacity = ssdRepository.findAll().stream().map(Ssd::getCapacity).collect(Collectors.toSet());
                Set<String> ssd_interface = ssdRepository.findAll().stream().map(Ssd::getSsdInterface).collect(Collectors.toSet());
                model.addAttribute("ssds", ssdRepository.findAll());
                model.addAttribute("producers_set", producers);
                model.addAttribute("form_factors_set", form_factors);
                model.addAttribute("capacity_set", capacity);
                model.addAttribute("ssd_interfaces_set", ssd_interface);
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
        if (keys.isEmpty()) {
            return getViewForComponents(component, model);
        }
        switch (component) {
            case "processors": {
                filteredComponent.addAll(processorRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "producer": {
                            final List<Component> temp = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp.stream()
                                        .filter(component1 -> component1.getProducer().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "core": {
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((Processor) component1).getCore().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "socket": {
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
                        case "minFreq": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp3);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp3.stream()
                                    .filter(component1 -> ((Processor) component1).getMinFreq() >= finalMinFreq &&
                                            ((Processor) component1).getMaxFreq() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "maxFreq": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp4);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp4);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp4.stream()
                                    .filter(component1 -> ((Processor) component1).getMaxFreq() <= finalMaxFreq &&
                                            ((Processor) component1).getMinFreq() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
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
            case "graphics_cards": {
                filteredComponent.addAll(graphicsCardRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "producer": {
                            final List<Component> temp = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp.stream()
                                        .filter(component1 -> component1.getProducer().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "gpu_model": {
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((GraphicsCard) component1).getGpuModel().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "gpu_producer": {
                            final List<Component> temp2 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp2.stream()
                                        .filter(component1 -> ((GraphicsCard) component1).getGpuProducer().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "video_memory": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp3.stream()
                                            .filter(component1 -> ((GraphicsCard) component1).getVideoMemory() == Double.parseDouble(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            break;
                        }
                        case "video_memory_type": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp4.stream()
                                        .filter(component1 -> ((GraphicsCard) component1).getVideoMemoryType().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                    }
                }
                Set<String> producers = graphicsCardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> gpu_models = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuModel).collect(Collectors.toSet());
                Set<String> gpu_producers = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuProducer).collect(Collectors.toSet());
                Set<Integer> video_memories = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemory).collect(Collectors.toSet());
                Set<String> video_memory_types = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemoryType).collect(Collectors.toSet());
                model.addAttribute("graphics_cards", filteredComponent);
                model.addAttribute("producers_set", producers);
                model.addAttribute("gpu_models_set", gpu_models);
                model.addAttribute("gpu_producers_set", gpu_producers);
                model.addAttribute("video_memories_set", video_memories);
                model.addAttribute("video_memories_types_set", video_memory_types);
                break;
            }
            case "mother_boards": {
                filteredComponent.addAll(motherBoardRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "producer": {
                            final List<Component> temp = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp.stream()
                                        .filter(component1 -> component1.getProducer().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "form_factor": {
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((MotherBoard) component1).getFormFactor().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "socket": {
                            final List<Component> temp2 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp2.stream()
                                        .filter(component1 -> ((MotherBoard) component1).getSocket().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "memory_slots": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp3.stream()
                                            .filter(component1 -> ((MotherBoard) component1).getMemorySlots() == Integer.parseInt(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            break;
                        }
                        case "video_memory_type": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp4.stream()
                                        .filter(component1 -> ((MotherBoard) component1).getMemoryType().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "m_two": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp3.stream()
                                            .filter(component1 -> ((MotherBoard) component1).getMTwo() == Integer.parseInt(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            break;
                        }
                    }
                }
                Set<String> producers = motherBoardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> form_factors = motherBoardRepository.findAll().stream().map(MotherBoard::getFormFactor).collect(Collectors.toSet());
                Set<String> sockets = motherBoardRepository.findAll().stream().map(MotherBoard::getSocket).collect(Collectors.toSet());
                Set<Integer> memory_slots = motherBoardRepository.findAll().stream().map(MotherBoard::getMemorySlots).collect(Collectors.toSet());
                Set<String> video_memory_types = motherBoardRepository.findAll().stream().map(MotherBoard::getMemoryType).collect(Collectors.toSet());
                Set<Integer> m_twos = motherBoardRepository.findAll().stream().map(MotherBoard::getMTwo).collect(Collectors.toSet());
                model.addAttribute("mother_boards", filteredComponent);
                model.addAttribute("producers_set", producers);
                model.addAttribute("form_factors_set", form_factors);
                model.addAttribute("sockets_set", sockets);
                model.addAttribute("memory_slots_set", memory_slots);
                model.addAttribute("video_memories_types_set", video_memory_types);
                model.addAttribute("m_twos_set", m_twos);
                break;
            }
            case "rams": {
                filteredComponent.addAll(ramRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "producer": {
                            final List<Component> temp = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp.stream()
                                        .filter(component1 -> component1.getProducer().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "memory_type": {
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((Ram) component1).getType().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "capacity": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp3.stream()
                                            .filter(component1 -> ((Ram) component1).getCapacity() == Integer.parseInt(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            break;
                        }
                        case "minFreq": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp3);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp3.stream()
                                    .filter(component1 -> ((Ram) component1).getFreq() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "maxFreq": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp4);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp4);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp4.stream()
                                    .filter(component1 -> ((Ram) component1).getFreq() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                    }
                }
                Set<String> producers = ramRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> memory_types = ramRepository.findAll().stream().map(Ram::getType).collect(Collectors.toSet());
                Set<Integer> capacity = ramRepository.findAll().stream().map(Ram::getCapacity).collect(Collectors.toSet());
                model.addAttribute("rams", filteredComponent);
                model.addAttribute("producers_set", producers);
                model.addAttribute("memory_types_set", memory_types);
                model.addAttribute("capacity_set", capacity);
                break;
            }
            case "ssds": {
                filteredComponent.addAll(ssdRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "producer": {
                            final List<Component> temp = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp.stream()
                                        .filter(component1 -> component1.getProducer().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "form_factor": {
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((Ssd) component1).getFormFactor().replace("\"", "").equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "capacity": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp3.stream()
                                            .filter(component1 -> ((Ssd) component1).getCapacity() == Integer.parseInt(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            break;
                        }
                        case "ssd_interface": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp4.stream()
                                        .filter(component1 -> ((Ssd) component1).getSsdInterface().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "min_reading_speed": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp3);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp3.stream()
                                    .filter(component1 -> ((Ssd) component1).getReadingSpeed() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_reading_speed": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp4);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp4);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp4.stream()
                                    .filter(component1 -> ((Ssd) component1).getReadingSpeed() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_writing_speed": {
                            final List<Component> temp5 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp5);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp5);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp5.stream()
                                    .filter(component1 -> ((Ssd) component1).getWritingSpeed() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_writing_speed": {
                            final List<Component> temp6 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp6);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp6);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp6.stream()
                                    .filter(component1 -> ((Ssd) component1).getWritingSpeed() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                    }
                }
                Set<String> producers = ssdRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> form_factors = ssdRepository.findAll().stream().map(Ssd::getFormFactor).collect(Collectors.toSet());
                Set<Integer> capacity = ssdRepository.findAll().stream().map(Ssd::getCapacity).collect(Collectors.toSet());
                Set<String> ssd_interface = ssdRepository.findAll().stream().map(Ssd::getSsdInterface).collect(Collectors.toSet());
                model.addAttribute("ssds", filteredComponent);
                model.addAttribute("producers_set", producers);
                model.addAttribute("form_factors_set", form_factors);
                model.addAttribute("capacity_set", capacity);
                model.addAttribute("ssd_interfaces_set", ssd_interface);
                break;
            }
        }
        return "components/" + component;
    }
}
