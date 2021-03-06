package iipu.shop.repository;

import iipu.shop.model.component.MotherBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MotherBoardRepository extends JpaRepository<MotherBoard, Long> {
}
