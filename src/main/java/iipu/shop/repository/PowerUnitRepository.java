package iipu.shop.repository;

import iipu.shop.model.PowerUnit;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PowerUnitRepository extends PagingAndSortingRepository<PowerUnit, Long> {
}
