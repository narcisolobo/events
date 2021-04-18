package com.nlobo.events.repositories;

import com.nlobo.events.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);
    List<User> findAll();
}