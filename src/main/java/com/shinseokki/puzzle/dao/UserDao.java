package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.User;

public interface UserDao {
	public User findByUserNum(int u_num);
	public User findByID(String u_id);
	public int addUser(User user);
	public int deleteUser(int u_num);
	public Collection<User> getUsers(int startIndex, int endIndex);
	public Collection<User> getUnApprovalUsers(int startIndex, int endIndex);
	public int getCount();
	public int approvalUser(User user);
	public int countByActiveType();
	public int changePWD(int u_num, String pwd);
	public int subtractPoint(int u_num, int point);
	public int addPoint(int u_num, int point);
	public User findIdByPhone(String u_pnum); //핸드폰번호로 아이디 찾기
	public User findPwdByIdPhone(String u_id, String u_pnum); //비밀번호찾기
	public int changeRole(User user);
	
}
