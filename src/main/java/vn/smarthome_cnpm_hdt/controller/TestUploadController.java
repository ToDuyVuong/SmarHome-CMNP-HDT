package vn.smarthome_cnpm_hdt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import vn.smarthome_cnpm_hdt.entity.ImageEntity;
import vn.smarthome_cnpm_hdt.service.ImageService;
import vn.smarthome_cnpm_hdt.service.impl.CloudinaryServiceImpl;

import java.util.List;

@Controller
public class TestUploadController {
    @Autowired
    ImageService imageService;

    @Autowired
    CloudinaryServiceImpl cloudinaryService;


//    @GetMapping("/upload")
//    public String upload() {
//        return "test/image";
//    }

//    // Lấy nhiều hình ảnh
//    @PostMapping("/upload")
//    public String upload(ModelMap model, @ModelAttribute("listImage") MultipartFile[] listImage) throws Exception {
//        for (MultipartFile y : listImage) {
//            String urlImg = cloudinaryService.uploadFile(y);
//            ImageEntity img = new ImageEntity();
//            img.setUrlImage(urlImg);
//            img.setProductId(1);
//            imageService.save(img);
//        }
//        List<ImageEntity> imageEntities = imageService.findAll();
//        if (imageEntities.size() > 0) {
//            model.addAttribute("listImage", imageEntities);
//        }
//        return "test/image";
//    }


//     Lấy 1 hình ảnh
    @PostMapping("/upload")
    public String upload( ModelMap model, @ModelAttribute("listImage") MultipartFile listImage) throws Exception {
            String urlImg = cloudinaryService.uploadFile(listImage);
            ImageEntity img = new ImageEntity();
            img.setUrlImage(urlImg);
            img.setProductId(1);
            imageService.save(img);
        List<ImageEntity>  imageEntities = imageService.findAll();
        if(imageEntities.size() > 0){
            model.addAttribute("listImage", imageEntities);
        }
        return "test/image";
    }

    @GetMapping("/upload")
    public String getUpload( ModelMap model) throws Exception {

        List<ImageEntity>  imageEntities = imageService.findAll();
        if(imageEntities.size() > 0){
            model.addAttribute("listImage", imageEntities);
        }
        return "test/image";
    }


//    @ModelAttribute("listImage") MultipartFile[] listImage) throws Exception {

//    for ( MultipartFile y : listImage) {
//        String urlImg = cloudinaryService.uploadFile(y);
//        ProductImage img = new ProductImage();
//        img.setProduct(newPro);
//        img.setUrl_Image(urlImg);
//        productImageService.save(img);
//    }
}
