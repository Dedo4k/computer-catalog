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

    @Override
    public String toString() {
        return getProducer() + " " + getModel();
    }

    @Override
    public String info() {
        return caseType + ", " + colour + ", " + material + ", " + sectionNumber;
    }
}
