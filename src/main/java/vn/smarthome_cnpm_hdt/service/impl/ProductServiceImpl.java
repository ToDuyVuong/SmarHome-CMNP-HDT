package vn.smarthome_cnpm_hdt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.smarthome_cnpm_hdt.entity.Product;
import vn.smarthome_cnpm_hdt.repository.ProductRepository;
import vn.smarthome_cnpm_hdt.service.IProductService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductRepository productRepository;

    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product> getProductsByPriceRange(Integer priceFrom, Integer priceTo) {
        return productRepository.findByPriceBetween(priceFrom, priceTo);
    }
    @Override
    public List<Product> findAllByStatus(int status) {
        return productRepository.findAllByStatus(status);
    }

    @Override
    public Page<Product> findByNameContainingAndStatus(String keyword, int status, Pageable pageable) {
        return productRepository.findByNameContainingAndStatus(keyword, status, pageable);
    }

    @Override
    public Page<Product> findByCategoryCategoryIdAndStatus(int categoryId, int status, Pageable pageable) {
        return productRepository.findByCategoryCategoryIdAndStatus(categoryId, status, pageable);
    }

    @Override
    public List<Product> findByNameContainingAndStatus(String keyword, int status) {
        return productRepository.findByNameContainingAndStatus(keyword, status);
    }

    @Override
    public Page<Product> findAllByStatus(int status, Pageable pageable) {
        return productRepository.findAllByStatus(status, pageable);
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public <S extends Product> List<S> findAll(Example<S> example) {
        return productRepository.findAll(example);
    }

    @Override
    public <S extends Product> S save(S entity) {
        return productRepository.save(entity);
    }

    @Override
    public Optional<Product> findById(Integer integer) {
        return productRepository.findById(integer);
    }

    @Override
    public long count() {
        return productRepository.count();
    }

    @Override
    public List<Product> findByNameContaining(String name) {
        return productRepository.findByNameContaining(name);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public List<Product> findByPrice(Long price) {
        return productRepository.findByPrice(price);
    }

    @Override
    public List<Product> findByCategory_CategoryId(int categoryId) {
        return productRepository.findByCategory_CategoryId(categoryId);
    }


    @Override
    public List<Product> findByQuantity(int quantity) {
        return productRepository.findByQuantity(quantity);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> findAll(Sort sort) {
        return productRepository.findAll(sort);
    }

    @Override
    public List<Product> findAllById(Iterable<Integer> integers) {
        return productRepository.findAllById(integers);
    }

    @Override
    public <S extends Product> List<S> findAll(Example<S> example, Sort sort) {
        return productRepository.findAll(example, sort);
    }

    @Override
    public Page<Product> findAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public <S extends Product> Optional<S> findOne(Example<S> example) {
        return productRepository.findOne(example);
    }

    @Override
    public <S extends Product> Page<S> findAll(Example<S> example, Pageable pageable) {
        return productRepository.findAll(example, pageable);
    }


    @Override
    public Page<Product> findPaginated(int pageNumber, int pageSize) {
        Sort sort = Sort.by("name").ascending();
        Pageable pageable = PageRequest.of(pageNumber - 1, pageSize, sort);
        return productRepository.findAll(pageable);
    }

    @Override
    public List<Product> findByCategoryCategoryId(Integer categoryId) {
        return productRepository.findByCategoryCategoryId(categoryId);
    }

    @Override
    public void deleteProductByProductId(int id) {
        productRepository.deleteById(id);
    }

    @Override
    public Product saveOrUpdate(Product product) {
        if (product.getProductId() == null) {
            // This is a new product, so save it
            return productRepository.save(product);
        }
        else {
            // This product already exists, so update it
            Optional<Product> existingProduct = productRepository.findById(product.getProductId());
            if (existingProduct.isPresent()) {
                Product updatedProduct = existingProduct.get();
                updatedProduct.setName(product.getName());
                updatedProduct.setDescription(product.getDescription());
                updatedProduct.setImage(product.getImage());
                updatedProduct.setPrice(product.getPrice());
                updatedProduct.setQuantity(product.getQuantity());
                updatedProduct.setCategory(product.getCategory());
                return productRepository.save(updatedProduct);
            } else {
                // Product not found, throw an exception or handle the error in some other way
                throw new RuntimeException("Product not found");
            }
        }
    }

    @Override
    @Query("SELECT p FROM Product p WHERE p.category.categoryId = :id")
    public List<Product> listProductByCategoryId(int id) {
        return productRepository.listProductByCategoryId(id);
    }

    @Override
    @Transactional
    public void updateProductQuantityToZeroById(int id) {
        productRepository.updateProductQuantityToZeroById(id);
    }
}
