package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.Profile;

public interface ProfileDao {
	public int addProfile(Profile profile);
	public Collection<Profile> getProfile();
	public int updateProfile(Profile profile);
	public int deleteProfile(String u_id);
}
