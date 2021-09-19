package iipu.shop.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class MotherBoard {

       private String socket;

       private String formFactor;

       private String memoryType;

       private int memorySlots;

       private int versionOfPCI;

       private int m2;
}
