package vn.smarthome_cnpm_hdt.service;

import org.springframework.data.jpa.repository.Query;
import vn.smarthome_cnpm_hdt.entity.CartItem;

import java.util.List;
import java.util.Optional;

public interface ICartItemService {

    void delete(CartItem entity);

    void deleteById(Integer cartItemId);

    long count();

    Optional<CartItem> findById(Integer cartItemId);

    void saveCartItem(CartItem cartItemEntity);

    void deleteCartItemById(Integer cartItemId);

    CartItem getCartItemByCartIdAndProductId(Integer cartId, Integer productId);

    @Query("SELECT ci FROM CartItem ci WHERE ci.cart.cartId = :cartId AND ci.products.productId = :productId")
    CartItem findByCartIdAndProductId(int cartId, int productId);

    List<CartItem> getCartItemsByCartId(int cartItemId);

    List<CartItem> findAll();

}
