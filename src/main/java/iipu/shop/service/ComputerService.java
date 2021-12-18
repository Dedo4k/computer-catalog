package iipu.shop.service;

import iipu.shop.model.Computer;

public interface ComputerService {

    Computer addComponentById(long id, String component, long componentId);

    boolean checkByIdIfNotEmpty(long id);

    void deleteComponentFromComputer(long id, String component);
}
