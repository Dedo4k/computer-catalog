package iipu.shop.model;

import iipu.shop.model.component.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "computer")
@EqualsAndHashCode
public class Computer {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "title")
    private String title;

    @OneToOne(cascade = CascadeType.ALL)
    private Processor processor;

    @OneToOne(cascade = CascadeType.ALL)
    private GraphicsCard graphicsCard;

    @OneToOne(cascade = CascadeType.ALL)
    private Hdd hdd;

    @OneToOne(cascade = CascadeType.ALL)
    private Ram ram;

    @OneToOne(cascade = CascadeType.ALL)
    private Ssd ssd;

    @OneToOne(cascade = CascadeType.ALL)
    private MotherBoard motherBoard;

    @OneToOne(cascade = CascadeType.ALL)
    private PowerUnit powerUnit;

    @OneToOne(cascade = CascadeType.ALL)
    private ComputerCase computerCase;
}
