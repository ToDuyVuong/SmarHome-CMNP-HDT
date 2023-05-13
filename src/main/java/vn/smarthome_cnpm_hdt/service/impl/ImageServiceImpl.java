package vn.smarthome_cnpm_hdt.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.smarthome_cnpm_hdt.entity.ImageEntity;
import vn.smarthome_cnpm_hdt.repository.ImageRepository;
import vn.smarthome_cnpm_hdt.service.ImageService;

import java.util.List;
import java.util.Optional;

@Service
public class ImageServiceImpl implements ImageService {
    @Autowired
    ImageRepository imageRepository;



    public ImageServiceImpl(ImageRepository adminRepository) {
        this.imageRepository = imageRepository;
    }

    @Override
    public <S extends ImageEntity> S save(S entity) {
        return imageRepository.save(entity);
    }

    @Override
    public Optional<ImageEntity> findById(Integer integer) {
        return imageRepository.findById(integer);
    }

    @Override
    public void deleteById(Integer integer) {
        imageRepository.deleteById(integer);
    }

    @Override
    public void delete(ImageEntity entity) {
        imageRepository.delete(entity);
    }

    @Override
    public List<ImageEntity> findAll() {
        return imageRepository.findAll();
    }
}

