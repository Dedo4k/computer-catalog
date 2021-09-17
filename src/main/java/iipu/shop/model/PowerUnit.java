package iipu.shop.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class PowerUnit extends Component {

    private double power;

    private String certificate;
}
