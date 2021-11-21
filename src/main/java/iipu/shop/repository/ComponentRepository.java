package iipu.shop.repository;

import com.sun.istack.Nullable;
import iipu.shop.model.component.Component;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComponentRepository extends JpaRepository<Component, Long> {

    @EntityGraph(
            type = EntityGraph.EntityGraphType.FETCH,
            attributePaths = {
                    "producer", "model", "price"
            }
    )
    List<Component> findAll(@Nullable Specification<Component> spec);
}
