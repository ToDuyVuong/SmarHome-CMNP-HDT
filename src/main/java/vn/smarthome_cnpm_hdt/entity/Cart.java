package vn.smarthome_cnpm_hdt.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "cart")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    // Id cart = Id customer
    @Id
    @Column(nullable = false, name = "cart_id")
    private Integer cartId;

    @Column(name = "quantity")
    private int quantity;

    @Column(nullable = false, name = "totalprice")
    private int totalPrice;

//    @OneToMany(mappedBy = "cart", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    private List<CartItem> cartitems;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;


}
