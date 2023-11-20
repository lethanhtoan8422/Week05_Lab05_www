package vn.edu.iuh.fit.controllers;

import jakarta.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vn.edu.iuh.fit.entity.ResponsePages;
import vn.edu.iuh.fit.entityID.CandidateSkillID;
import vn.edu.iuh.fit.models.CandidateSkill;
import vn.edu.iuh.fit.services.CandidateSkillService;

@RestController
@RequestMapping("/candidate-skill")
@CrossOrigin(origins = "*")
public class CandidateSkillController {
    @Autowired
    private CandidateSkillService candidateSkillService;

    @PostMapping
    public boolean create(@RequestBody CandidateSkill obj){
        return candidateSkillService.create(obj) != null;
    }

    @PutMapping
    public boolean update(@RequestBody CandidateSkill obj){
        return candidateSkillService.update(obj) != null;
    }

    @DeleteMapping
    public boolean delete(@RequestBody CandidateSkillID candidateSkillID){
        candidateSkillService.delete(candidateSkillID);
        return true;
    }

    @GetMapping
    public CandidateSkill getByID(@RequestParam("candidate") long candidateID, @RequestParam("skill") long skillID){
        CandidateSkillID candidateSkillID = new CandidateSkillID(candidateID, skillID);
        return candidateSkillService.getByID(candidateSkillID);
    }

    @GetMapping("get-page/{page}")
    public ResponseEntity<ResponsePages> getAll(@PathVariable("page") int page){
        Pageable pageable = PageRequest.of(page, 4);
        return ResponseEntity.status(HttpStatus.OK).body(
                candidateSkillService.getAll(pageable)
        );
    }
}
