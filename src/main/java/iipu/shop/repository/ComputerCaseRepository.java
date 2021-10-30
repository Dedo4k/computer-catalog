package iipu.shop.repository;

import iipu.shop.model.component.ComputerCase;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComputerCaseRepository extends PagingAndSortingRepository<ComputerCase, Long> {
}
