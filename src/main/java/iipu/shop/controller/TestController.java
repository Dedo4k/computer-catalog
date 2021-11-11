package iipu.shop.controller;

import iipu.shop.model.User;
import iipu.shop.model.component.Component;
import iipu.shop.model.component.GraphicsCard;
import iipu.shop.model.component.Processor;
import iipu.shop.repository.ComponentRepository;
import iipu.shop.repository.GraphicsCardRepository;
import iipu.shop.repository.MotherBoardRepository;
import iipu.shop.repository.ProcessorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestController {

    private final ComponentRepository componentRepository;
    private final ProcessorRepository processorRepository;
    private final GraphicsCardRepository graphicsCardRepository;
    private final MotherBoardRepository motherBoardRepository;

    @Autowired
    public TestController(ComponentRepository componentRepository, ProcessorRepository processorRepository, GraphicsCardRepository graphicsCardRepository, MotherBoardRepository motherBoardRepository) {
        this.componentRepository = componentRepository;
        this.processorRepository = processorRepository;
        this.graphicsCardRepository = graphicsCardRepository;
        this.motherBoardRepository = motherBoardRepository;
    }

    @GetMapping("/add")
    public String add(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("mother", motherBoardRepository.findAll());
//        Processor processor = new Processor();
//        processor.setModel("intel");
//        processor.setCore("core-i7");
//        processor.setMaxFreq(4.4);
//        processor.setMinFreq(3.0);
//        processor.setSocket("sata");
//        processor.setProducer("qwewqe");
//        processor.setPrice(20.3);
//
//        Review review1 = new Review();
//        review1.setText("Cool");
//        review1.setComponent(processor);
//        review1.setUser(user);
//        processor.addReview(review1);
//        Review review2 = new Review();
//        review2.setText("NIce");
//        review2.setComponent(processor);
//        review2.setUser(user);
//        processor.addReview(review2);
//
//        componentRepository.save(processor);
//
//        GraphicsCard graphicsCard = new GraphicsCard();
//        graphicsCard.setModel("nvidea");
//        graphicsCard.setVideoMemory(8);
//        graphicsCard.setGpuModel("asd");
//        graphicsCard.setGpuProducer("sasda");
//        graphicsCard.setVideoMemoryType("sss");
//        graphicsCard.setProducer("sss");
//        graphicsCard.setPrice(14.6);
//        Review review3 = new Review();
//        review3.setText("Insane");
//        review3.setComponent(graphicsCard);
//        review3.setUser(user);
//        graphicsCard.addReview(review3);
//
//        componentRepository.save(graphicsCard);
//
//        Processor processor1 = new Processor();
//        processor1.setModel("amd");
//        processor1.setCore("ryzen-7");
//        processor1.setSocket("nmve");
//        processor1.setProducer("ssasaas");
//        processor1.setMinFreq(2.0);
//        processor1.setMaxFreq(5.0);
//        processor1.setPrice(43);
//        Review review4 = new Review();
//        review4.setText("Bad");
//        review4.setComponent(processor1);
//        review4.setUser(user);
//        processor1.addReview(review4);
//        componentRepository.save(processor1);

        List<Component> components = componentRepository.findAll();
        components.forEach(System.out::println);

        List<Processor> processors = processorRepository.findAll();
        processors.forEach(System.out::println);

        List<GraphicsCard> graphicsCards = graphicsCardRepository.findAll();
        graphicsCards.forEach(System.out::println);

        return "test";
    }
}
