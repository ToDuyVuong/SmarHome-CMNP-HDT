package vn.smarthome_cnpm_hdt.service;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.smarthome_cnpm_hdt.entity.Product;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public interface IProductService {
    List<Product> getProductsByPriceRange(Integer priceFrom, Integer priceTo);

    List<Product> findAllByStatus(int status);

    Page<Product> findByNameContainingAndStatus(String keyword, int status, Pageable pageable);

    Page<Product> findByCategoryCategoryIdAndStatus(int categoryId, int status, Pageable pageable);

    List<Product> findByNameContainingAndStatus(String keyword, int status);

    Page<Product> findAllByStatus(int status, Pageable pageable);

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
