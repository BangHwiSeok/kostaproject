package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.Profile;

public interface ProfileDao {
	public int addProfile(Profile profile);
	public Collection<Profile> find(int u_num);
	public int updateProfile(Profile profile);
	public int deleteProfile(int u_num);
}
