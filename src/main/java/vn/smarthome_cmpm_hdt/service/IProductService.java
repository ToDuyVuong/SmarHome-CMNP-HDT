package vn.smarthome_cmpm_hdt.service;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.smarthome_cmpm_hdt.entity.Category;
import vn.smarthome_cmpm_hdt.entity.Product;

import java.util.List;
import java.util.Optional;

public interface IProductService {
    List<Product> findAll();

    <S extends Product> List<S> findAll(Example<S> example);

    <S extends Product> S save(S entity);

    Optional<Product> findById(Integer integer);

    long count();

    List<Product> findByNameContaining(String name);
    List<Product> findByName(String name);

    List<Product> findByPrice(Long price);

    List<Product> findByQuantity(int quantity);


    List<Product> findByCategory_CategoryId(int categoryId);


    Product findById(int id);


    List<Product> findAll(Sort sort);

    List<Product> findAllById(Iterable<Integer> integers);

    <S extends Product> List<S> findAll(Example<S> example, Sort sort);

    Page<Product> findAll(Pageable pageable);

    <S extends Product> Optional<S> findOne(Example<S> example);

    <S extends Product> Page<S> findAll(Example<S> example, Pageable pageable);

    Page<Product> findPaginated(int pageNumber, int pageSize);


    List<Product> findByCategoryCategoryId(Integer categoryId);

    public Product saveOrUpdate(Product category);

    void deleteProductByProductId(int productId);

    @Query("SELECT p FROM Product p WHERE p.category.categoryId = :id")
    List<Product> listProductByCategoryId(@Param("id") int id);

    void updateProductQuantityToZeroById(int id);
}
