package vn.smarthome_cnpm_hdt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.smarthome_cnpm_hdt.entity.Category;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
    Category findById(int id);
    List<Category> findByNameContaining(String name);
    List<Category> findByName(String name);
}
