package com.nlobo.events.services;

import com.nlobo.events.models.User;
import com.nlobo.events.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // register user and hash their password
    public User registerUser(User user) {
        String hashedPW = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashedPW);
        return userRepository.save(user);
    }

    // find user by email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // find user by id
    public User findUserById(Long id) {
        Optional<User> optionalUser = userRepository.findById(id);

        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }

    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepository.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

    // check for duplicate emails
    public boolean emailExists(String email) {
        List<User> existingUsers = userRepository.findAll();
        for (User existingUser : existingUsers) {
            if (email.equals(existingUser.getEmail())) {
                return true;
            }
        }
        return false;
    }
}
