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

    @ManyToOne
    private User user;

    @PreRemove
    void preRemove() {
        user.getComputers().remove(this);
        processor = null;
        motherBoard = null;
        graphicsCard = null;
        ram = null;
        ssd = null;
        hdd = null;
        powerUnit = null;
        computerCase = null;
    }

    public double getTotalPrice() {
        double total = 0;
        if (processor != null) {
            total += processor.getPrice();
        }
        if (graphicsCard != null) {
            total += graphicsCard.getPrice();
        }
        if (motherBoard != null) {
            total += motherBoard.getPrice();
        }
        if (ram != null) {
            total += ram.getPrice();
        }
        if (ssd != null) {
            total += ssd.getPrice();
        }
        if (hdd != null) {
            total += hdd.getPrice();
        }
        if (powerUnit != null) {
            total += powerUnit.getPrice();
        }
        if (computerCase != null) {
            total += computerCase.getPrice();
        }
        return Math.round(total * 100) / 100.0;
    }
}
