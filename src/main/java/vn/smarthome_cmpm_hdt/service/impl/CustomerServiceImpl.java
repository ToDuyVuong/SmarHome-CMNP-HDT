package vn.smarthome_cmpm_hdt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import vn.smarthome_cmpm_hdt.entity.Customer;
import vn.smarthome_cmpm_hdt.repository.CustomerRepository;
import vn.smarthome_cmpm_hdt.service.ICustomerService;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    CustomerRepository customerRepository;

    public CustomerServiceImpl(CustomerRepository customerRepository) {

        this.customerRepository = customerRepository;
    }

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public <S extends Customer> List<S> findAll(Example<S> example) {
        return customerRepository.findAll(example);
    }

    @Override
    public <S extends Customer> S save(S entity) {
        return customerRepository.save(entity);
    }

    @Override
    public Optional<Customer> findById(Integer integer) {
        return customerRepository.findById(integer);
    }

    @Override
    public long count() {
        return customerRepository.count();
    }

    @Override
    public Customer findByUsernameContaining(String username) {
        return customerRepository.findByUsernameContaining(username);
    }

    @Override
    public List<Customer> findByFullnameContaining(String fullname) {
        return customerRepository.findByFullnameContaining(fullname);
    }

    @Override
    public Customer findByUsername(String username) {
        return customerRepository.findByUsername(username);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    public void deleteCustomerByCustomerId(int id) {
        customerRepository.deleteById(id);
    }

}
