package iipu.shop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@MappedSuperclass
@NoArgsConstructor
@AllArgsConstructor
public abstract class Component {

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "producer", nullable = false)
    private String producer;

    @Column(name = "model", nullable = false)
    private String model;

    @Column(name = "price", nullable = false)
    private double price;
}
