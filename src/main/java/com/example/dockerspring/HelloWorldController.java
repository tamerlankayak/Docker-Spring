package com.example.dockerspring;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @GetMapping(path = "/")
    public Hello helloWorld() {
        return new Hello("Hello", "World");
    }


}

record Hello(String name, String description) {
}
