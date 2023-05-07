package vn.smarthome_cmpm_hdt.service;

import org.springframework.data.domain.Example;
import vn.smarthome_cmpm_hdt.entity.Category;
import vn.smarthome_cmpm_hdt.entity.Product;

import java.util.List;
import java.util.Optional;

public interface ICategoryService {
    List<Category> findAll();

    <S extends Category> List<S> findAll(Example<S> example);

    <S extends Category> S save(S entity);

    Optional<Category> findById(Integer integer);
    long count();
    List<Category> findByNameContaining(String name);
    List<Category> findByName (String name);
    Category findById(int id);

    void deleteCategoryByCategoryId(int cateId);

    public Category saveOrUpdate(Category category);

}
