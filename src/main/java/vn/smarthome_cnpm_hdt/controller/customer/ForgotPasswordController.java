package vn.smarthome_cnpm_hdt.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome_cnpm_hdt.entity.Customer;
import vn.smarthome_cnpm_hdt.model.CustomerModel;
import vn.smarthome_cnpm_hdt.model.Mail;
import vn.smarthome_cnpm_hdt.service.ICustomerService;
import vn.smarthome_cnpm_hdt.service.IMailService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("")
public class ForgotPasswordController {

    @Autowired
    ICustomerService customerService;

    @Autowired
    IMailService mailService;

    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String Login(ModelMap model) {
        model.addAttribute("message", "Nhập tài khoản cần lấy lại mật khẩu!");

        return "customer/forgot";
    }

    @RequestMapping(value = "forgot", method = RequestMethod.POST)
    public String forgotPassword(ModelMap model, HttpServletRequest req, HttpSession session) {
        String UserName = req.getParameter("username").trim();
        Customer Customer = customerService.findByUsername(UserName);
        if (Customer == null || UserName == "") {
            model.addAttribute("message", "Tài khoản không tồn tại!");
            return "customer/forgot";
        }
        session.setAttribute("idnewpassword", Customer.getCustomerId());
        System.out.println("bbb=" +Customer.getCustomerId());

        session.setAttribute("fullnamenewpassword", Customer.getFullname());
        int code = (int) Math.floor(((Math.random() * 899999) + 100000));
        Mail mail = new Mail();
        mail.setMailFrom("conc5288@gmail.com");

        mail.setMailTo(Customer.getEmail());
        mail.setMailSubject("For got Password");
        mail.setMailContent("Your code is: " + code);
        mailService.sendEmail(mail);
        System.out.println("code" + code);
        session.setAttribute("code", code);
        model.addAttribute("message", "Tài khoản tồn tại!");
        return "customer/forgot";
    }

    @RequestMapping(value = "otp", method = RequestMethod.POST)
    public String codeOtp(ModelMap model, HttpServletRequest req, HttpSession session) {
        int otp = Integer.parseInt(req.getParameter("otp").trim());
        System.out.println("opt :" + otp);

        int code = (int) session.getAttribute("code");
        System.out.println("code :" + code);

        if (otp != code) {
            model.addAttribute("message", "Mã OTP không đúng!");
            return "customer/forgot";
        }
        model.addAttribute("message", "Tài khoản tồn tại!");
        return "customer/newpassword";
    }

    @RequestMapping(value = "newpassword", method = RequestMethod.POST)
    public ModelAndView newPassword(ModelMap model, HttpServletRequest request) {
        String newPassword = request.getParameter("newpassword").trim();
        String confirmPassword = request.getParameter("confirmpassword").trim();
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("idnewpassword");
        System.out.println("aaa=" +id);
        // lấy thông tin user
        Optional<Customer> opt = customerService.findById(id);

        if (opt.isPresent()) {
            Customer entity = opt.get();
            CustomerModel customerModel = new CustomerModel();

            if (!newPassword.equals(confirmPassword) ) {
                model.addAttribute("message", "Hãy nhập đầy đủ thông tin.");
                return new ModelAndView("customer/newpassword");
            }else if (newPassword.equals(confirmPassword) ) {
                entity.setPassword(newPassword);
                model.addAttribute("message", "Đổi mật khẩu thành công");
                customerService.save(entity);
            } else{
                model.addAttribute("message", "Mật khẩu không trùng khớp!");
                return new ModelAndView("customer/newpassword");
            }
        }
        return new ModelAndView("redirect:/login");
    }

}

