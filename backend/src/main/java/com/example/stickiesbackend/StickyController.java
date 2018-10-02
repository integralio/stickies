package com.example.stickiesbackend;

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
    public void postSticky(@RequestBody Sticky sticky) {
        repository.save(sticky);
    }
}
