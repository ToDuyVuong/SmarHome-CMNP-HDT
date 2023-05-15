package vn.smarthome_cnpm_hdt.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import vn.smarthome_cnpm_hdt.model.ProductModel;
import vn.smarthome_cnpm_hdt.service.ICategoryService;
import vn.smarthome_cnpm_hdt.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.smarthome_cnpm_hdt.entity.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/category")
@Controller
public class CategoryController {

    @Autowired
    IProductService productService;
    @Autowired
    ICategoryService categoryService;

    @RequestMapping("/{categoryId}")
    public String categoryList(ModelMap model, HttpServletRequest request,
                               @PathVariable("categoryId") Integer categoryId, @RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber){

        try {
            Page<Product> page = productService.findByCategoryCategoryIdAndStatus(categoryId, 1, PageRequest.of(pageNumber - 1, 6));

            List<ProductModel> products = new ArrayList<>();
            model.addAttribute("products", page);
            List<Category> categoryEntity = categoryService.findAll();
            model.addAttribute("categories", categoryEntity);
            model.addAttribute("currentPage", pageNumber);
            model.addAttribute("totalPages", page.getTotalPages());
            model.addAttribute("products", page.getContent());

            for (Product product : page) {
                System.out.println(product.getName());
            }
        }catch (Exception e){
            List<Product> products = productService.findByCategoryCategoryId(categoryId);
            model.addAttribute("products", products);
            List<Category> categoryEntity = categoryService.findAll();
            model.addAttribute("categories", categoryEntity);
            for (Product product : products) {
                System.out.println(product.getName());
            }
        }

        return "customer/product";
    }

    @RequestMapping("")
    public String categoryList(ModelMap model, HttpServletRequest request){
        List<Category> categoryEntity = categoryService.findAll();
        List<Product> productEntity = productService.findAllByStatus(1);

        model.addAttribute("categories", categoryEntity);
        model.addAttribute("products", productEntity);

        return "customer/product";
    }
}
