package iipu.shop.model.component;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "power_unit")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class PowerUnit extends Component {

    @Column(name = "power", nullable = false)
    private double power;

    @Column(name = "certificate", nullable = false)
    private String certificate;

    @Column(name = "pfc", nullable = false)
    private String pfc;

    @Column(name = "efficiency", nullable = false)
    private double efficiency;

    @Column(name = " standard", nullable = false)
    private String standard;

    @Column(name = "height", nullable = false)
    private double height;

    @Column(name = "width", nullable = false)
    private double width;

    @Column(name = "depth", nullable = false)
    private double depth;

    @Override
    public String toString() {
        return getProducer() + " " + getModel();
    }

    @Override
    public String info() {
        return power + ", " + certificate + ", " + pfc + ", " + efficiency
                + ", " + standard + ", " + height + ", " + width + ", " + depth;
    }
}
