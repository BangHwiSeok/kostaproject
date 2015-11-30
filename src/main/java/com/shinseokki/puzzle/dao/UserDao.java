package com.shinseokki.puzzle.dao;

import java.util.Optional;

import com.shinseokki.puzzle.dto.User;

public interface UserDao {
	public Optional<User> getUser(String u_id);
	public int addUser(User user);
}
