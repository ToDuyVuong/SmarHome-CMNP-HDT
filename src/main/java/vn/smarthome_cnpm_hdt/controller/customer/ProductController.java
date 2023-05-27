package vn.smarthome_cnpm_hdt.controller.customer;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.smarthome_cnpm_hdt.entity.Category;
import vn.smarthome_cnpm_hdt.entity.Product;
import vn.smarthome_cnpm_hdt.model.ProductModel;
import vn.smarthome_cnpm_hdt.service.ICategoryService;
import vn.smarthome_cnpm_hdt.service.IProductService;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    IProductService productService;
    @Autowired
    ICategoryService categoryService;



    @GetMapping("")
    public String products(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber) {

       try {
           Page<Product> page = productService.findAllByStatus(1, PageRequest.of(pageNumber - 1, 6));
           List<Category> categorys  = categoryService.findAll();
           model.addAttribute("categories", categorys);
           model.addAttribute("currentPage", pageNumber);
           model.addAttribute("totalPages", page.getTotalPages());
           model.addAttribute("products", page.getContent());
           return "customer/product";
       }catch (Exception e){
           System.out.println(e);
           Page<Product> page = productService.findAll( PageRequest.of(pageNumber - 1, 6));
           List<Category> categorys  = categoryService.findAll();
           model.addAttribute("categories", categorys);
           model.addAttribute("currentPage", pageNumber);
           model.addAttribute("totalPages", page.getTotalPages());
           model.addAttribute("products", page.getContent());
           return "customer/product";
       }
    }






    @RequestMapping("/detail/{productId}")
    public String productDetail(ModelMap model, @PathVariable("productId") Integer productId,
                                HttpServletRequest request){

        try {
            System.out.println("aaaa="+ productId);
            Product product = productService.findById(productId).get();
            if (product.getStatus()==0){
                ProductModel productModel = new ProductModel();
                BeanUtils.copyProperties(product, productModel);
                productModel.setQuantity(0);
                model.addAttribute("product", productModel);
                return "customer/productdetail";            }
            model.addAttribute("product", product);
            return "customer/productdetail";
        }catch (Exception e){
            return "index";
        }
    }

    @RequestMapping("/list")
    public String productList(ModelMap model, HttpServletRequest request){

     try {
         List<Product> products = productService.findAllByStatus(1);
         model.addAttribute("products", products);
         return "customer/productlist";
     }catch (Exception e){
         System.out.println(e);
         List<Product> products = productService.findAll();
         model.addAttribute("products", products);
         return "customer/productlist";
     }

    }



    @GetMapping(path = "/search")
    public String searchProduct(@RequestParam("keyword") String keyword, Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber) {

       try {
           int pageSize = 6;
           Page<Product> page = productService.findByNameContainingAndStatus(keyword, 1, PageRequest.of(pageNumber - 1, pageSize));
           model.addAttribute("products", page);
           List<Category> categorys  = categoryService.findAll();
           model.addAttribute("categories", categorys);
           model.addAttribute("currentPage", pageNumber);
           model.addAttribute("totalPages", page.getTotalPages());
           model.addAttribute("products", page.getContent());
           model.addAttribute("keywordSearch", keyword);
           return "/customer/product";
       }
       catch (Exception e){
           System.out.println(e);
           return "index";
       }
    }

    @GetMapping("/quantity")
    public String productList(@RequestParam(value = "priceFrom", required = false) String priceFrom,
                              @RequestParam(value = "priceTo", required = false) String priceTo,
                              Model model) {

        Integer priceto = Integer.valueOf(priceTo);
        Integer pricefrom = Integer.valueOf(priceFrom);
        // Logic to fetch and filter products based on price
        List<Product> filteredProducts = productService.getProductsByPriceRange(pricefrom, priceto);

        // Add filtered products to the model
        model.addAttribute("productsa", filteredProducts);

        // Add other necessary model attributes

        return "product-list";
    }

}
