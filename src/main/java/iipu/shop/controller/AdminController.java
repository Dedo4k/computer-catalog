package iipu.shop.controller;

import iipu.shop.enumeration.ExceptionMessage;
import iipu.shop.enumeration.UserRole;
import iipu.shop.model.User;
import iipu.shop.model.component.*;
import iipu.shop.repository.*;
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
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
public class AdminController {

    private final UserRepository userRepository;
    private final UserServiceImpl userService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final ComponentServiceImpl componentService;
    private final ComponentRepository componentRepository;
    private final ProcessorRepository processorRepository;
    private final SsdRepository ssdRepository;
    private final HddRepository hddRepository;
    private final GraphicsCardRepository graphicsCardRepository;
    private final RamRepository ramRepository;
    private final MotherBoardRepository motherBoardRepository;
    private final PowerUnitRepository powerUnitRepository;
    private final ComputerCaseRepository computerCaseRepository;

    @Autowired
    public AdminController(UserRepository userRepository,
                           UserServiceImpl userService,
                           BCryptPasswordEncoder passwordEncoder,
                           ComponentServiceImpl componentService,
                           ComponentRepository componentRepository,
                           ProcessorRepository processorRepository,
                           SsdRepository ssdRepository, HddRepository hddRepository, GraphicsCardRepository graphicsCardRepository, RamRepository ramRepository, MotherBoardRepository motherBoardRepository, PowerUnitRepository powerUnitRepository, ComputerCaseRepository computerCaseRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.componentService = componentService;
        this.componentRepository = componentRepository;
        this.processorRepository = processorRepository;
        this.ssdRepository = ssdRepository;
        this.hddRepository = hddRepository;
        this.graphicsCardRepository = graphicsCardRepository;
        this.ramRepository = ramRepository;
        this.motherBoardRepository = motherBoardRepository;
        this.powerUnitRepository = powerUnitRepository;
        this.computerCaseRepository = computerCaseRepository;
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

    @GetMapping("/admin/{component}/{id}/edit")
    public String editComponent(@PathVariable String component, @PathVariable long id, Model model) {
        return componentService.getViewForComponentToEdit(component, id, model);
    }

    @PostMapping("/admin/{component}/{id}/edit")
    public String saveUpdate(@PathVariable String component,
                             Processor processor,
                             GraphicsCard graphicsCard,
                             Ram ram,
                             Ssd ssd,
                             Hdd hdd,
                             PowerUnit powerUnit,
                             MotherBoard motherBoard,
                             ComputerCase computerCase,
                             @RequestParam("imageFile") MultipartFile imageFile,
                             @PathVariable long id,
                             Model model) {
        if (processor.getClass().getSimpleName().equalsIgnoreCase(component)) {
            Processor processorToUpdate = processorRepository.getById(id);
            processorToUpdate.setSocket(processor.getSocket());
            processorToUpdate.setPrice(processor.getPrice());
            processorToUpdate.setThermalPower(processor.getThermalPower());
            processorToUpdate.setMaxFreq(processor.getMaxFreq());
            processorToUpdate.setMinFreq(processor.getMinFreq());
            processorToUpdate.setCrystalName(processor.getCrystalName());
            processorToUpdate.setCore(processor.getCore());
            processorToUpdate.setProducer(processor.getProducer());
            processorToUpdate.setModel(processor.getModel());
            processorToUpdate.setCoreNumber(processor.getCoreNumber());
            if (!imageFile.isEmpty()) {
                try {
                    processorToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(processorToUpdate);
        }
        if (graphicsCard.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            GraphicsCard graphicsCardToUpdate = graphicsCardRepository.getById(id);
            graphicsCardToUpdate.setProducer(graphicsCard.getProducer());
            graphicsCardToUpdate.setModel(graphicsCard.getModel());
            graphicsCardToUpdate.setPrice(graphicsCard.getPrice());
            graphicsCardToUpdate.setVideoMemoryType(graphicsCard.getVideoMemoryType());
            graphicsCardToUpdate.setVideoMemory(graphicsCard.getVideoMemory());
            graphicsCardToUpdate.setGpuProducer(graphicsCard.getGpuProducer());
            graphicsCardToUpdate.setGpuModel(graphicsCard.getGpuModel());
            graphicsCardToUpdate.setGpuInterface(graphicsCard.getGpuInterface());
            graphicsCardToUpdate.setRecommendedPower(graphicsCard.getRecommendedPower());
            graphicsCardToUpdate.setHeight(graphicsCard.getHeight());
            graphicsCardToUpdate.setLength(graphicsCard.getLength());
            if (!imageFile.isEmpty()) {
                try {
                    graphicsCardToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(graphicsCardToUpdate);
        }
        if (ram.getClass().getSimpleName().equalsIgnoreCase(component)) {
            Ram ramToUpdate = ramRepository.getById(id);
            ramToUpdate.setModel(ram.getModel());
            ramToUpdate.setPrice(ram.getPrice());
            ramToUpdate.setProducer(ram.getProducer());
            ramToUpdate.setCapacity(ram.getCapacity());
            ramToUpdate.setFreq(ram.getFreq());
            ramToUpdate.setModuleSet(ram.getModuleSet());
            ramToUpdate.setType(ram.getType());
            if (!imageFile.isEmpty()) {
                try {
                    ramToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(ramToUpdate);
        }
        if (ssd.getClass().getSimpleName().equalsIgnoreCase(component)) {
            Ssd ssdToUpdate = ssdRepository.getById(id);
            ssdToUpdate.setController(ssd.getController());
            ssdToUpdate.setSsdInterface(ssd.getSsdInterface());
            ssdToUpdate.setMicrochipType(ssdToUpdate.getMicrochipType());
            ssdToUpdate.setModel(ssd.getModel());
            ssdToUpdate.setFormFactor(ssd.getFormFactor());
            ssdToUpdate.setProducer(ssd.getProducer());
            ssdToUpdate.setCapacity(ssd.getCapacity());
            ssdToUpdate.setPrice(ssd.getPrice());
            ssdToUpdate.setReadingSpeed(ssd.getReadingSpeed());
            ssdToUpdate.setWritingSpeed(ssd.getWritingSpeed());
            if (!imageFile.isEmpty()) {
                try {
                    ssdToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(ssdToUpdate);
        }
        if (hdd.getClass().getSimpleName().equalsIgnoreCase(component)) {
            Hdd hddToUpdate = hddRepository.getById(id);
            hddToUpdate.setCapacity(hdd.getCapacity());
            hddToUpdate.setFormFactor(hdd.getFormFactor());
            hddToUpdate.setModel(hdd.getModel());
            hddToUpdate.setPrice(hdd.getPrice());
            hddToUpdate.setProducer(hdd.getProducer());
            hddToUpdate.setHddInterface(hdd.getHddInterface());
            hddToUpdate.setBufferSize(hdd.getBufferSize());
            hddToUpdate.setRotationSpeed(hdd.getRotationSpeed());
            hddToUpdate.setThickness(hdd.getThickness());
            if (!imageFile.isEmpty()) {
                try {
                    hddToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(hddToUpdate);
        }
        if (motherBoard.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            MotherBoard motherBoardToUpdate = motherBoardRepository.getById(id);
            motherBoardToUpdate.setFormFactor(motherBoard.getFormFactor());
            motherBoardToUpdate.setLength(motherBoard.getLength());
            motherBoardToUpdate.setModel(motherBoard.getModel());
            motherBoardToUpdate.setSocket(motherBoard.getSocket());
            motherBoardToUpdate.setPrice(motherBoard.getPrice());
            motherBoardToUpdate.setProducer(motherBoard.getProducer());
            motherBoardToUpdate.setChipset(motherBoard.getChipset());
            motherBoardToUpdate.setMemorySlots(motherBoard.getMemorySlots());
            motherBoardToUpdate.setWidth(motherBoard.getWidth());
            motherBoardToUpdate.setMemoryType(motherBoard.getMemoryType());
            motherBoardToUpdate.setMTwo(motherBoard.getMTwo());
            if (!imageFile.isEmpty()) {
                try {
                    motherBoardToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(motherBoardToUpdate);
        }
        if (powerUnit.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            PowerUnit powerUnitToUpdate = powerUnitRepository.getById(id);
            powerUnitToUpdate.setPfc(powerUnit.getPfc());
            powerUnitToUpdate.setPower(powerUnit.getPower());
            powerUnitToUpdate.setHeight(powerUnit.getHeight());
            powerUnitToUpdate.setModel(powerUnit.getModel());
            powerUnitToUpdate.setPrice(powerUnit.getPrice());
            powerUnitToUpdate.setProducer(powerUnit.getProducer());
            powerUnitToUpdate.setCertificate(powerUnit.getCertificate());
            powerUnitToUpdate.setDepth(powerUnit.getDepth());
            powerUnitToUpdate.setEfficiency(powerUnit.getEfficiency());
            powerUnitToUpdate.setStandard(powerUnit.getStandard());
            powerUnitToUpdate.setWidth(powerUnit.getWidth());
            if (!imageFile.isEmpty()) {
                try {
                    powerUnitToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(powerUnitToUpdate);
        }
        if (computerCase.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            ComputerCase computerCaseToUpdate = computerCaseRepository.getById(id);
            computerCaseToUpdate.setCaseType(computerCase.getCaseType());
            computerCaseToUpdate.setDepth(computerCase.getDepth());
            computerCaseToUpdate.setHeight(computerCase.getHeight());
            computerCaseToUpdate.setColour(computerCase.getColour());
            computerCaseToUpdate.setModel(computerCase.getModel());
            computerCaseToUpdate.setPrice(computerCase.getPrice());
            computerCaseToUpdate.setProducer(computerCase.getProducer());
            computerCaseToUpdate.setCompatible_motherboards(computerCase.getCompatible_motherboards());
            computerCaseToUpdate.setMaterial(computerCase.getMaterial());
            computerCaseToUpdate.setMaxGraphicsCardWidth(computerCase.getMaxGraphicsCardWidth());
            computerCaseToUpdate.setMaxPowerUnitWidth(computerCase.getMaxPowerUnitWidth());
            computerCaseToUpdate.setSectionNumber(computerCase.getSectionNumber());
            computerCaseToUpdate.setWidth(computerCase.getWidth());
            computerCaseToUpdate.setWeight(computerCase.getWeight());
            if (!imageFile.isEmpty()) {
                try {
                    computerCaseToUpdate.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(computerCaseToUpdate);
        }
        return "redirect:/admin/content?type=" + component + 's';
    }

    @PostMapping("/admin/{component}/new")
    public String addComponent(@PathVariable String component,
                               Processor processor,
                               GraphicsCard graphicsCard,
                               Ram ram,
                               Ssd ssd,
                               Hdd hdd,
                               MotherBoard motherBoard,
                               PowerUnit powerUnit,
                               ComputerCase computerCase,
                               @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                               Model model) {
        if (processor.getClass().getSimpleName().equalsIgnoreCase(component)) {
            if (!imageFile.isEmpty()) {
                try {
                    processor.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(processor);
        }
        if (graphicsCard.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            if (!imageFile.isEmpty()) {
                try {
                    graphicsCard.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(graphicsCard);
        }
        if (ram.getClass().getSimpleName().equalsIgnoreCase(component)) {
            if (!imageFile.isEmpty()) {
                try {
                    ram.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(ram);
        }
        if (ssd.getClass().getSimpleName().equalsIgnoreCase(component)) {
            if (!imageFile.isEmpty()) {
                try {
                    ssd.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(ssd);
        }
        if (hdd.getClass().getSimpleName().equalsIgnoreCase(component)) {
            if (!imageFile.isEmpty()) {
                try {
                    hdd.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(hdd);
        }
        if (motherBoard.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            if (!imageFile.isEmpty()) {
                try {
                    motherBoard.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(motherBoard);
        }
        if (powerUnit.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            if (!imageFile.isEmpty()) {
                try {
                    powerUnit.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(powerUnit);
        }
        if (computerCase.getClass().getSimpleName().equalsIgnoreCase(component.replace("_", ""))) {
            if (!imageFile.isEmpty()) {
                try {
                    computerCase.setImage(imageFile.getBytes());
                } catch (IOException exception) {
                    exception.printStackTrace();
                }
            }
            componentRepository.save(computerCase);
        }
        return "redirect:/admin/content?type=" + component + 's';
    }

    @PostMapping("/admin/{component}/{id}/delete")
    public String deleteComponent(@PathVariable String component, @PathVariable long id) {
        componentRepository.deleteById(id);
        return "redirect:/admin/content?type=" + component + 's';
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
