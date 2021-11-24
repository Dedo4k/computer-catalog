package iipu.shop.model.component;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "computer_case")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class ComputerCase extends Component{

    @Column(name = "case_type", nullable = false)
    private String caseType;

    @Column(name = "colour", nullable = false)
    private String colour;

    @Column(name = "material", nullable = false)
    private String material;

    @Column(name = "section_number", nullable = false)
    private int sectionNumber;

    @Column(name = "compatible_motherboards", nullable = false)
    private String compatible_motherboards;

    @Column(name = "max_power_unit_width", nullable = false)
    private int maxPowerUnitWidth;

    @Column(name = "max_graphics_card_width", nullable = false)
    private int maxGraphicsCardWidth;

    @Column(name = "height", nullable = false)
    private int height;

    @Column(name = "width", nullable = false)
    private int width;

    @Column(name = "depth", nullable = false)
    private int depth;

    @Column(name = "weight", nullable = false)
    private double weight;

    @Override
    public String toString() {
        return getProducer() + " " + getModel();
    }

    @Override
    public String info() {
        return caseType + ", " + colour + ", " + material + ", " + sectionNumber + ", " + compatible_motherboards + ", "
                + maxPowerUnitWidth + ", " + height + "/" + width + "/" + depth + ", " + weight;
    }
}
