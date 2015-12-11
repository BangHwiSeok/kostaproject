package com.shinseokki.puzzle.service;

import java.util.Collection;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.ProfileDao;
import com.shinseokki.puzzle.dto.Profile;

@Service
public class ProfileService {
	
	private ProfileDao profileDao;
	
	@Autowired
	public ProfileService(SqlSession sqlSession) {
		profileDao = sqlSession.getMapper(ProfileDao.class);
	}
	
	public int addProfile(Profile profile) {
		return profileDao.addProfile(profile);
	}

	public Collection<Profile> find(int u_num) {
		return profileDao.find(u_num);
	}

	public int updateProfile(Profile profile) {
		return profileDao.updateProfile(profile);
	}

	public int deleteProfile(int u_num) {
		return profileDao.deleteProfile(u_num);
	}

}
