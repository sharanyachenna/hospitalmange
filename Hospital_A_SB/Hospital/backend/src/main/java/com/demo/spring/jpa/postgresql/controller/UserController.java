package com.demo.spring.jpa.postgresql.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.spring.jpa.postgresql.model.User;
import com.demo.spring.jpa.postgresql.repository.UserRepository;

@CrossOrigin
@RestController
@RequestMapping("/")
public class UserController {

	@Autowired
	UserRepository userRepository;

	@PostMapping("/user")
	public ResponseEntity<User> createuser(@RequestBody User user) {
		try {
			User _user = userRepository
					.save(new User(user.getName(), user.getMobile(), user.getEmail(), user.getDob()));
			return new ResponseEntity<>(_user, HttpStatus.CREATED);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
