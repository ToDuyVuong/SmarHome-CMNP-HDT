package vn.smarthome_cmpm_hdt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import vn.smarthome_cmpm_hdt.entity.Product;
import vn.smarthome_cmpm_hdt.service.IProductService;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class HomePageController {
    @Autowired
    IProductService productService;

    @RequestMapping(value = {"", "home"}, method = RequestMethod.GET)
    public String startHonmeIndex(ModelMap model) {


//        List<Product> products = productService.findAll();
//
//        int numProducts = products.size();
//        List<Product> lastFourProducts = new ArrayList<>();
//
//        for (int i = numProducts - 1; i >= 0 && lastFourProducts.size() < 4; i--) {
//            Product product = products.get(i);
//            if (product.getQuantity() > 0) {
//                lastFourProducts.add(product);
//            }
//        }
//
//// Sử dụng stream để sắp xếp theo quantity và lọc ra các sản phẩm có quantity > 0
//        List<Product> filteredProducts = products.stream()
//                .filter(p -> p.getQuantity() > 0)
//                .sorted(Comparator.comparing(Product::getQuantity))
//                .limit(4)
//                .collect(Collectors.toList());
//
//        Product filteredProduct = products.stream()
//                .filter(p -> p.getQuantity() > 0)
//                .sorted(Comparator.comparing(Product::getQuantity))
//                .findFirst().get();
//
//
//        model.addAttribute("topproducts", filteredProducts);
//        model.addAttribute("products", lastFourProducts);
//        model.addAttribute("bestproduct", filteredProduct);

        return "index";
    }

}