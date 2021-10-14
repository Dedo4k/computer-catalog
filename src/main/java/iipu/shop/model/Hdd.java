package iipu.shop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "hdd")
@EqualsAndHashCode(callSuper = true)
public class Hdd extends Component{

    @Column(name = "capacity", nullable = false)
    private int capacity;

    @Column(name = "form_factor", nullable = false)
    private String formFactor;

    @Column(name = "hdd_interface", nullable = false)
    private String hddInterface;

    @Column(name = "size_of_buffer", nullable = false)
    private int sizeOfBuffer;

    @Column(name = "rotation_speed", nullable = false)
    private int rotationSpeed;
}
