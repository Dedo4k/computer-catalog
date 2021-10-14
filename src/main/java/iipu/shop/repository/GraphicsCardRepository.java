package iipu.shop.repository;

import iipu.shop.model.GraphicsCard;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GraphicsCardRepository extends PagingAndSortingRepository<GraphicsCard, Long> {
}
