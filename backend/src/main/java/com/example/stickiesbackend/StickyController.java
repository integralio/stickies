package com.example.stickiesbackend;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sticky")
public class StickyController {
    @GetMapping
    public Object[] index() {

        return new Object[0];
    }

    @PostMapping
    public void postSticky() {
    }
}
