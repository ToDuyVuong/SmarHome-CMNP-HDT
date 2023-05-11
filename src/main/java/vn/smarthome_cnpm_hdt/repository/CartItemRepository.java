package vn.smarthome_cnpm_hdt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.smarthome_cnpm_hdt.entity.CartItem;

import java.util.List;

public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
    List<CartItem> findByCartCartId(int cartId);


    //    CartItemEntity findByCartIdAndProductId(int cartId, int productId);
//    CartItemEntity findByCartCartIdAndProducts(int cartId, int productId);
//    CartItemEntity findByCartCartIdAndProducts(int cartId, ProductEntity productEntity);
    CartItem findByCartCartIdAndProductsProductId(int cartId, int productId);

    @Query("SELECT ci FROM CartItem ci WHERE ci.cart.cartId = :cartId AND ci.products.productId = :productId")
    CartItem findByCartIdAndProductId(@Param("cartId") int cartId, @Param("productId") int productId);
}