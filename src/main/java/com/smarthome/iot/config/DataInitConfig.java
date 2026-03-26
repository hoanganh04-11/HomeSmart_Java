package com.smarthome.iot.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.smarthome.iot.service.UserService;

@Configuration
public class DataInitConfig {

    @Bean
    public CommandLineRunner initData(UserService userService) {
        return args -> {
            // Tạo tài khoản admin mặc định nếu DB trống
            userService.initDefaultAdmin();
        };
    }
}
