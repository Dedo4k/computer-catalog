package iipu.shop.repository;

import iipu.shop.model.component.Ssd;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SsdRepository extends PagingAndSortingRepository<Ssd, Long> {
}
