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

    @Column(name = "certificate")
    private String certificate;

    @Column(name = "pfc")
    private String pfc;

    @Column(name = "efficiency")
    private String efficiency;

    @Column(name = " standard")
    private String standard;

    @Column(name = "height")
    private String height;

    @Column(name = "width")
    private String width;

    @Column(name = "depth")
    private String depth;

    @Override
    public String toString() {
        return getProducer() + " " + getModel();
    }

    @Override
    public String info() {
        return power + ", " + certificate + ", " + pfc +", " +efficiency
                +", " +standard+", " +height+", " +width+", " +depth;
    }
}
