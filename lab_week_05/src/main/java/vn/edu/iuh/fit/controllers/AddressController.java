package vn.edu.iuh.fit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vn.edu.iuh.fit.entity.ResponsePages;
import vn.edu.iuh.fit.models.Address;
import vn.edu.iuh.fit.services.AddressService;

@RestController
@RequestMapping("/address")
@CrossOrigin(origins = "*")
public class AddressController {
    @Autowired
    private AddressService addressService;

    @PostMapping
    public boolean create(@RequestBody Address address){
        return addressService.create(address) != null;
    }

    @PutMapping
    public boolean update(@RequestBody Address address){
        return addressService.update(address) != null;
    }

    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable("id") long id){
        addressService.delete(id);
        return true;
    }

    @GetMapping("/{id}")
    public Address getByID(@PathVariable("id") long id){
        return addressService.getByID(id);
    }

    @GetMapping("get-page/{page}")
    public ResponseEntity<ResponsePages> getAll(@PathVariable("page") int page){
        Pageable pageable = PageRequest.of(page, 4);
        return ResponseEntity.status(HttpStatus.OK).body(
                addressService.getAll(pageable)
        );
    }
}
