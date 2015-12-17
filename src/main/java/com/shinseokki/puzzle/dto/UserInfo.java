package com.shinseokki.puzzle.dto;

import java.util.Collection;

public class UserInfo{
	private static final long serialVersionUID = 1571689923046264418L;
	
	private User user;
	private Collection<Profile> profiles;
	private Collection<MyKeyword> myKeywords;
	
	public Collection<MyKeyword> getMyKeywords() {
		return myKeywords;
	}

	public void setMyKeywords(Collection<MyKeyword> myKeywords) {
		this.myKeywords = myKeywords;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Collection<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(Collection<Profile> profiles) {
		this.profiles = profiles;
	}
	
}
