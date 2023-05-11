package vn.smarthome_cnpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cnpm_hdt.entity.Order;
import vn.smarthome_cnpm_hdt.entity.Product;

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
