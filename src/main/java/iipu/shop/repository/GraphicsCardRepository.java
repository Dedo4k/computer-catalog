package iipu.shop.repository;

import iipu.shop.model.component.GraphicsCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GraphicsCardRepository extends JpaRepository<GraphicsCard, Long> {
}
