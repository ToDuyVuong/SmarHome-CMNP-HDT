package vn.smarthome_cnpm_hdt.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.smarthome_cnpm_hdt.entity.Category;
import vn.smarthome_cnpm_hdt.entity.Product;
import vn.smarthome_cnpm_hdt.service.ICategoryService;
import vn.smarthome_cnpm_hdt.service.IProductService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    IProductService productService;
    @Autowired
    ICategoryService categoryService;

//    @RequestMapping("")
//    public String product(ModelMap model, HttpServletRequest request){
//
//        List<Product> products = productService.findAll();
//        model.addAttribute("products", products);
//
//        return "customer/product";
//    }

//    @GetMapping("/products")
//    public String viewProductsPage(Model model,
//                                   @RequestParam(name = "page", defaultValue = "1") int pageNumber) {
//        int pageSize = 6;
//
//        Page<Product> page = productService.findPaginated(pageNumber, pageSize);
//        List<Product> products = page.getContent();
//        model.addAttribute("currentPage", pageNumber);
//        model.addAttribute("totalPages", page.getTotalPages());
//        model.addAttribute("products", products);
//        return "jsp-test";
//    }

    @GetMapping("")
    public String products(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber) {
        Page<Product> page = productService.findAll(PageRequest.of(pageNumber - 1, 6));
        List<Category> categorys  = categoryService.findAll();

        model.addAttribute("categories", categorys);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("products", page.getContent());
        return "customer/product";
    }






    @RequestMapping("/detail/{productId}")
    public String productDetail(ModelMap model, @PathVariable("productId") Integer productId,
                                HttpServletRequest request){

        System.out.println("aaaa="+ productId);
//
        Product product = productService.findById(productId).get();
//
        model.addAttribute("product", product);


        return "customer/productdetail";
    }

    @RequestMapping("/list")
    public String productList(ModelMap model, HttpServletRequest request){

        List<Product> products = productService.findAll();
        model.addAttribute("products", products);

        return "customer/productlist";
    }

//    @RequestMapping("/search/{txt}")
//    public String productCart(ModelMap model, @PathVariable("txt") String txt,  HttpServletRequest request){
//
//        System.out.println("aaaa="+ txt);
//
//        return "customer/searchproduct";
//    }

    @GetMapping(path = "/search")
    public String searchProduct(@RequestParam("keyword") String keyword, Model model) {
        List<Product> searchResult = productService.findByNameContaining(keyword);
        model.addAttribute("products", searchResult);


        List<Category> categorys  = categoryService.findAll();

        model.addAttribute("categories", categorys);



        return "/customer/product";
    }

}
