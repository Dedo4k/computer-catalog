package iipu.shop.controller;

import iipu.shop.model.Computer;
import iipu.shop.model.GraphicsCard;
import iipu.shop.model.Processor;
import iipu.shop.model.Ssd;
import iipu.shop.repository.ComputerRepository;
import iipu.shop.repository.ProcessorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test")
public class TestController {

    private final ComputerRepository computerRepository;
    private final ApplicationContext applicationContext;

    @Autowired
    public TestController(ComputerRepository computerRepository, ApplicationContext applicationContext) {
        this.computerRepository = computerRepository;
        this.applicationContext = applicationContext;
    }

    @GetMapping("/jsp")
    public String test(@RequestParam(required = false, defaultValue = "World!") String name , Model model) {
        model.addAttribute("name", name);
        Computer computer = new Computer();

        Processor processor = new Processor();
        processor.setCore("a");
        processor.setMaxFreq(4.4);
        processor.setMinFreq(3.0);
        processor.setModel("a");
        processor.setSocket("s");
        processor.setProducer("s");
        processor.setPrice(5.5);
        computer.setProcessor(processor);

        GraphicsCard graphicsCard = new GraphicsCard();
        graphicsCard.setModel("s");
        graphicsCard.setProducer("s");
        graphicsCard.setPrice(6.7);
        graphicsCard.setGpuModel("f");
        graphicsCard.setGpuProducer("y");
        graphicsCard.setVideoMemory(6);
        graphicsCard.setVideoMemoryType("t");
        computer.setGraphicsCard(graphicsCard);

        Ssd ssd = new Ssd();
        ssd.setController("r");
        ssd.setModel("y");
        ssd.setPrice(7.7);
        ssd.setCapacity(6);
        ssd.setProducer("h");
        ssd.setFormFactor("g");
        ssd.setReadingSpeed(2);
        ssd.setWritingSpeed(2);
        ssd.setSsdInterface("u");
        computer.setSsd(ssd);

        computerRepository.save(computer);
        return "test";
    }
}
