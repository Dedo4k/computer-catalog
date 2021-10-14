package iipu.shop.repository;

import iipu.shop.model.Processor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProcessorRepository extends PagingAndSortingRepository<Processor, Long> {
}
