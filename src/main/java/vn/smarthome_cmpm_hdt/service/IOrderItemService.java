package vn.smarthome_cmpm_hdt.service;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import vn.smarthome_cmpm_hdt.entity.OrderItem;
import vn.smarthome_cmpm_hdt.entity.Product;

import java.util.List;

public interface IOrderItemService {

    void deleteAll();

    void deleteById(Integer orderItemId);

    long count();

    List<OrderItem> findAllById(Iterable<Integer> orderItemIds);

    List<OrderItem> findAll(Sort sort);

    List<OrderItem> findAll();

    OrderItem saveOrUpdate(OrderItem orderItem);


    @Query("SELECT c FROM OrderItem c WHERE c.order.orderId = :orderId")
    List<OrderItem> listOrderItemsByOrderId(int orderId);
    @Query("SELECT c.product.productId FROM OrderItem c WHERE c.order.orderId = :orderId")
    List<Integer> listProductIdByOrderId(int orderId);
}
