package iipu.shop.repository;

import iipu.shop.model.component.PowerUnit;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PowerUnitRepository extends PagingAndSortingRepository<PowerUnit, Long> {
}
