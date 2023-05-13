package vn.smarthome_cnpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cnpm_hdt.entity.Cart;
import vn.smarthome_cnpm_hdt.entity.Product;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItemModel {

    private Integer cartItemId;
    private int quantity;
    private Product products;
    private Cart cart;
}
