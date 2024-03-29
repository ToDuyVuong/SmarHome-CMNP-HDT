package vn.smarthome_cnpm_hdt.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "product_id")
    private Integer productId;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;

    @Column(name = "price")
    private Long price;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "status", columnDefinition = "int default 1")
    private int status;

    @Column(name = "sold", columnDefinition = "int default 0")
    private int sold;

    // relationship with Category
    @ManyToOne(targetEntity = Category.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", referencedColumnName = "category_id", nullable = false, foreignKey = @ForeignKey(name = "FK_category_product"))
    @JsonIgnore
    private Category category;

//    // relationship with OrderItem
//    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
//    private List<OrderItem> orderItems;



}
