package iipu.shop.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class ComputerCase {

    private String caseType;

    private String colour;

    private String material;

    private int numberOfSections;
}
