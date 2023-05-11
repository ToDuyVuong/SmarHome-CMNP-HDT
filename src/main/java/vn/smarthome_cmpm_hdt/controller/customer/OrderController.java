package vn.smarthome_cmpm_hdt.controller.customer;


import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome_cmpm_hdt.entity.*;
import vn.smarthome_cmpm_hdt.model.CartItemModel;
import vn.smarthome_cmpm_hdt.model.CartModel;
import vn.smarthome_cmpm_hdt.model.CustomerModel;
import vn.smarthome_cmpm_hdt.service.*;
import vn.smarthome_cmpm_hdt.shippingstrategy.GiaoHangCoBanShipping;
import vn.smarthome_cmpm_hdt.shippingstrategy.GiaoHangHoaTocShipping;
import vn.smarthome_cmpm_hdt.shippingstrategy.GiaoHangNhanhShipping;
import vn.smarthome_cmpm_hdt.shippingstrategy.IShipping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RequestMapping("order")
@Controller
public class OrderController {


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
    public ModelAndView newOrder(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        List<CartItem> cartItemList = cartItemService.findAll();
        List<CartItem> listCartItemSelecteds = new ArrayList<>();
        Integer quantity = 0;
        long total = 0;
        for (CartItem cartItem : cartItemList) {
            // Nếu checkbox được chọn thì thêm vào list thanh toán
            String selected = request.getParameter(String.valueOf(cartItem.getCartItemId()));
            if (selected != null) {

                if(cartItem.getQuantity() > cartItem.getProducts().getQuantity()){
                    cartItem.setQuantity(cartItem.getProducts().getQuantity());
                }

                listCartItemSelecteds.add(cartItem);
                quantity += cartItem.getQuantity();
                total += cartItem.getQuantity() * cartItem.getProducts().getPrice();
            }
        }
        model.addAttribute("quantity", quantity);
        model.addAttribute("total", total);
        // Nếu chưa check sản phẩm nào cả.
        if (listCartItemSelecteds.size() == 0) {
            // Có thể dùng session để lưu thông báo thay vì code tải lại trang toàn bộ.
            if (id == null) {
                // Nếu chưa đăng nhập thì chuyển hướng đến trang đăng nhập
                return new ModelAndView("redirect:/login");
            }
            List<CartItem> cartItemEntities = cartItemService.getCartItemsByCartId(id);
            Optional<Cart> opt = cartService.findById(id);
            if (opt.isPresent()) {
                CartModel cart = new CartModel();
                BeanUtils.copyProperties(opt.get(), cart);
                model.addAttribute("cart", cart);
            } else {
                return new ModelAndView("customer/cart", model);
            }
            if (cartItemEntities != null) {
                List<CartItemModel> cartItemModels = new ArrayList<>();
                for (CartItem cartItemEntity : cartItemEntities) {
                    CartItemModel cartItem = new CartItemModel();
                    BeanUtils.copyProperties(cartItemEntity, cartItem);
                    cartItemModels.add(cartItem);
                }
                model.addAttribute("cartItems", cartItemModels);
                model.addAttribute("messageCart", "Vui lòng chọn sản phẩm để thanh toán");
            }
            return new ModelAndView("customer/cart", model);
        }
        Optional<Customer> opt = customerService.findById(id);
        if (opt.isPresent()) {
            Customer entity = opt.get();
            CustomerModel customerModel = new CustomerModel();
            BeanUtils.copyProperties(entity, customerModel);
            model.addAttribute("customer", customerModel);
        }
        // Danh sách sản phẩm được chọn thanh toán.
        model.addAttribute("cartItemOrder", listCartItemSelecteds);





        // Lấy phương thức vận chuyển đã chọn từ request
        String shippingMethod = request.getParameter("shipping-method");

        if(shippingMethod == null){
            shippingMethod = "basic";
        }
        System.out.println("shippingMethod: " + shippingMethod);


        // Tạo đối tượng ShippingStrategy tương ứng
        IShipping shippingStrategy;
        switch (shippingMethod) {
            case "fast":
                shippingStrategy = new GiaoHangNhanhShipping();
                break;
            case "express":
                shippingStrategy = new GiaoHangHoaTocShipping();
                break;
            default:
                shippingStrategy = new GiaoHangCoBanShipping();
                break;
        }

        // Tính phí vận chuyển
        long shippingCost = shippingStrategy.calculateShippingCost(total);


        // Thêm phí vận chuyển và phương thức vận chuyển vào model
        model.addAttribute("shippingcost", shippingCost);
        model.addAttribute("shipping-method", shippingMethod);

        return new ModelAndView("customer/order", model);

    }







//    @RequestMapping("")
//    public ModelAndView newOrder(ModelMap model, HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        Integer id = (Integer) session.getAttribute("id");
//        List<CartItem> cartItemList = cartItemService.findAll();
//        List<CartItem> listCartItemSelecteds = new ArrayList<>();
//        Integer quantity = 0;
//        long total = 0;
//        for (CartItem cartItem : cartItemList) {
//            // Nếu checkbox được chọn thì thêm vào list thanh toán
//            String selected = request.getParameter(String.valueOf(cartItem.getCartItemId()));
//            if (selected != null) {
//
//                if(cartItem.getQuantity() > cartItem.getProducts().getQuantity()){
//                   cartItem.setQuantity(cartItem.getProducts().getQuantity());
//                }
//
//                listCartItemSelecteds.add(cartItem);
//                quantity += cartItem.getQuantity();
//                total += cartItem.getQuantity() * cartItem.getProducts().getPrice();
//            }
//        }
//        model.addAttribute("quantity", quantity);
//        model.addAttribute("total", total);
//        // Nếu chưa check sản phẩm nào cả.
//        if (listCartItemSelecteds.size() == 0) {
//            // Có thể dùng session để lưu thông báo thay vì code tải lại trang toàn bộ.
//            if (id == null) {
//                // Nếu chưa đăng nhập thì chuyển hướng đến trang đăng nhập
//                return new ModelAndView("redirect:/login");
//            }
//            List<CartItem> cartItemEntities = cartItemService.getCartItemsByCartId(id);
//            Optional<Cart> opt = cartService.findById(id);
//            if (opt.isPresent()) {
//                CartModel cart = new CartModel();
//                BeanUtils.copyProperties(opt.get(), cart);
//                model.addAttribute("cart", cart);
//            } else {
//                return new ModelAndView("customer/cart", model);
//            }
//            if (cartItemEntities != null) {
//                List<CartItemModel> cartItemModels = new ArrayList<>();
//                for (CartItem cartItemEntity : cartItemEntities) {
//                    CartItemModel cartItem = new CartItemModel();
//                    BeanUtils.copyProperties(cartItemEntity, cartItem);
//                    cartItemModels.add(cartItem);
//                }
//                model.addAttribute("cartItems", cartItemModels);
//                model.addAttribute("messageCart", "Vui lòng chọn sản phẩm để thanh toán");
//            }
//            return new ModelAndView("customer/cart", model);
//        }
//        Optional<Customer> opt = customerService.findById(id);
//        if (opt.isPresent()) {
//            Customer entity = opt.get();
//            CustomerModel customerModel = new CustomerModel();
//            BeanUtils.copyProperties(entity, customerModel);
//            model.addAttribute("customer", customerModel);
//        }
//        // Danh sách sản phẩm được chọn thanh toán.
//        model.addAttribute("cartItemOrder", listCartItemSelecteds);
//
//        return new ModelAndView("customer/order", model);
//
//    }


    @RequestMapping("/view")
    public ModelAndView viewOrder(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        Optional<Customer> opt = customerService.findById(id);
        if (opt.isPresent()) {
            Customer entity = opt.get();
            CustomerModel customerModel = new CustomerModel();
            BeanUtils.copyProperties(entity, customerModel);
            model.addAttribute("customer", customerModel);
        } else {
            return new ModelAndView("redirect:/login");
        }

        List<Order> orderEntity = orderService.listOrderByCustomerId(id);
        if (orderEntity != null) {
            model.addAttribute("order", orderEntity);
        }

        return new ModelAndView("customer/vieworder", model);
    }


    // đang lam
    @RequestMapping("/detail/{orderId}")
    public ModelAndView detailOrder(ModelMap model, HttpServletRequest request, @PathVariable("orderId") String orderId) {

        System.out.println("orderId: " + orderId);
        Integer orderIdInt = Integer.parseInt(orderId.toString().trim());
        System.out.println("orderIdInt: " + orderIdInt);
            HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        Optional<Customer> opt = customerService.findById(id);
        if (opt.isPresent()) {
            Customer entity = opt.get();
            CustomerModel customerModel = new CustomerModel();
            BeanUtils.copyProperties(entity, customerModel);
            model.addAttribute("customer", customerModel);
        } else {
            return new ModelAndView("redirect:/login");
        }


        Order order = orderService.findById(orderIdInt).get();
        model.addAttribute("order", order);

//        Integer orderIdInt = Integer.parseInt(orderId);
//        Integer orderId = Integer.parseInt(request.getParameter("orderId"));
        List<OrderItem> orderItemEntities = orderItemService.listOrderItemsByOrderId(orderIdInt);
        if (orderItemEntities != null) {
            System.out.println("orderItemEntities: có danh sách");
            model.addAttribute("orderItems", orderItemEntities);
        } else {
            System.out.println("orderItemEntities: không có danh sách");
        }

        // Lấy phương thức vận chuyển đã chọn từ request
        String shippingMethod = order.getShipTo();
        int ship = 0;
        if(shippingMethod == null || shippingMethod.equals("Giao Hang Co Ban")){
            ship = 20000;
        }else if(shippingMethod.equals("Giao Hang Nhanh")){
            ship = 30000;
        }else if(shippingMethod.equals("Giao Hang Tiet Kiem")){
            ship = 50000;
        }

        model.addAttribute("shippingcost", ship);

        return new ModelAndView("customer/detailorderitem", model);
    }


}




