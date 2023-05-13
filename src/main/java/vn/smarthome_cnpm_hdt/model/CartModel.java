package vn.smarthome_cnpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartModel {

    private Integer cartId;
    private int quantity;
    private int totalPrice;
    private List<CartItemModel> cartitems;
    private CustomerModel customer;
}
