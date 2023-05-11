package vn.smarthome_cnpm_hdt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.smarthome_cnpm_hdt.entity.Cart;
import vn.smarthome_cnpm_hdt.entity.CartItem;
import vn.smarthome_cnpm_hdt.repository.CartRepository;
import vn.smarthome_cnpm_hdt.service.ICartService;

import java.util.List;
import java.util.Optional;

@Service
public class CartServiceImpl implements ICartService{

    @Autowired
    CartRepository cartRepository;


    public CartServiceImpl(CartRepository cartRepository) {

        this.cartRepository = cartRepository;
    }

    @Override
    public void createCart(Cart cart) {
        cartRepository.save(cart);
    }

    @Override
    public Long getCartTotal(Cart cartEntity) {
        Long cartTotal = 0L;
        List<CartItem> cartItems = (List<CartItem>) cartEntity.getCartitems();
        for (CartItem cartItem : cartItems) {
            Long price = cartItem.getProducts().getPrice();
            Long quantity = Long.valueOf(cartItem.getQuantity());
            cartTotal += price * quantity;
        }
        return cartTotal;
    }

    @Override
    public <S extends Cart> S save(S entity) {
        return cartRepository.save(entity);
    }

    @Override
    public Cart getCartByCustomerId(int id) {
        return cartRepository.findByCustomerId(id);
    }
    @Override
    public List<Cart> findAll() {
        return cartRepository.findAll();
    }

    @Override
    public Optional<Cart> findById(Integer cartId) {
        return cartRepository.findById(cartId);
    }

    @Override
    public long count() {
        return cartRepository.count();
    }

    @Override
    public void deleteById(Integer cartId) {
        cartRepository.deleteById(cartId);
    }

    @Override
    public void deleteAll() {
        cartRepository.deleteAll();
    }


}
