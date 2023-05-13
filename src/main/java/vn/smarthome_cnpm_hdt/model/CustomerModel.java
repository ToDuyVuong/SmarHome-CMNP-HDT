package vn.smarthome_cnpm_hdt.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cnpm_hdt.entity.Cart;
import vn.smarthome_cnpm_hdt.entity.Order;

import java.sql.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerModel {

    private Integer customerId;
    private String fullname;
    private Date birthday;
    private boolean gender;
    private String email;
    private String phone;
    private String address;
    private String username;
    private String password;
    private List<Order> orders;
    private Cart cart;
    private String newpassword;
    private String password2;
}
