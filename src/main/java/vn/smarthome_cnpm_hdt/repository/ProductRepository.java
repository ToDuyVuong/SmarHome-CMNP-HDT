package vn.smarthome_cnpm_hdt.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.smarthome_cnpm_hdt.entity.Product;

import java.math.BigDecimal;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer>{
    Product findById(int id);

    List<Product> findByCategory_CategoryId(int categoryId);


    List<Product> findByNameContaining(String name);
    List<Product> findByName(String name);

    List<Product> findByPrice(Long price);


    List<Product> findByQuantity(int quantity);

    List<Product> findByCategoryCategoryId(Integer categoryId);

    @Query("SELECT p FROM Product p WHERE p.category.categoryId = :id")
    List<Product> listProductByCategoryId(@Param("id") int id);

    @Modifying
    @Query("UPDATE Product p SET p.quantity = 0 WHERE p.productId = :id")
    void updateProductQuantityToZeroById(@Param("id") int id);

    List<Product> findAllByStatus(int status);

    Page<Product> findAllByStatus(int status, Pageable pageable);

    List<Product> findByNameContainingAndStatus(String keyword, int status);

    List<Product> findByPriceBetween(Integer priceFrom, Integer priceTo);
    Page<Product> findByCategoryCategoryIdAndStatus(int categoryId, int status, Pageable pageable);
    Page<Product> findByNameContainingAndStatus(String keyword, int status, Pageable pageable);

}
