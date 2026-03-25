package com.smarthome.iot.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.smarthome.iot.domain.User;


//CRUD: create, read, update, delete
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User save(User hoidanit);
    
}
