package iipu.shop.repository;

import iipu.shop.model.Hdd;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HddRepository extends PagingAndSortingRepository<Hdd, Long> {
}
