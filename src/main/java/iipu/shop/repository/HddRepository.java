package iipu.shop.repository;

import iipu.shop.model.component.Hdd;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HddRepository extends JpaRepository<Hdd, Long> {
}
