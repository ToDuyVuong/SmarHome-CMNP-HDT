package vn.smarthome_cnpm_hdt.controller.customer;


import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.smarthome_cnpm_hdt.entity.Cart;
import vn.smarthome_cnpm_hdt.entity.Customer;
import vn.smarthome_cnpm_hdt.model.CustomerModel;
import vn.smarthome_cnpm_hdt.repository.CartRepository;
import vn.smarthome_cnpm_hdt.service.ICartService;
import vn.smarthome_cnpm_hdt.service.ICustomerService;


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
    public String showRegisterForm(HttpServletRequest request, Model model,
                                   @ModelAttribute("customer") CustomerModel customer) {
        HttpSession session = request.getSession();

        try {
            System.out.println("a" + customer);

            if (customer.getUsername() == null || customer.getFullname() == null) {
                System.out.println("b = null");
                session.invalidate();
            } else {
                customer.setPassword(null);
                customer.setPassword2(null);
                model.addAttribute("customer", customer);
            }
            return "customer/register";

        } catch (Exception e) {
            session.invalidate();
            return "customer/register";
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(ModelMap model, HttpSession session,
                          @Valid @ModelAttribute("customer") CustomerModel customer, BindingResult result,
                          HttpServletRequest request, RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            session.setAttribute("messageRegister", "Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
            redirectAttributes.addFlashAttribute("customer", customer);
            System.out.println("Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
            System.out.println("result.hasErrors() " + customer);

            return "redirect:/register";
        }

        Customer entity = new Customer();
        BeanUtils.copyProperties(customer, entity);

        try {
            Customer existingUser = customerService.findByUsername(entity.getUsername());

            if (existingUser != null) {
                session.setAttribute("messageRegister", "Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
                redirectAttributes.addFlashAttribute("customer", customer);
                System.out.println("Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
                return "redirect:/register";
            }

            existingUser = customerService.findByEmail(entity.getEmail());
            if (existingUser != null) {
                session.setAttribute("messageRegister", "Email đã tồn tại. Xin hãy nhập email khác.");
                redirectAttributes.addFlashAttribute("customer", customer);
                System.out.println("Email đã tồn tại.");
                return "redirect:/register";
            }

            existingUser = customerService.findByPhone(entity.getPhone());
            if (existingUser != null) {
                session.setAttribute("messageRegister", "Số điện thoại đã tồn tại. Xin hãy nhập số điện thoại khác.");
                redirectAttributes.addFlashAttribute("customer", customer);
                System.out.println("Số điện thoại đã tồn tại.");
                return "redirect:/register";
            }

            if (!customer.getPassword().equals(customer.getPassword2())) {
                session.setAttribute("messageRegister", "Khẩu xác nhận không trùng khớp!");
                redirectAttributes.addFlashAttribute("customer", customer);
                System.out.println("Khẩu xác nhận không trùng khớp!");
                return "redirect:/register";
            }

            customerService.save(entity);
            session.setAttribute("messageRegister", "Đăng ký thành công. Bạn hãy đăng nhập.");

            // Tạo giỏ hàng
            Cart cartEntity = new Cart();
            cartEntity.setCartId(entity.getCustomerId());
            cartEntity.setCustomer(entity);
            // Cài đặt giá trị mặc định cho số lượng
            cartEntity.setQuantity(0);
            cartService.save(cartEntity);

            customer.setNewAccount(1);
            redirectAttributes.addFlashAttribute("customer", customer);

            System.out.println("Đăng ký thành công. Bạn hãy đăng nhập.");
            return "redirect:/login";
        } catch (Exception e) {
            session.setAttribute("messageRegister", "Đăng ký thất bại.");
            redirectAttributes.addFlashAttribute("customer", customer);
            System.out.println("Đăng ký thất bại.");
            return "redirect:/register";
        }
    }


//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public ModelAndView AddUser(ModelMap model, HttpSession session,
//                                @Valid @ModelAttribute("customer") CustomerModel customer, BindingResult result,
//                                HttpServletRequest request) {
//
//        if (result.hasErrors()) {
//            session.setAttribute("messageRegister", "Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
//            model.addAttribute("customer", customer);
//            System.out.println("Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
//
//            return new ModelAndView("customer/register");
//        }
//
//        Customer entity = new Customer();
//        BeanUtils.copyProperties(customer, entity);
//
//        try {
//            Customer User = new Customer();
//            User = customerService.findByUsername(entity.getUsername());
//
//            if (User != null) {
//                session.setAttribute("messageRegister", "Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
//                model.addAttribute("customer", customer);
//                System.out.println("Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
//                return new ModelAndView("customer/register");
//            }
//
//            User = customerService.findByEmail(entity.getEmail());
//            if (User != null) {
//                session.setAttribute("messageRegister", "Email đã tồn tại.");
//                model.addAttribute("customer", customer);
//                System.out.println("Email đã tồn tại.");
//                return new ModelAndView("customer/register");
//            }
//
//            User = customerService.findByPhone(entity.getPhone());
//            if (User != null) {
//                session.setAttribute("messageRegister", "Số điện thoại đã tồn tại.");
//                model.addAttribute("customer", customer);
//                System.out.println("Số điện thoại đã tồn tại.");
//                return new ModelAndView("customer/register");
//            }
//
//            if (User == null) {
//                if (customer.getPassword().equals(customer.getPassword2())) {
//                    try {
//                        customerService.save(entity);
//                        session.setAttribute("messageRegister", "Đăng ký thành công. Bạn hãy đăng nhập.");
//
//                        // Tạo giỏ hàng.
//                        Cart cartEntity = new Cart();
//                        cartEntity.setCartId(entity.getCustomerId());
//                        cartEntity.setCustomer(entity);
//                        cartEntity.getQuantity();
//                        cartService.save(cartEntity);
//                        System.out.println("Đăng ký thành công. Bạn hãy đăng nhập.");
//                    } catch (Exception e) {
//                        session.setAttribute("messageRegister", "Lỗi lưu trữ.");
//                        System.out.println("Lỗi lưu trữ.");
//                        return new ModelAndView("redirect:/register");
//                    }
//                } else {
//                    session.setAttribute("messageRegister", "Khẩu xác nhân không trùng khớp!");
//                    System.out.println("Khẩu xác nhân không trùng khớp!");
//                    return new ModelAndView("forward:/register");
//                }
//            }
//
//
//        } catch (Exception e) {
//        }
//
//        session.setAttribute("messageRegister", "Đăng ký thất bại.");
//        System.out.println("Đăng ký thất bại.");
//        return new ModelAndView("redirect:/register");
//    }


//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public ModelAndView AddUser(ModelMap model, HttpSession session,
//                                @Valid @ModelAttribute("customer") CustomerModel customer, BindingResult result,
//                                HttpServletRequest request) {
//
//        if (result.hasErrors()) {
//            session.setAttribute("messageRegister", "Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
//            model.addAttribute("customer", customer);
//            System.out.println("Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
//
//            return new ModelAndView("customer/register");
//        }
//
//        Customer entity = new Customer();
//        BeanUtils.copyProperties(customer, entity);
//
//        try {
//            Customer User = new Customer();
//            User = customerService.findByUsername(entity.getUsername());
//
//            if (User != null) {
//                session.setAttribute("messageRegister", "Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
//                model.addAttribute("customer", customer);
//                System.out.println("Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
//                return new ModelAndView("customer/register");
//            }
//
//            User = customerService.findByEmail(entity.getEmail());
//            if (User != null) {
//                session.setAttribute("messageRegister", "Email đã tồn tại.");
//                model.addAttribute("customer", customer);
//                System.out.println("Email đã tồn tại.");
//                return new ModelAndView("customer/register");
//            }
//
//            User = customerService.findByPhone(entity.getPhone());
//            if (User != null) {
//                session.setAttribute("messageRegister", "Số điện thoại đã tồn tại.");
//                model.addAttribute("customer", customer);
//                System.out.println("Số điện thoại đã tồn tại.");
//                return new ModelAndView("customer/register");
//            }
//
//            if (User == null) {
//                if (customer.getPassword().equals(customer.getPassword2())) {
//                    try {
//                        customerService.save(entity);
//                        session.setAttribute("messageRegister", "Đăng ký thành công. Bạn hãy đăng nhập.");
//
//                        // Tạo giỏ hàng.
//                        Cart cartEntity = new Cart();
//                        cartEntity.setCartId(entity.getCustomerId());
//                        cartEntity.setCustomer(entity);
//                        cartEntity.getQuantity();
//                        cartService.save(cartEntity);
//                        System.out.println("Đăng ký thành công. Bạn hãy đăng nhập.");
//                    } catch (Exception e) {
//                        session.setAttribute("messageRegister", "Lỗi lưu trữ.");
//                        System.out.println("Lỗi lưu trữ.");
//                        return new ModelAndView("redirect:/register");
//                    }
//                } else {
//                    session.setAttribute("messageRegister", "Khẩu xác nhân không trùng khớp!");
//                    System.out.println("Khẩu xác nhân không trùng khớp!");
//                    return new ModelAndView("forward:/register");
//                }
//            }
//
//
//        } catch (Exception e) {
//        }
//
//        session.setAttribute("messageRegister", "Đăng ký thất bại.");
//        System.out.println("Đăng ký thất bại.");
//        return new ModelAndView("redirect:/register");
//    }

//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public ModelAndView AddUser(ModelMap model, HttpSession session,
//                                @Valid @ModelAttribute("customer") CustomerModel customer, BindingResult result,
//                                HttpServletRequest request) {
//
//        if (result.hasErrors()) {
//            session.setAttribute("messageRegister", "Nhập thiếu thông tin!!!   Hãy nhập đủ thông tim.");
//            return new ModelAndView("redirect:/register");
//        }
//
//        Customer entity = new Customer();
//        BeanUtils.copyProperties(customer, entity);
//        Customer User = new Customer();
//
//        try {
//            User = customerService.findByUsername(entity.getUsername());
//        } catch (Exception e) {
//        }
//
//        if (User == null) {
//            if (customer.getPassword().equals(customer.getPassword2())) {
//                try {
//                    customerService.save(entity);
//                    session.setAttribute("messageRegister", "Đăng ký thành công. Bạn hãy đăng nhập.");
//
//                    // Tạo giỏ hàng.
//                    Cart cartEntity = new Cart();
//                    cartEntity.setCartId(entity.getCustomerId());
//                    cartEntity.setCustomer(entity);
//                    cartEntity.getQuantity();
//                    cartService.save(cartEntity);
//
//
//
//                    return new ModelAndView("redirect:/login");
//                } catch (Exception e) {
//                    session.setAttribute("messageRegister", "Lỗi lưu trữ.");
//                    return new ModelAndView("redirect:/register");
//                }
//            } else {
//                session.setAttribute("messageRegister", "Khẩu xác nhân không trùng khớp!");
//                return new ModelAndView("forward:/register");
////				return new ModelAndView("forward:/");
//            }
//        } else {
//            session.setAttribute("messageRegister", "Tên tài khoản đã tồn tại! Xin hãy tạo tên tài khoản khác.");
////            return new ModelAndView("forward:/register/", model);
//            return new ModelAndView("redirect:/register");
//        }
//    }
}
