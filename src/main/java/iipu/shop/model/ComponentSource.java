package iipu.shop.model;

import iipu.shop.model.component.Component;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "component_source")
public class ComponentSource {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name", nullable = false)
    private String name;

    @ManyToOne
    private Component component;

    @Column(name = "link", nullable = false)
    private String link;

    @PreRemove
    public void removeSourceFromComponent() {
        component.getSources().remove(this);
    }
}
