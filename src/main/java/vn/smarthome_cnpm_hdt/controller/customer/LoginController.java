package vn.smarthome_cnpm_hdt.controller.customer;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.smarthome_cnpm_hdt.entity.Customer;
import vn.smarthome_cnpm_hdt.model.CustomerModel;
import vn.smarthome_cnpm_hdt.service.ICustomerService;


@Controller
@RequestMapping("")
public class LoginController {
    @Autowired
    ICustomerService customerService;

    // Vao trang login
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String Login(ModelMap model, HttpServletRequest request) {
        model.addAttribute("message", "Nhập tài khoản và mật khẩu.");
        // Get the current URL
        String currentUrl = request.getRequestURI();
        System.out.println("currentUrl = " + currentUrl);
        try {
            CustomerModel customer = (CustomerModel) model.getAttribute("customer");
            if (customer.getNewAccount()==1) {
                model.addAttribute("message", "Bạn đã đăng ký thành công. Hãy nhập tài khoản và mật khẩu để đăng nhập.");
            }
            customer.setNewAccount(2);
            model.addAttribute("customer", customer);
        }
        catch (Exception e){
            System.out.println(e);
        }
        return "customer/login";
    }

    // Hoat dong login
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String Login(ModelMap model, HttpSession session, @Valid @ModelAttribute("us") CustomerModel us,
                        BindingResult result, HttpServletRequest request, @RequestParam("username") String userName,
                        @RequestParam("password") String passWord, RedirectAttributes redirectAttributes) {

        // xử lý yêu cầu đăng nhập tại đây

        String username = request.getParameter("username");
        String password = request.getParameter("password");

            try {
                Customer customer = customerService.findByUsername(username);
                redirectAttributes.addFlashAttribute("customer", customer);
                if (result.hasErrors()) {
                    model.addAttribute("message", result.getAllErrors().toString());
                    return "index";
                }
                if (userName == "" && passWord == "") {
                    model.addAttribute("message", "Chưa nhập tài khoản và mật khẩu!");
                    return "customer/login";
                } else if (userName == "") {
                    model.addAttribute("message", "Chưa nhập tài khoản!");
                    return "customer/login";
                } else if (passWord == "") {
                    model.addAttribute("message", "Chưa nhập mật khẩu!");
                    return "customer/login";
                } else if (customer == null) {
                    model.addAttribute("message", "Tài khoản không tồn tại!");
                    return "customer/login";
                } else if (password.equals(customer.getPassword())) {
                    model.addAttribute("message", "Xin chào, đây là trang của tôi!co user" + customer.getFullname());

                    session.setAttribute("id", customer.getCustomerId());
                    session.setAttribute("fullname", customer.getFullname());

                    // nếu sử dụng redirect thì sẻ ko lấy đc biến message.
                    // redirect sẻ trả về đường link map.
                    return "redirect:/"; // = return "index";
                } else {

                    System.out.println("Sai PassWord nhap-" + passWord + "-user-" + customer.getPassword().toString() + "-");
                    model.addAttribute("message", "Sai mật khẩu!");
                    return "customer/login";
                }
            } catch (Exception e) {
                System.out.println(username);
                return "customer/login";
            }
        }



    // Logout
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return new ModelAndView("redirect:/");
    }

}
