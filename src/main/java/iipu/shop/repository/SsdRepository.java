package iipu.shop.repository;

import iipu.shop.model.component.Ssd;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SsdRepository extends JpaRepository<Ssd, Long> {
}
