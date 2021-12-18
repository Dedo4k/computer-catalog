package iipu.shop.service;

import iipu.shop.model.Computer;
import iipu.shop.repository.*;
import org.springframework.stereotype.Service;


@Service
public class ComputerServiceImpl implements ComputerService {

    private final ComputerRepository computerRepository;
    private final RamRepository ramRepository;
    private final SsdRepository ssdRepository;
    private final HddRepository hddRepository;
    private final PowerUnitRepository powerUnitRepository;
    private final ProcessorRepository processorRepository;
    private final MotherBoardRepository motherBoardRepository;
    private final GraphicsCardRepository graphicsCardRepository;
    private final ComputerCaseRepository computerCaseRepository;

    public ComputerServiceImpl(ComputerRepository computerRepository,
                               RamRepository ramRepository,
                               SsdRepository ssdRepository,
                               HddRepository hddRepository,
                               PowerUnitRepository powerUnitRepository,
                               ProcessorRepository processorRepository,
                               MotherBoardRepository motherBoardRepository,
                               GraphicsCardRepository graphicsCardRepository,
                               ComputerCaseRepository computerCaseRepository) {
        this.computerRepository = computerRepository;
        this.ramRepository = ramRepository;
        this.ssdRepository = ssdRepository;
        this.hddRepository = hddRepository;
        this.powerUnitRepository = powerUnitRepository;
        this.processorRepository = processorRepository;
        this.motherBoardRepository = motherBoardRepository;
        this.graphicsCardRepository = graphicsCardRepository;
        this.computerCaseRepository = computerCaseRepository;
    }

    @Override
    public Computer addComponentById(long id, String component, long componentId) {
        Computer computerToUpdate = computerRepository.getById(id);
        switch (component) {
            case "processor": {
                computerToUpdate.setProcessor(processorRepository.getById(componentId));
                break;
            }
            case "graphics_card": {
                computerToUpdate.setGraphicsCard(graphicsCardRepository.getById(componentId));
                break;
            }
            case "mother_board": {
                computerToUpdate.setMotherBoard(motherBoardRepository.getById(componentId));
                break;
            }
            case "ram": {
                computerToUpdate.setRam(ramRepository.getById(componentId));
                break;
            }
            case "ssd": {
                computerToUpdate.setSsd(ssdRepository.getById(componentId));
                break;
            }
            case "hdd": {
                computerToUpdate.setHdd(hddRepository.getById(componentId));
                break;
            }
            case "power_unit": {
                computerToUpdate.setPowerUnit(powerUnitRepository.getById(componentId));
                break;
            }
            case "ccase": {
                computerToUpdate.setComputerCase(computerCaseRepository.getById(componentId));
                break;
            }
            default: {
                return null;
            }
        }
        computerRepository.save(computerToUpdate);
        return computerToUpdate;
    }

    @Override
    public boolean checkByIdIfNotEmpty(long id) {
        Computer computerToCheck = computerRepository.getById(id);
        return computerToCheck.getProcessor() != null && computerToCheck.getGraphicsCard() != null && computerToCheck.getMotherBoard() != null && computerToCheck.getRam() != null && computerToCheck.getSsd() != null && computerToCheck.getHdd() != null && computerToCheck.getPowerUnit() != null && computerToCheck.getComputerCase() != null;
    }

    @Override
    public void deleteComponentFromComputer(long id, String component) {
        Computer computerToUpdate = computerRepository.getById(id);
        switch (component){
            case "processor":{
                computerToUpdate.setProcessor(null);
                break;
            }
            case "graphics_card":{
                computerToUpdate.setGraphicsCard(null);
                break;
            }
            case "mother_board":{
                computerToUpdate.setMotherBoard(null);
                break;
            }
            case "ram":{
                computerToUpdate.setRam(null);
                break;
            }
            case "ssd":{
                computerToUpdate.setSsd(null);
                break;
            }
            case "hdd":{
                computerToUpdate.setHdd(null);
                break;
            }
            case "power_unit":{
                computerToUpdate.setPowerUnit(null);
                break;
            }
            case "ccase":{
                computerToUpdate.setComputerCase(null);
                break;
            }
        }
        computerRepository.save(computerToUpdate);
    }
}
