package com.shinseokki.puzzle.service;

import java.util.Collection;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.ProfileDao;
import com.shinseokki.puzzle.dto.Profile;

@Service
public class ProfileService {
	
	private ProfileDao profileDao;
	
	public ProfileService(SqlSession sqlSession) {
		profileDao = sqlSession.getMapper(ProfileDao.class);
	}
	
	public int addProfile(Profile profile) {
		return profileDao.addProfile(profile);
	}

	public Collection<Profile> getProfile() {
		return profileDao.getProfile();
	}

	public int updateProfile(Profile profile) {
		return profileDao.updateProfile(profile);
	}

	public int deleteProfile(String u_id) {
		return profileDao.deleteProfile(u_id);
	}

}
