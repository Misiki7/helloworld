package com.example;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 硝酸铜
 * @date 2021/9/1
 */
@RestController
@RequestMapping(value = "/greeting")
public class Controller {

    @GetMapping(value = "hello")
    public String hello(){
        return "hello world";
    }
}
