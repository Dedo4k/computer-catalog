package iipu.shop.repository;

import iipu.shop.model.component.MotherBoard;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MotherBoardRepository extends PagingAndSortingRepository<MotherBoard, Long> {
}
