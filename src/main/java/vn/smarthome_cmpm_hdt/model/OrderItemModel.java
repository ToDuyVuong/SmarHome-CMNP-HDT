package vn.smarthome_cmpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cmpm_hdt.entity.Order;
import vn.smarthome_cmpm_hdt.entity.Product;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemModel {

    private Integer orderItemId;
    private int quantity;
    private Long price;
    private Product product;
    private Order order;
}
