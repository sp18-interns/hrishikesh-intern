package com.annotaions;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MyConfig {
    @Bean
    public Student getStudent() {
        System.out.println("Creating Student Object");
        return new Student();
    }
}
