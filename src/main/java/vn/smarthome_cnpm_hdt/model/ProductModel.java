package vn.smarthome_cnpm_hdt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome_cnpm_hdt.entity.Category;
import vn.smarthome_cnpm_hdt.entity.OrderItem;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductModel {

    private Integer productId;
    private String name;
    private String description;
    private String image;
    private Long price;
    private int quantity;
    private CategoryModel category;
    private List<OrderItem> orderItems;
}
