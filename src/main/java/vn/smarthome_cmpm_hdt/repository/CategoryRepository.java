package vn.smarthome_cmpm_hdt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.smarthome_cmpm_hdt.entity.Category;
import vn.smarthome_cmpm_hdt.entity.Product;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
    Category findById(int id);
    List<Category> findByNameContaining(String name);
    List<Category> findByName(String name);
}
