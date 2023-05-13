package vn.smarthome_cnpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cnpm_hdt.entity.Customer;
import vn.smarthome_cnpm_hdt.entity.Order;
import vn.smarthome_cnpm_hdt.entity.OrderItem;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderModel {

    private Integer orderId;
    private String date;
    private String shipTo;
    private Long totalPrice;
    private String note;
    private String address;
    private String phone;
    private Integer totalQuantity;
    private Status status;
    private List<OrderItemModel> orderItems;
    private CustomerModel customer;

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
