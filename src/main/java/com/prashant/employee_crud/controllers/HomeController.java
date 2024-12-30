package com.prashant.employee_crud.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/")
@RestController
public class HomeController {

    @GetMapping(path = "/")
    public ResponseEntity<String> index() {
        return ResponseEntity.ok("Welcome to employee crud application");
    }
}
