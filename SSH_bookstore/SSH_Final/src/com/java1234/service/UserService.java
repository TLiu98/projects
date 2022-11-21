package com.java1234.service;

import java.util.List;

import com.java1234.entity.User;

public interface UserService {

	public void saveUser(User user);
	
	public void updateUser(User user);
	
	public User findUserById(int id);
	
	public User findUserByName(User user);
	
	public User findUserByPhone(User user);
	
	public void deleteUser(User user);
	
	public List<User> findAllList();
	
	public User findUserBy2(User user);
}
