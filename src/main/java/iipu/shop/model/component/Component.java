package iipu.shop.model.component;

import iipu.shop.model.Review;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Inheritance(strategy = InheritanceType.JOINED)
public class Component {

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

    @OneToMany(mappedBy = "component", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<Review> reviews = new ArrayList<>();

    public void addReview(Review review) {
        reviews.add(review);
    }

    public String info() {
        return null;
    }
}
