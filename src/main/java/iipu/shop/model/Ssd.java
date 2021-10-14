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
@Table(name = "ssd")
@EqualsAndHashCode(callSuper = true)
public class Ssd extends Component{

    @Column(name = "capacity", nullable = false)
    private int capacity;

    @Column(name = "form_factor", nullable = false)
    private String formFactor;

    @Column(name = "ssd_interface", nullable = false)
    private String ssdInterface;

    @Column(name = "controller", nullable = false)
    private String controller;

    @Column(name = "reading_speed", nullable = false)
    private int readingSpeed;


    @Column(name = "writing_speed", nullable = false)
    private int writingSpeed;
}
