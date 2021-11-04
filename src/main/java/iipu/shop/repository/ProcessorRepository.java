package iipu.shop.repository;

import iipu.shop.model.component.Processor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProcessorRepository extends JpaRepository<Processor, Long> {
}
