package vn.smarthome_cnpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemModel {

    private Integer orderItemId;
    private int quantity;
    private Long price;
    private ProductModel product;
    private OrderModel order;
}
