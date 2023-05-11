package vn.smarthome_cmpm_hdt.controller.customer;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome_cmpm_hdt.entity.Customer;
import vn.smarthome_cmpm_hdt.model.CustomerModel;
import vn.smarthome_cmpm_hdt.service.ICustomerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@RequestMapping("profile")
@Controller
public class  ProfileController {

    @Autowired
    ICustomerService customerService;

    @GetMapping("")
    public ModelAndView ViewProfile(ModelMap model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");

        Optional<Customer> opt = customerService.findById(id);
        if (opt.isPresent()) {
            Customer entity = opt.get();
            CustomerModel customerModel = new CustomerModel();
            BeanUtils.copyProperties(entity, customerModel);
            model.addAttribute("customer", customerModel);
        }
        return new ModelAndView("customer/profile", model);
    }

    @RequestMapping("/editProfile")
    public ModelAndView EditProfile(ModelMap model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        Optional<Customer> opt = customerService.findById(id);

        if (opt.isPresent()) {
            Customer entity = opt.get();
            CustomerModel customerModel = new CustomerModel();
            BeanUtils.copyProperties(entity, customerModel);
            model.addAttribute("customer", customerModel);
        }
        return new ModelAndView("customer/editprofile");
    }

    @RequestMapping("/saveEditProfile")
    public ModelAndView SaveEditProfile(ModelMap model, CustomerModel customer, BindingResult result, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        // lấy thông tin user
        Optional<Customer> opt = customerService.findById(id);

        if (opt.isPresent()) {
            Customer entity = opt.get();

            entity.setFullname(customer.getFullname());
            entity.setGender(customer.isGender());
            entity.setEmail(customer.getEmail());
            entity.setBirthday(customer.getBirthday());
            entity.setPhone(customer.getPhone());
            entity.setAddress(customer.getAddress());


            CustomerModel customerModel = new CustomerModel();
            BeanUtils.copyProperties(entity, customerModel);

            model.addAttribute("customer", customerModel);

            try {
                customerService.save(entity);
                model.addAttribute("message", "Chỉnh sửa thông tin thành công.");
            } catch (Exception e) {
                session.setAttribute("message", "Lỗi lưu trữ.");
                return new ModelAndView("redirect:/profile/editprofile");
            }
        }
        return new ModelAndView("customer/profile");

    }


    @RequestMapping("/changePassword")
    public ModelAndView ChangePasswordProfile(ModelMap model, CustomerModel customer, BindingResult result, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        // lấy thông tin user
        Optional<Customer> opt = customerService.findById(id);

        if (opt.isPresent()) {
            Customer entity = opt.get();
            CustomerModel customerModel = new CustomerModel();

            if (result.hasErrors()) {
                model.addAttribute("message", "Hãy nhập đầy đủ thông tin.");
                return  new ModelAndView( "customer/changepassword");
            }

            if(entity.getPassword().equals(customer.getPassword()) && customer.getPassword2().equals(customer.getNewpassword())) {
                entity.setPassword(customer.getPassword2());
                model.addAttribute("message", "Đổi mật khẩu thành công");
                BeanUtils.copyProperties(entity, customerModel);
                customerService.save(entity);
            }else if (!entity.getPassword().equals(customer.getPassword()) ){
                model.addAttribute("message", "Mật khẩu củ không chính xác");
                return new ModelAndView("customer/changepassword");
            }else if (!customer.getPassword2().equals(customer.getNewpassword())){
                model.addAttribute("message", "Mật khẩu xác nhận không chính xác");
                return new ModelAndView("customer/changepassword");
            }
            else {
                model.addAttribute("message", "Thay đổi.");
            }
            model.addAttribute("customer", customerModel);
        }
        return new ModelAndView("customer/profile");
    }
}
