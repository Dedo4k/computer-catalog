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
@Table(name = "power_unit")
@EqualsAndHashCode(callSuper = true)
public class PowerUnit extends Component {

    @Column(name = "power", nullable = false)
    private double power;

    @Column(name = "certificate")
    private String certificate;
}
