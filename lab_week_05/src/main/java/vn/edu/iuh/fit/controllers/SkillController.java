package vn.edu.iuh.fit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vn.edu.iuh.fit.entity.ResponsePages;
import vn.edu.iuh.fit.models.Address;
import vn.edu.iuh.fit.models.Skill;
import vn.edu.iuh.fit.services.AddressService;
import vn.edu.iuh.fit.services.SkillService;

@RestController
@RequestMapping("/skill")
@CrossOrigin(origins = "*")
public class SkillController {
    @Autowired
    private SkillService skillService;

    @PostMapping
    public boolean create(@RequestBody Skill skill){
        return skillService.create(skill) != null;
    }

    @PutMapping
    public boolean update(@RequestBody Skill skill){
        return skillService.update(skill) != null;
    }

    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable("id") long id){
        skillService.delete(id);
        return true;
    }

    @GetMapping("/{id}")
    public Skill getByID(@PathVariable("id") long id){
        return skillService.getByID(id);
    }

    @GetMapping("get-page/{page}")
    public ResponseEntity<ResponsePages> getAll(@PathVariable("page") int page){
        Pageable pageable = PageRequest.of(page, 4);
        return ResponseEntity.status(HttpStatus.OK).body(
                skillService.getAll(pageable)
        );
    }
}
