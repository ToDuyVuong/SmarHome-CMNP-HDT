package vn.smarthome_cmpm_hdt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.smarthome_cmpm_hdt.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    @Query("SELECT c FROM Cart c WHERE c.customer.customerId = :id")
    Cart findByCustomerId(@Param("id") int id);
    
}
