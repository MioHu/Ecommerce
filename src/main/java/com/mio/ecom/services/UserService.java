package com.mio.ecom.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.mio.ecom.models.LoginUser;
import com.mio.ecom.models.User;
import com.mio.ecom.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		// reject if email is taken
		Optional<User> userOptional = userRepository.findByEmail(newUser.getEmail());
		if(userOptional.isPresent()) {
			result.rejectValue("email", "Unique", "The email is already registered.");
		}
		// reject if password doesn't match confirmation
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Match", "The password and confirm password don't match.");
		}
		// return null if result has errors
		if(result.hasErrors()) {
			return null;
		}
		// hash and set password, save user to db
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepository.save(newUser);
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		// find user by email
		Optional<User> userOptional = userRepository.findByEmail(newLogin.getEmail());
		// reject if not present
		if(!userOptional.isPresent()) {
			result.rejectValue("email", "Existence", "The email is not registered.");
			return null;
		}
		// reject if password doesn't match
		User user = userOptional.get();
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Match", "Invalid password.");
		}
		// return null if result has errors
		if(result.hasErrors()) {
			return null;
		}
		// otherwise, return the user object
		return user;
	}
	
	public User findUser(Long id) {
		Optional<User> userOptional = userRepository.findById(id);
		if(userOptional.isPresent()) {
			return userOptional.get();
		} else {
			return null;
		}
	}
}
