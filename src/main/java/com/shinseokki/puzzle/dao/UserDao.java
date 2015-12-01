package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.User;

public interface UserDao {
	public User getUser(String u_id);
	public int addUser(User user);
	public int deleteUser(String u_id);
	public Collection<User> getUsers(int startIndex, int endIndex);
	public int getCount();
	
}
