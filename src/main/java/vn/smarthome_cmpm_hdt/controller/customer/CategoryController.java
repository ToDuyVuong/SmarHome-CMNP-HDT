package vn.smarthome_cmpm_hdt.controller.customer;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import vn.smarthome_cmpm_hdt.model.CategoryModel;
import vn.smarthome_cmpm_hdt.model.ProductModel;
import vn.smarthome_cmpm_hdt.service.ICategoryService;
import vn.smarthome_cmpm_hdt.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.smarthome_cmpm_hdt.entity.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RequestMapping("/category")
@Controller
public class CategoryController {

    @Autowired
    IProductService productService;
    @Autowired
    ICategoryService categoryService;

    @RequestMapping("/{categoryId}")
    public String categoryList(ModelMap model, HttpServletRequest request,
                               @PathVariable("categoryId") Integer categoryId){

        List<Product> productEntity = productService.findByCategoryCategoryId(categoryId);
        List<ProductModel> products = new ArrayList<>();
//        BeanUtils.copyProperties(productEntity, products);
        model.addAttribute("products", productEntity);
        List<Category> categoryEntity = categoryService.findAll();
        model.addAttribute("categories", categoryEntity);


        for (Product product : productEntity) {
            System.out.println(product.getName());
        }

        return "customer/product";
    }

    @RequestMapping("")
    public String categoryList(ModelMap model, HttpServletRequest request){
        List<Category> categoryEntity = categoryService.findAll();
        List<Product> productEntity = productService.findAll();

        model.addAttribute("categories", categoryEntity);
        model.addAttribute("products", productEntity);

        return "customer/product";
    }
}
