package vn.smarthome_cnpm_hdt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.smarthome_cnpm_hdt.entity.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer>{

    @Query("SELECT c FROM Order c WHERE c.customer.customerId = :id")
    List<Order> listOrderByCustomerId(@Param("id") int id);

}
