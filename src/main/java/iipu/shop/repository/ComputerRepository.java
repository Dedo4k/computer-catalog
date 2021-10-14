package iipu.shop.repository;

import iipu.shop.model.Computer;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComputerRepository extends PagingAndSortingRepository<Computer, Long> {
}
