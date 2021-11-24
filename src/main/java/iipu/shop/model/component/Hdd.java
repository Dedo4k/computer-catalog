package iipu.shop.model.component;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "hdd")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class Hdd extends Component{

    @Column(name = "capacity", nullable = false)
    private int capacity;

    @Column(name = "form_factor", nullable = false)
    private String formFactor;

    @Column(name = "hdd_interface", nullable = false)
    private String hddInterface;

    @Column(name = "buffer_size", nullable = false)
    private int bufferSize;

    @Column(name = "rotation_speed", nullable = false)
    private int rotationSpeed;

    @Column(name = "thickness", nullable = false)
    private int thickness;

    @Override
    public String toString() {
        return getProducer() + " " + getModel() + " " + capacity + "Gb";
    }

    @Override
    public String info() {
        return formFactor + ", " + hddInterface + ", " + bufferSize + "Mb, " + rotationSpeed+ ", " + thickness;
    }
}
