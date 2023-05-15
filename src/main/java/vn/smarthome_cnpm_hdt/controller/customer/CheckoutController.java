package vn.smarthome_cnpm_hdt.controller.customer;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome_cnpm_hdt.entity.*;
import vn.smarthome_cnpm_hdt.service.*;
import vn.smarthome_cnpm_hdt.shipping.*;
import vn.smarthome_cnpm_hdt.entity.CartItem;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RequestMapping("checkout")
@Controller
public class CheckoutController {

    @Autowired
    ICustomerService customerService;
    @Autowired
    ICartService cartService;
    @Autowired
    ICartItemService cartItemService;
    @Autowired
    IProductService productService;
    @Autowired
    IOrderService orderService;
    @Autowired
    IOrderItemService orderItemService;


    @RequestMapping("")
    public ModelAndView checkout(HttpServletRequest request, ModelMap model) {

        // Khai báo.
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        List<CartItem> cartItemList = cartItemService.findAll();
        List<CartItem> selectedCartItems = new ArrayList<>();
        String note = request.getParameter("note");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Integer totalQuantity = 0;
        long totalPrice = 0;


        for (CartItem cartItem : cartItemList) {
            // Nếu checkbox được chọn thì thêm vào list thanh toán
            String selected = request.getParameter(String.valueOf(cartItem.getCartItemId()));
            if (selected != null) {
                selectedCartItems.add(cartItem);
                totalQuantity += cartItem.getQuantity();
                totalPrice += cartItem.getQuantity() * cartItem.getProducts().getPrice();
            }
        }

        // Lấy phương thức vận chuyển đã chọn từ request
        String shippingMethod = request.getParameter("shipping-method");
        String ship = "Giao Hang Co Ban";
        if(shippingMethod == null){
            shippingMethod = "basic";
        }
        System.out.println("shippingMethod: " + shippingMethod);
        IShipping shippingStrategy;
        switch (shippingMethod) {
            case "fast":
                shippingStrategy = new GiaoHangNhanh();
                ship = "Giao Hang Nhanh";
                break;
            case "express":
                shippingStrategy = new GiaoHangHoaToc();
                ship = "Giao Hang Hoa Toc";
                break;
            default:
                shippingStrategy = new GiaoHangCoBan();
                break;
        }
        long shippingCost = shippingStrategy.calculateShippingCost(totalPrice);


        Optional<Customer> opt = customerService.findById(id);
        if (opt.isEmpty()) {
            model.addAttribute("error", "Customer not found");
            return new ModelAndView("redirect:/order", model);
        }

        Customer customer = opt.get();
        Order order = new Order();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String date = formatter.format(new Date());

        order.setCustomer(customer);
        order.setTotalPrice(totalPrice + shippingCost);
        order.setTotalQuantity(totalQuantity);
        order.setNote(note);
        order.setDate(date);
        order.setAddress(address);
        order.setPhone(phone);
        order.setStatus(Order.Status.PENDING);
        order.setShipTo(ship);
        orderService.saveOrUpdate(order);

        for (CartItem cartItem : selectedCartItems) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(cartItem.getProducts());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setPrice(cartItem.getProducts().getPrice());
            orderItemService.saveOrUpdate(orderItem);

            Product product = cartItem.getProducts();
            product.setQuantity(product.getQuantity() - cartItem.getQuantity());
            product.setSold(product.getSold() + cartItem.getQuantity());
            productService.save(product);

            cartItemService.delete(cartItem);
        }





        // Thêm phí vận chuyển và phương thức vận chuyển vào model
        model.addAttribute("shippingcost", shippingCost);
        model.addAttribute("shippingmethod", ship);
        model.addAttribute("order", order);
        model.addAttribute("customer", customer);
        model.addAttribute("totalQuantity", totalQuantity);
        model.addAttribute("totalPrice", totalPrice + shippingCost);
        model.addAttribute("selectedCartItems", selectedCartItems);
        model.addAttribute("note", note);
        model.addAttribute("address", address);
        model.addAttribute("phone", phone);

        return new ModelAndView("customer/checkout", model);
    }
}




