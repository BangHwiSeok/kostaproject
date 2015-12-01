package com.shinseokki.puzzle.dto;

import org.springframework.security.core.authority.AuthorityUtils;

public class CurrentUser extends org.springframework.security.core.userdetails.User {
	
	private static final long serialVersionUID = 5994280176358381042L;
	private User user;

	public CurrentUser(User user) {
		super(user.getU_id(), user.getU_pwd(), AuthorityUtils.createAuthorityList(user.getU_role().toString()));
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public String getId() {
		return user.getU_id();
	}

	public Role getRole() {
		return user.getU_role();
	}
	// 회원 번호
	public int getUserNum() {
		return user.getU_num();
	}

	@Override
	public String toString() {
		return "CurrentUser{" + "user=" + user + "} " + super.toString();
	}

}
