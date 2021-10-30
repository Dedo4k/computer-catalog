package iipu.shop.model.component;


import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "processor")
@EqualsAndHashCode(callSuper = true)
public class Processor extends Component  {

    @Column(name = "core", nullable = false)
    private String core;

    @Column(name = "socket", nullable = false)
    private String socket;

    @Column(name = "min_freq", nullable = false)
    private double minFreq;

    @Column(name = "max_freq", nullable = false)
    private double maxFreq;
}
