package iipu.shop.repository;

import iipu.shop.model.Computer;
import iipu.shop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComputerRepository extends JpaRepository<Computer, Long> {

    List<Computer> findAllByUser(User user);
}
