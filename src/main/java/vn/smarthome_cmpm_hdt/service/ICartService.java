package vn.smarthome_cmpm_hdt.service;

import vn.smarthome_cmpm_hdt.entity.Cart;

import java.util.List;
import java.util.Optional;
public interface ICartService {

    void createCart(Cart cart);

    public Long getCartTotal(Cart cartEntity);
    void deleteAll();

    void deleteById(Integer cartId);

    long count();

    Optional<Cart> findById(Integer cartId);

    <S extends Cart> S save(S entity);

    Cart getCartByCustomerId(int id);

    List<Cart> findAll();

}