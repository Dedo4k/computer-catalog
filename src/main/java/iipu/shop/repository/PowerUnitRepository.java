package iipu.shop.repository;

import iipu.shop.model.component.PowerUnit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PowerUnitRepository extends JpaRepository<PowerUnit, Long> {
}
