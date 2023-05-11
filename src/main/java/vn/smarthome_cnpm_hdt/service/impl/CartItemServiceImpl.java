package vn.smarthome_cnpm_hdt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import vn.smarthome_cnpm_hdt.entity.CartItem;
import vn.smarthome_cnpm_hdt.repository.CartItemRepository;
import vn.smarthome_cnpm_hdt.service.ICartItemService;

import java.util.List;
import java.util.Optional;

@Service
public class CartItemServiceImpl implements ICartItemService {

    @Autowired
    CartItemRepository cartItemRepository;

    public CartItemServiceImpl(CartItemRepository cartItemRepository) {

        this.cartItemRepository = cartItemRepository;
    }

    @Override
    public void saveCartItem(CartItem cartItemEntity) {
        cartItemRepository.save(cartItemEntity);
    }

    @Override
    public void deleteCartItemById(Integer cartItemId) {
        cartItemRepository.deleteById(cartItemId);
    }

//	@Override
//	public CartItemEntity getCartItemByCartIdAndProductId(Integer cartId, Integer productId) {
//		return cartItemRepository.findByCartCartIdAndProducts(cartId, productId);
//	}

    @Override
    public CartItem getCartItemByCartIdAndProductId(Integer cartId, Integer productId) {
        return cartItemRepository.findByCartCartIdAndProductsProductId(cartId, productId);
    }

    @Override
    @Query("SELECT ci FROM CartItem ci WHERE ci.cart.cartId = :cartId AND ci.products.productId = :productId")
    public CartItem findByCartIdAndProductId(int cartId, int productId) {
        return cartItemRepository.findByCartIdAndProductId(cartId, productId);
    }

    @Override
    public List<CartItem> getCartItemsByCartId(int cartId) {
        return cartItemRepository.findByCartCartId(cartId);
    }

    @Override
    public List<CartItem> findAll() {
        return cartItemRepository.findAll();
    }

    @Override
    public Optional<CartItem> findById(Integer cartItemId) {
        return cartItemRepository.findById(cartItemId);
    }

    @Override
    public long count() {
        return cartItemRepository.count();
    }

    @Override
    public void deleteById(Integer cartItemId) {
        cartItemRepository.deleteById(cartItemId);
    }

    @Override
    public void delete(CartItem entity) {
        cartItemRepository.delete(entity);
    }


}
