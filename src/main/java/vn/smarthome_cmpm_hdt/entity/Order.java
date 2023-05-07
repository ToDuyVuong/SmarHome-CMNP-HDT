package vn.smarthome_cmpm_hdt.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "order_id")

    private Integer orderId;

    @Column(name = "order_date")
    private String date;

    @Column(name = "ship_to")
    private String shipTo;

    @Column(name= "totalprice")
    private Long totalPrice;

    @Column(name = "note")
    private String note;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    @Column(name = "totalquantity")
    private Integer totalQuantity;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private Status status;

    // relationship with OrderItem
    @OneToMany(targetEntity = OrderItem.class, fetch = FetchType.LAZY, mappedBy = "order")
    private List<OrderItem> orderItems;

    // relationship with Customer
    @ManyToOne(targetEntity = Customer.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "customerId", referencedColumnName = "customer_id", foreignKey = @ForeignKey(name = "FK_customer_order"))
    private Customer customer;



    public enum Status {
        PENDING(0), PROCESSING(1), DELIVERING(2), DELIVERED(3), CANCELED(4);

        private int value;

        private Status(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }
}
