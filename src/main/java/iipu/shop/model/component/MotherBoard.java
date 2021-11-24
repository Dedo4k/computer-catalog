package iipu.shop.model.component;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "mother_board")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class MotherBoard extends Component {

    @Column(name = "socket", nullable = false)
    private String socket;

    @Column(name = "form_factor", nullable = false)
    private String formFactor;

    @Column(name = "memory_type", nullable = false)
    private String memoryType;

    @Column(name = "memory_slots", nullable = false)
    private int memorySlots;

    @Column(name = "pci_version", nullable = false)
    private String PCIVersion;

    @Column(name = "m_two", nullable = false)
    private int mTwo;

    @Column(name = "chipset", nullable = false)
    private int chipset;

    @Column(name = "length", nullable = false)
    private int length;

    @Column(name = "width", nullable = false)
    private int width;

    @Override
    public String toString() {
        return getProducer() + " " + getModel();
    }

    @Override
    public String info() {
        return socket + ", " + formFactor + ", " + memoryType + ", " + memorySlots + ", "
                + PCIVersion + ", " + mTwo + ", " + chipset + ", " + length + ", " + width;
    }
}
