package vn.smarthome_cnpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItemModel {

    private Integer cartItemId;
    private int quantity;
    private ProductModel products;
    private CartModel cart;
}
