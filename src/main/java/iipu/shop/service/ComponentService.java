package iipu.shop.service;

import org.springframework.ui.Model;

public interface ComponentService {

    String getViewForComponents(String component, Model model);

    String getViewForComponentToAdd(String components, Model model);

    String getViewForComponentById(String component, Long id, Model model);
}
