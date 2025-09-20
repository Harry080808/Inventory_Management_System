package com.example.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Model.User;
import com.example.Repository.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo userrep;

	public void saveUser(User u) {
		userrep.save(u);
	}

	public User findUserByEmail(String email) {
		return userrep.findByemail(email);
	}
}
