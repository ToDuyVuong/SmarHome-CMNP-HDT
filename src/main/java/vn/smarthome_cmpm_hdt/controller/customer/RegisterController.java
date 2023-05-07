package vn.smarthome_cmpm_hdt.controller.customer;


import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome_cmpm_hdt.entity.Cart;
import vn.smarthome_cmpm_hdt.entity.Customer;
import vn.smarthome_cmpm_hdt.model.CustomerModel;
import vn.smarthome_cmpm_hdt.repository.CartRepository;
import vn.smarthome_cmpm_hdt.service.ICartService;
import vn.smarthome_cmpm_hdt.service.ICustomerService;


@RequestMapping("register")
@Controller
public class RegisterController {
    @Autowired
    ICustomerService customerService;
    @Autowired
    ICartService cartService;
    @Autowired
    private EntityManager entityManager;

    @Autowired
    private CartRepository cartRepository;


    // Vao trang register
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Register(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "customer/register";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView AddUser(ModelMap model, HttpSession session,
                                @Valid @ModelAttribute("customer") CustomerModel customer, BindingResult result,
                                HttpServletRequest request) {

        if (result.hasErrors()) {
            session.setAttribute("messageRegister", "Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
            return new ModelAndView("redirect:/register");
        }

        Customer entity = new Customer();
        BeanUtils.copyProperties(customer, entity);
        Customer User = new Customer();

        try {
            User = customerService.findByUsername(entity.getUsername());
        } catch (Exception e) {
        }

        if (User == null) {
            if (customer.getPassword().equals(customer.getPassword2())) {
                System.out.println("customer.getPassword() == customer.getPassword2())");
                try {
                    customerService.save(entity);
                    session.setAttribute("messageRegister", "Đăng ký thành công. Bạn hãy đăng nhập.");

                    // Tạo giỏ hàng.
                    Cart cartEntity = new Cart();
                    cartEntity.setCartId(entity.getCustomerId());
                    cartEntity.setCustomer(entity);
                    cartEntity.getQuantity();
                    cartService.save(cartEntity);



                    return new ModelAndView("redirect:/login");
                } catch (Exception e) {
                    session.setAttribute("messageRegister", "Lỗi lưu trữ.");
                    return new ModelAndView("redirect:/register");
                }
            } else {
                session.setAttribute("messageRegister", "Khẩu xác nhân không trùng khớp!");
                return new ModelAndView("forward:/register");
//				return new ModelAndView("forward:/");
            }
        } else {
            session.setAttribute("messageRegister", "Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
//            return new ModelAndView("forward:/register/", model);
            return new ModelAndView("redirect:/register");
        }
    }
}
