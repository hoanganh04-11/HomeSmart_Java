package com.smarthome.iot.service;

import org.springframework.stereotype.Service;

import com.smarthome.iot.domain.User;
import com.smarthome.iot.repository.UserRepository;

@Service
public class UserService {
    
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository){
        this.userRepository = userRepository;
    }

    public String handleHello(){
        return "Hello from service";
    }

    public User handleSaveUser(User user){
        User eric = this.userRepository.save(user);
        System.out.println(eric);
        return eric;
    }

}
