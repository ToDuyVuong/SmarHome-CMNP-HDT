package vn.iotstar.smarhomecmnphdt.entity;

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
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "cart_id")
    private Integer cartId;

    @Column(name = "quantity")
    private int quantity;

    @Column(nullable = false, name = "totalprice")
    private int totalPrice;

    @OneToMany(mappedBy = "cart", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<CartItem> cartitems;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;

//    // relationship with Customer
//    @OneToOne(targetEntity = Customer.class, fetch = FetchType.LAZY)
//    @JoinColumn(name = "customerId", referencedColumnName = "customer_id", nullable = false, foreignKey = @ForeignKey(name = "FK_customer_cart"))
//    private Customer customer;
//
//    // relationship with Product, create a new table "cart_product"
//    @ManyToMany(targetEntity = Product.class, fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
//    @JoinTable(name = "cart_product", joinColumns = @JoinColumn(name = "cartId", referencedColumnName = "cart_id", nullable = false, foreignKey = @ForeignKey(name = "FK_cart__product")), inverseJoinColumns = @JoinColumn(name = "productId", referencedColumnName = "product_id", nullable = false, foreignKey = @ForeignKey(name = "FK_product__cart")))
//    private List<Product> products;
}
