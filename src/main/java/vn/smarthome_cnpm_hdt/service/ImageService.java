package vn.smarthome_cnpm_hdt.service;

import vn.smarthome_cnpm_hdt.entity.ImageEntity;

import java.util.List;
import java.util.Optional;

public interface ImageService {

    <S extends ImageEntity> S save(S entity);

    Optional<ImageEntity> findById(Integer integer);

    void deleteById(Integer integer);

    void delete(ImageEntity entity);

    List<ImageEntity> findAll();
}
