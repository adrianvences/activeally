package com.adrian.activeally.services;


import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.adrian.activeally.models.LoginUser;
import com.adrian.activeally.models.User;
import com.adrian.activeally.repositories.UserRepository;





@Service
public class UserService {

    @Autowired UserRepository userRepository;

    public User register(User newUser, BindingResult result){
        Optional<User> user = userRepository.findByEmail(newUser.getEmail());
        if(user.isPresent()){
            result.rejectValue("email", "Email", "Already have that email");
        }
        // Check to see if password and confirm do NOT match
        if(!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("confirm", "Confirm", "passwords must match");
            
        }
        if(result.hasErrors()){
            return null;
        }

        //hash password
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        //set password
        newUser.setPassword(hashed);
        // save the user
        return userRepository.save(newUser);
    }

    public User login(LoginUser loginUser, BindingResult result){
        // Create potential user
        // Find user in the DB by email
        if(!this.checkEmail(loginUser.getEmail())){
            result.rejectValue("email", "noEmail", "Invalid Credentials");
        }
        if(result.hasErrors()){
            return null;
        }
        // Check to see if passwors match
        User user = userRepository.findByEmail(loginUser.getEmail()).orElse(null);
        if(!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())){
            result.rejectValue("password", "password", "Invalid Credentials");
        }
        if(result.hasErrors()){
            return null;
        }
        // User exists if you get to this line, so retrieve user from DB
        // Reject if BCrypt password match fails

        
        // Return null if result has errors
        // Otherwise, return the user object
        return user;
    }

    public boolean checkEmail(String email){
        Optional<User> user = userRepository.findByEmail(email);
        if(user.isPresent()){
            return true;
        } else {
            return false;
        }
    }

    public Object findById(Long id) {
        Optional<User> potentialUser = userRepository.findById(id);
        if(potentialUser.isPresent()) {
            return potentialUser.get();
        }
        return null;
    }
    
     //read one
    public User getOne(Long id){
      Optional<User> potentialUser= userRepository.findById(id);
      return potentialUser.orElse(null);
  }

}