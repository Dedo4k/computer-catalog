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

    private final RamRepository ramRepository;
    private final SsdRepository ssdRepository;
    private final HddRepository hddRepository;
    private final PowerUnitRepository powerUnitRepository;
    private final ProcessorRepository processorRepository;
    private final MotherBoardRepository motherBoardRepository;
    private final GraphicsCardRepository graphicsCardRepository;
    private final ComputerCaseRepository computerCaseRepository;

    @Autowired
    public ComponentServiceImpl(HddRepository hddRepository,
                                RamRepository ramRepository,
                                SsdRepository ssdRepository,
                                ProcessorRepository processorRepository,
                                PowerUnitRepository powerUnitRepository,
                                MotherBoardRepository motherBoardRepository,
                                GraphicsCardRepository graphicsCardRepository,
                                ComputerCaseRepository computerCaseRepository) {
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
            case "rams": {
                Set<String> memory_types = ramRepository.findAll().stream().map(Ram::getType).collect(Collectors.toSet());
                Set<Integer> capacity = ramRepository.findAll().stream().map(Ram::getCapacity).collect(Collectors.toSet());
                Set<Integer> module_set = ramRepository.findAll().stream().map(Ram::getModuleSet).collect(Collectors.toSet());
                Set<String> producers = ramRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                model.addAttribute("rams", ramRepository.findAll());
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("module_set", module_set.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("memory_types_set", memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "hdds": {
                Set<Integer> capacity = hddRepository.findAll().stream().map(Hdd::getCapacity).collect(Collectors.toSet());
                Set<Integer> buffer_size = hddRepository.findAll().stream().map(Hdd::getBufferSize).collect(Collectors.toSet());
                Set<String> form_factors = hddRepository.findAll().stream().map(Hdd::getFormFactor).collect(Collectors.toSet());
                Set<String> producers = hddRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> hdd_interface = hddRepository.findAll().stream().map(Hdd::getHddInterface).collect(Collectors.toSet());
                model.addAttribute("hdds", hddRepository.findAll());
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("buffer_size_set", buffer_size.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("hdd_interfaces_set", hdd_interface.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "ssds": {
                Set<Integer> capacity = ssdRepository.findAll().stream().map(Ssd::getCapacity).collect(Collectors.toSet());
                Set<String> form_factors = ssdRepository.findAll().stream().map(Ssd::getFormFactor).collect(Collectors.toSet());
                Set<String> producers = ssdRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> controllers = ssdRepository.findAll().stream().map(Ssd::getController).collect(Collectors.toSet());
                Set<String> microchips = ssdRepository.findAll().stream().map(Ssd::getMicrochipType).collect(Collectors.toSet());
                Set<String> ssd_interface = ssdRepository.findAll().stream().map(Ssd::getSsdInterface).collect(Collectors.toSet());
                model.addAttribute("ssds", ssdRepository.findAll());
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("controllers_set", controllers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("microchips_set", microchips.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("ssd_interfaces_set", ssd_interface.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "cases": {
                Set<String> types = computerCaseRepository.findAll().stream().map(ComputerCase::getCaseType).collect(Collectors.toSet());
                Set<String> colours = computerCaseRepository.findAll().stream().map(ComputerCase::getColour).collect(Collectors.toSet());
                Set<String> producers = computerCaseRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> material = computerCaseRepository.findAll().stream().map(ComputerCase::getMaterial).collect(Collectors.toSet());
                Set<Integer> sections = computerCaseRepository.findAll().stream().map(ComputerCase::getSectionNumber).collect(Collectors.toSet());
                model.addAttribute("cases", computerCaseRepository.findAll());
                model.addAttribute("types_set", types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("colours_set", colours.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("materials_set", material.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sections_set", sections.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "processors": {
                Set<String> cores = processorRepository.findAll().stream().map(Processor::getCore).collect(Collectors.toSet());
                Set<String> sockets = processorRepository.findAll().stream().map(Processor::getSocket).collect(Collectors.toSet());
                Set<String> producers = processorRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> crystal_name = processorRepository.findAll().stream().map(Processor::getCrystalName).collect(Collectors.toSet());
                Set<Integer> core_numbers = processorRepository.findAll().stream().map(Processor::getCoreNumber).collect(Collectors.toSet());
                model.addAttribute("processors", processorRepository.findAll());
                model.addAttribute("cores_set", cores.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sockets_set", sockets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("crystal_names_set", crystal_name.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("core_numbers_set", core_numbers.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "power_units": {
                Set<Double> power = powerUnitRepository.findAll().stream().map(PowerUnit::getPower).collect(Collectors.toSet());
                Set<String> producers = powerUnitRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> certificates = powerUnitRepository.findAll().stream().map(PowerUnit::getCertificate).collect(Collectors.toSet());
                Set<String> pfcs = powerUnitRepository.findAll().stream().map(PowerUnit::getPfc).collect(Collectors.toSet());
                Set<String> standards = powerUnitRepository.findAll().stream().map(PowerUnit::getStandard).collect(Collectors.toSet());
                model.addAttribute("power_units", powerUnitRepository.findAll());
                model.addAttribute("pfcs_set", pfcs.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("power_set", power.stream().sorted(Comparator.comparing(Double::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("standards_set", standards.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("certificates_set", certificates.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "mother_boards": {
                Set<Integer> m_twos = motherBoardRepository.findAll().stream().map(MotherBoard::getMTwo).collect(Collectors.toSet());
                Set<String> sockets = motherBoardRepository.findAll().stream().map(MotherBoard::getSocket).collect(Collectors.toSet());
                Set<String> pci_versions = motherBoardRepository.findAll().stream().map(MotherBoard::getPCIVersion).collect(Collectors.toSet());
                Set<String> chipsets = motherBoardRepository.findAll().stream().map(MotherBoard::getChipset).collect(Collectors.toSet());
                Set<String> producers = motherBoardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> form_factors = motherBoardRepository.findAll().stream().map(MotherBoard::getFormFactor).collect(Collectors.toSet());
                Set<Integer> memory_slots = motherBoardRepository.findAll().stream().map(MotherBoard::getMemorySlots).collect(Collectors.toSet());
                Set<String> video_memory_types = motherBoardRepository.findAll().stream().map(MotherBoard::getMemoryType).collect(Collectors.toSet());
                model.addAttribute("mother_boards", motherBoardRepository.findAll());
                model.addAttribute("m_twos_set", m_twos.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sockets_set", sockets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("pci_versions_set", pci_versions.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("chipsets_set", chipsets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("memory_slots_set", memory_slots.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_types_set", video_memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "graphics_cards": {
                Set<String> producers = graphicsCardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> gpu_models = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuModel).collect(Collectors.toSet());
                Set<String> gpu_producers = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuProducer).collect(Collectors.toSet());
                Set<Integer> video_memories = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemory).collect(Collectors.toSet());
                Set<String> gpu_interfaces = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuInterface).collect(Collectors.toSet());
                Set<String> video_memory_types = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemoryType).collect(Collectors.toSet());
                model.addAttribute("graphics_cards", graphicsCardRepository.findAll());
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_models_set", gpu_models.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_producers_set", gpu_producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_interfaces_set", gpu_interfaces.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_set", video_memories.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_types_set", video_memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
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
            case "ccase": {
                model.addAttribute("ccase", computerCaseRepository.findById(id).get());
                break;
            }
            case "processor": {
                model.addAttribute("processor", processorRepository.findById(id).get());
                break;
            }
            case "power_unit": {
                model.addAttribute("power_unit", powerUnitRepository.findById(id).get());
                break;
            }
            case "mother_board": {
                model.addAttribute("mother_board", motherBoardRepository.findById(id).get());
                break;
            }
            case "graphics_card": {
                model.addAttribute("graphics_card", graphicsCardRepository.findById(id).get());
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
                        case "core_number": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp3.stream()
                                            .filter(component1 -> ((Processor) component1).getCoreNumber() == Integer.parseInt(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
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
                        case "crystal_name": {
                            final List<Component> temp7 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp7.stream()
                                        .filter(component1 -> ((Processor) component1).getCrystalName().equals(filteredValue))
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
                                    .filter(component1 -> ((Processor) component1).getMinFreq() >= finalMinFreq)
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
                                    .filter(component1 -> ((Processor) component1).getMaxFreq() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_thermal_power": {
                            final List<Component> temp8 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp8);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp8);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp8.stream()
                                    .filter(component1 -> ((Processor) component1).getThermalPower() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_thermal_power": {
                            final List<Component> temp9 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp9);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp9);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp9.stream()
                                    .filter(component1 -> ((Processor) component1).getThermalPower() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
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
                    }
                }
                Set<String> cores = processorRepository.findAll().stream().map(Processor::getCore).collect(Collectors.toSet());
                Set<String> sockets = processorRepository.findAll().stream().map(Processor::getSocket).collect(Collectors.toSet());
                Set<String> producers = processorRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> crystal_name = processorRepository.findAll().stream().map(Processor::getCrystalName).collect(Collectors.toSet());
                Set<Integer> core_numbers = processorRepository.findAll().stream().map(Processor::getCoreNumber).collect(Collectors.toSet());
                model.addAttribute("processors", filteredComponent);
                model.addAttribute("cores_set", cores.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sockets_set", sockets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("crystal_names_set", crystal_name.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("core_numbers_set", core_numbers.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
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
                        case "gpu_interface": {
                            final List<Component> temp7 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp7.stream()
                                        .filter(component1 -> ((GraphicsCard) component1).getGpuInterface().equals(filteredValue))
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
                        case "min_height": {
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
                                    .filter(component1 -> ((GraphicsCard) component1).getHeight() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_height": {
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
                                    .filter(component1 -> ((GraphicsCard) component1).getHeight() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_length": {
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
                                    .filter(component1 -> ((GraphicsCard) component1).getLength() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_length": {
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
                                    .filter(component1 -> ((GraphicsCard) component1).getLength() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                    }
                }
                Set<String> producers = graphicsCardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> gpu_models = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuModel).collect(Collectors.toSet());
                Set<String> gpu_producers = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuProducer).collect(Collectors.toSet());
                Set<Integer> video_memories = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemory).collect(Collectors.toSet());
                Set<String> gpu_interfaces = graphicsCardRepository.findAll().stream().map(GraphicsCard::getGpuInterface).collect(Collectors.toSet());
                Set<String> video_memory_types = graphicsCardRepository.findAll().stream().map(GraphicsCard::getVideoMemoryType).collect(Collectors.toSet());
                model.addAttribute("graphics_cards", filteredComponent);
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_models_set", gpu_models.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_producers_set", gpu_producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("gpu_interfaces_set", gpu_interfaces.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_set", video_memories.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_types_set", video_memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "mother_boards": {
                filteredComponent.addAll(motherBoardRepository.findAll());
                for (String key : keys) {
                    switch (key) {
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
                        case "chipset": {
                            final List<Component> temp7 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp7.stream()
                                        .filter(component1 -> ((MotherBoard) component1).getChipset().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "pci_version": {
                            final List<Component> temp8 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp8.stream()
                                        .filter(component1 -> ((MotherBoard) component1).getPCIVersion().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
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
                        case "min_width": {
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
                                    .filter(component1 -> ((MotherBoard) component1).getWidth() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_width": {
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
                                    .filter(component1 -> ((MotherBoard) component1).getWidth() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_length": {
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
                                    .filter(component1 -> ((MotherBoard) component1).getLength() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_length": {
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
                                    .filter(component1 -> ((MotherBoard) component1).getLength() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                    }
                }
                Set<Integer> m_twos = motherBoardRepository.findAll().stream().map(MotherBoard::getMTwo).collect(Collectors.toSet());
                Set<String> sockets = motherBoardRepository.findAll().stream().map(MotherBoard::getSocket).collect(Collectors.toSet());
                Set<String> pci_versions = motherBoardRepository.findAll().stream().map(MotherBoard::getPCIVersion).collect(Collectors.toSet());
                Set<String> chipsets = motherBoardRepository.findAll().stream().map(MotherBoard::getChipset).collect(Collectors.toSet());
                Set<String> producers = motherBoardRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> form_factors = motherBoardRepository.findAll().stream().map(MotherBoard::getFormFactor).collect(Collectors.toSet());
                Set<Integer> memory_slots = motherBoardRepository.findAll().stream().map(MotherBoard::getMemorySlots).collect(Collectors.toSet());
                Set<String> video_memory_types = motherBoardRepository.findAll().stream().map(MotherBoard::getMemoryType).collect(Collectors.toSet());
                model.addAttribute("mother_boards", filteredComponent);
                model.addAttribute("m_twos_set", m_twos.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sockets_set", sockets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("pci_versions_set", pci_versions.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("chipsets_set", chipsets.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("memory_slots_set", memory_slots.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("video_memories_types_set", video_memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "rams": {
                filteredComponent.addAll(ramRepository.findAll());
                for (String key : keys) {
                    switch (key) {
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
                        case "module_set": {
                            final List<Component> temp6 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp6.stream()
                                            .filter(component1 -> ((Ram) component1).getModuleSet() == Integer.parseInt(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp6);
                            }
                            break;
                        }
                    }
                }
                Set<String> memory_types = ramRepository.findAll().stream().map(Ram::getType).collect(Collectors.toSet());
                Set<Integer> capacity = ramRepository.findAll().stream().map(Ram::getCapacity).collect(Collectors.toSet());
                Set<Integer> module_set = ramRepository.findAll().stream().map(Ram::getModuleSet).collect(Collectors.toSet());
                Set<String> producers = ramRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                model.addAttribute("rams", filteredComponent);
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("module_set", module_set.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("memory_types_set", memory_types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "ssds": {
                filteredComponent.addAll(ssdRepository.findAll());
                for (String key : keys) {
                    switch (key) {
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
                        case "controller": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp4.stream()
                                        .filter(component1 -> ((Ssd) component1).getController().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
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
                        case "microchip": {
                            final List<Component> temp9 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp9.stream()
                                        .filter(component1 -> ((Ssd) component1).getMicrochipType().equals(filteredValue))
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
                Set<Integer> capacity = ssdRepository.findAll().stream().map(Ssd::getCapacity).collect(Collectors.toSet());
                Set<String> form_factors = ssdRepository.findAll().stream().map(Ssd::getFormFactor).collect(Collectors.toSet());
                Set<String> producers = ssdRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> controllers = ssdRepository.findAll().stream().map(Ssd::getController).collect(Collectors.toSet());
                Set<String> microchips = ssdRepository.findAll().stream().map(Ssd::getMicrochipType).collect(Collectors.toSet());
                Set<String> ssd_interface = ssdRepository.findAll().stream().map(Ssd::getSsdInterface).collect(Collectors.toSet());
                model.addAttribute("ssds", filteredComponent);
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("controllers_set", controllers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("microchips_set", microchips.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("ssd_interfaces_set", ssd_interface.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "hdds": {
                filteredComponent.addAll(hddRepository.findAll());
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
                        case "capacity": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            try {
                                Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                    List<Component> components = temp3.stream()
                                            .filter(component1 -> ((Hdd) component1).getCapacity() == Integer.parseInt(filteredValue))
                                            .collect(Collectors.toList());
                                    filteredComponent.addAll(components);
                                });
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp3);
                            }
                            break;
                        }
                        case "buffer_size": {
                            final List<Component> temp5 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp5.stream()
                                        .filter(component1 -> ((Hdd) component1).getBufferSize() == Integer.parseInt(filteredValue))
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
                                        .filter(component1 -> ((Hdd) component1).getFormFactor().replace("\"", "").equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "hdd_interface": {
                            final List<Component> temp4 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp4.stream()
                                        .filter(component1 -> ((Hdd) component1).getHddInterface().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "min_rotation_speed": {
                            final List<Component> temp6 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp6);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp6);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp6.stream()
                                    .filter(component1 -> ((Hdd) component1).getRotationSpeed() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_rotation_speed": {
                            final List<Component> temp7 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp7);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp7);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp7.stream()
                                    .filter(component1 -> ((Hdd) component1).getRotationSpeed() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_thickness": {
                            final List<Component> temp8 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp8);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp8);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp8.stream()
                                    .filter(component1 -> ((Hdd) component1).getThickness() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_thickness": {
                            final List<Component> temp9 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp9);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp9);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp9.stream()
                                    .filter(component1 -> ((Hdd) component1).getThickness() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                    }
                }
                Set<Integer> capacity = hddRepository.findAll().stream().map(Hdd::getCapacity).collect(Collectors.toSet());
                Set<String> form_factors = hddRepository.findAll().stream().map(Hdd::getFormFactor).collect(Collectors.toSet());
                Set<Integer> buffer_size = hddRepository.findAll().stream().map(Hdd::getBufferSize).collect(Collectors.toSet());
                Set<String> producers = hddRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> hdd_interface = hddRepository.findAll().stream().map(Hdd::getHddInterface).collect(Collectors.toSet());
                model.addAttribute("hdds", filteredComponent);
                model.addAttribute("capacity_set", capacity.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("buffer_size_set", buffer_size.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("form_factors_set", form_factors.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("hdd_interfaces_set", hdd_interface.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "power_units": {
                filteredComponent.addAll(powerUnitRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "power": {
                            final List<Component> temp5 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp5.stream()
                                        .filter(component1 -> ((PowerUnit) component1).getPower() == Double.parseDouble(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
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
                        case "certificate": {
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((PowerUnit) component1).getCertificate().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "min_efficiency": {
                            final List<Component> temp6 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp6);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp6);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp6.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getEfficiency() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_efficiency": {
                            final List<Component> temp7 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp7);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp7);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp7.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getEfficiency() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "pfc": {
                            final List<Component> temp5 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp5.stream()
                                        .filter(component1 -> ((PowerUnit) component1).getPfc().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "standard": {
                            final List<Component> temp5 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp5.stream()
                                        .filter(component1 -> ((PowerUnit) component1).getStandard().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "min_height": {
                            final List<Component> temp10 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp10);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp10);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp10.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getHeight() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_height": {
                            final List<Component> temp11 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp11);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp11);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp11.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getHeight() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_width": {
                            final List<Component> temp12 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp12);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp12);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp12.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getWidth() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_width": {
                            final List<Component> temp13 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp13);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp13);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp13.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getWidth() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_depth": {
                            final List<Component> temp14 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp14);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp14);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp14.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getDepth() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_depth": {
                            final List<Component> temp15 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp15);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp15);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp15.stream()
                                    .filter(component1 -> ((PowerUnit) component1).getDepth() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                    }
                }
                Set<Double> power = powerUnitRepository.findAll().stream().map(PowerUnit::getPower).collect(Collectors.toSet());
                Set<String> producers = powerUnitRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> certificates = powerUnitRepository.findAll().stream().map(PowerUnit::getCertificate).collect(Collectors.toSet());
                Set<String> pfcs = powerUnitRepository.findAll().stream().map(PowerUnit::getPfc).collect(Collectors.toSet());
                Set<String> standards = powerUnitRepository.findAll().stream().map(PowerUnit::getStandard).collect(Collectors.toSet());
                model.addAttribute("power_units", filteredComponent);
                model.addAttribute("pfcs_set", pfcs.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("power_set", power.stream().sorted(Comparator.comparing(Double::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("standards_set", standards.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("certificates_set", certificates.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
            case "cases": {
                filteredComponent.addAll(computerCaseRepository.findAll());
                for (String key : keys) {
                    switch (key) {
                        case "type": {
                            final List<Component> temp5 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp5.stream()
                                        .filter(component1 -> ((ComputerCase) component1).getCaseType().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "colour": {
                            final List<Component> temp1 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp1.stream()
                                        .filter(component1 -> ((ComputerCase) component1).getColour().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "section": {
                            final List<Component> temp3 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp3.stream()
                                        .filter(component1 -> ((ComputerCase) component1).getSectionNumber() == Integer.parseInt(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
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
                        case "material": {
                            final List<Component> temp2 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            Arrays.asList(map.get(key)).forEach(filteredValue -> {
                                List<Component> components = temp2.stream()
                                        .filter(component1 -> ((ComputerCase) component1).getMaterial().equals(filteredValue))
                                        .collect(Collectors.toList());
                                filteredComponent.addAll(components);
                            });
                            break;
                        }
                        case "min_height": {
                            final List<Component> temp10 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp10);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp10);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp10.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getHeight() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_height": {
                            final List<Component> temp11 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp11);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp11);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp11.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getHeight() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_width": {
                            final List<Component> temp12 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp12);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp12);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp12.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getWidth() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_width": {
                            final List<Component> temp13 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp13);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp13);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp13.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getWidth() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_depth": {
                            final List<Component> temp14 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp14);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp14);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp14.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getDepth() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_depth": {
                            final List<Component> temp15 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp15);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp15);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp15.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getDepth() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                        case "min_weight": {
                            final List<Component> temp15 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] minFreqStr = map.get(key);
                            if (minFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp15);
                                break;
                            }
                            double minFreq = 0.0;
                            try {
                                minFreq = Double.parseDouble(minFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp15);
                            }
                            final double finalMinFreq = minFreq;
                            List<Component> components = temp15.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getWeight() >= finalMinFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components);
                            break;
                        }
                        case "max_weight": {
                            final List<Component> temp16 = new ArrayList<>(filteredComponent);
                            filteredComponent.clear();
                            String[] maxFreqStr = map.get(key);
                            if (maxFreqStr[0].equals("")) {
                                filteredComponent.addAll(temp16);
                                break;
                            }
                            double maxFreq = 0.0;
                            try {
                                maxFreq = Double.parseDouble(maxFreqStr[0]);
                            } catch (NumberFormatException ex) {
                                model.addAttribute("error", ExceptionMessage.NOT_DOUBLE_INPUT.toString());
                                filteredComponent.addAll(temp16);
                            }
                            final double finalMaxFreq = maxFreq;
                            List<Component> components1 = temp16.stream()
                                    .filter(component1 -> ((ComputerCase) component1).getWeight() <= finalMaxFreq)
                                    .collect(Collectors.toList());
                            filteredComponent.addAll(components1);
                            break;
                        }
                    }
                }
                Set<String> types = computerCaseRepository.findAll().stream().map(ComputerCase::getCaseType).collect(Collectors.toSet());
                Set<String> colours = computerCaseRepository.findAll().stream().map(ComputerCase::getColour).collect(Collectors.toSet());
                Set<String> producers = computerCaseRepository.findAll().stream().map(Component::getProducer).collect(Collectors.toSet());
                Set<String> material = computerCaseRepository.findAll().stream().map(ComputerCase::getMaterial).collect(Collectors.toSet());
                Set<Integer> sections = computerCaseRepository.findAll().stream().map(ComputerCase::getSectionNumber).collect(Collectors.toSet());
                model.addAttribute("cases", filteredComponent);
                model.addAttribute("types_set", types.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("colours_set", colours.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("materials_set", material.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                model.addAttribute("sections_set", sections.stream().sorted(Comparator.comparing(Integer::valueOf)).collect(Collectors.toList()));
                model.addAttribute("producers_set", producers.stream().sorted(Comparator.comparing(String::valueOf)).collect(Collectors.toList()));
                break;
            }
        }
        return "components/" + component;
    }
}
