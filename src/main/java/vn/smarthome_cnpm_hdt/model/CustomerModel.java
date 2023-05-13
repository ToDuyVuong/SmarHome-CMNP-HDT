package vn.smarthome_cnpm_hdt.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private List<OrderModel> orders;
    private CartModel cart;
    private String newpassword;
    private String password2;
}
