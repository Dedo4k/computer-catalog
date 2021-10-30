package iipu.shop.model;

import iipu.shop.model.component.Component;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "review")
@EqualsAndHashCode
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "text", nullable = false)
    private String text;

    @ManyToOne
    private Component component;

    @ManyToOne
    private User user;

    @PreRemove
    private void removeReviewFromComponent() {
        component.getReviews().remove(this);
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", user='" + user.getEmail() + '\'' +
                '}';
    }
}
