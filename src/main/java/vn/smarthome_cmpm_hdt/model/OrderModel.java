package vn.smarthome_cmpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cmpm_hdt.entity.Customer;
import vn.smarthome_cmpm_hdt.entity.Order;
import vn.smarthome_cmpm_hdt.entity.OrderItem;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderModel {

    private Integer orderId;
    private String date;
    private String shipTo;
    private Long totalPrice;
    private String note;
    private String address;
    private String phone;
    private Integer totalQuantity;
    private Order.Status status;
    private List<OrderItem> orderItems;
    private Customer customer;


}
