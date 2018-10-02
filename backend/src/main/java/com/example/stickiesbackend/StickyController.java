package com.example.stickiesbackend;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/sticky")
public class StickyController {

    private StickyRepository repository;

    public StickyController(StickyRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public Iterable<Sticky> index() {

        return repository.findAll();
    }

    @PostMapping
    public ResponseEntity<Object> postSticky(@RequestBody Sticky sticky) {
        if (sticky.getContent() == null) {
            return ResponseEntity.badRequest().build();
        }
        repository.save(sticky);
        return null;
    }
}
