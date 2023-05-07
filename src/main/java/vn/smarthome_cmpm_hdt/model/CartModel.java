package vn.smarthome_cmpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cmpm_hdt.entity.CartItem;
import vn.smarthome_cmpm_hdt.entity.Customer;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartModel {

    private Integer cartId;
    private int quantity;
    private int totalPrice;
    private List<CartItem> cartitems;
    private Customer customer;
}
