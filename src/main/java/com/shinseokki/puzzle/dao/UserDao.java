package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.User;

public interface UserDao {
	public User getUser(int u_num);
	public User findByID(String u_id);
	public int addUser(User user);
	public int deleteUser(int u_num);
	public Collection<User> getUsers(int startIndex, int endIndex);
	public Collection<User> getUnApprovalUsers(int startIndex, int endIndex);
	public int getCount();
	public int approvalUser(int u_num);
	public int countByActiveType();
	public int changePWD(int u_num, String pwd);
	public int subtractPoint(int u_num, int point);
	public int addPoint(int u_num, int point);
	
}
