package com.shinseokki.puzzle.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.shinseokki.puzzle.dao.EvaluationDao;
import com.shinseokki.puzzle.dao.MyKeywordDao;
import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.Profile;
import com.shinseokki.puzzle.dto.Role;
import com.shinseokki.puzzle.dto.User;
import com.shinseokki.puzzle.dto.UserCreateForm;
import com.shinseokki.puzzle.dto.UserInfo;

@Service
public class UserService {
	private final static Logger logger = LoggerFactory.getLogger(UserService.class);
	private final static int MAXPAGE = 10;
	private UserDao userDao;
	private ProfileService profileService;
	protected JavaMailSender mailSender;
	private EvaluationDao evaluationDao;
	
	private MyKeywordDao myKeywordDao;

	@Autowired
	public UserService(SqlSession sqlSession, ProfileService profileService) {
		logger.info("Constructed");
		userDao = sqlSession.getMapper(UserDao.class);
		evaluationDao = sqlSession.getMapper(EvaluationDao.class);
		this.profileService = profileService;
		myKeywordDao = sqlSession.getMapper(MyKeywordDao.class);

	}

	public Optional<User> findByID(String u_id) {
		logger.info("findByID");
		return Optional.ofNullable(userDao.findByID(u_id));
	}

	public Optional<User> findByUserNum(int u_num) {
		logger.info("findByUserNum");
		return Optional.ofNullable(userDao.findByUserNum(u_num));
	}

	public int getTotalPage() {
		return (int) Math.ceil(userDao.getCount() / ((float) MAXPAGE));
	}

	// 비밀번호 변경 및 암호화
	public int changePwd(int u_num, String pwd) {
		String password = new BCryptPasswordEncoder().encode(pwd);

		return userDao.changePWD(u_num, password);
	}

	@Transactional
	public int deleteUser(int u_num, String path) {
		removeDIR(path + File.separatorChar + u_num);

		profileService.deleteProfile(u_num);

		return userDao.deleteUser(u_num);
	}

	// User의 사진을 모두 지운다.
	public void removeDIR(String path) {
		File[] listFile = new File(path).listFiles();
		try {
			if (listFile.length > 0) {
				for (int i = 0; i < listFile.length; i++) {
					if (listFile[i].isFile()) {
						listFile[i].delete();
					} else {
						removeDIR(listFile[i].getPath());
					}
					listFile[i].delete();
				}
			}
		} catch (Exception e) {
			System.err.println(System.err);
		}

	}

	/*
	 * @param u_num 막 회원 가입한 사용자의 회원번호
	 * @return int	DB에 저장한 결과를 반환한다.
	 * @description
	 * 	관리자가 승인하고, 다른 사용자들이 키워드를 줄 수 있게 해주는 단계를 정의
	 * 	키워드를 받기 위해 EvalueTable에 이동시킨다.
	 */
	public int approvalUser(int u_num){
		User user = userDao.findByUserNum(u_num);
		user.setU_role(user.getU_role().nextRole());
		
		evaluationDao.addEvaluation(user.getU_num());
		
		return userDao.approvalUser(user);
	}

	public Collection<User> getUnApprovalUsers(int pageNo) {
		return userDao.getUnApprovalUsers((pageNo - 1) * MAXPAGE + 1, (pageNo - 1) * MAXPAGE + MAXPAGE);
	}

	public int countByUnActiveType() {
		return userDao.countByActiveType();
	}

	// ACTIVE Type에 따라 유저 정보를 확인한다.
	public int countByActiveType() {
		return userDao.countByActiveType();
	}

	public Collection<User> getUsers(int pageNo) {
		return userDao.getUsers((pageNo - 1) * MAXPAGE + 1, (pageNo - 1) * MAXPAGE + MAXPAGE);
	}

	@Transactional
	public boolean addUser(UserCreateForm form, String path) {
		logger.info("addUser");
		User user = new User();

		user.setU_id(form.getU_id());

		// Password 암호화
		user.setU_pwd(new BCryptPasswordEncoder().encode(form.getU_pwd()));
		user.setU_birth(form.getU_birth());
		user.setU_gender(form.getU_gender());
		user.setU_role(Role.ROLE_READY);
		user.setU_pnum(form.getU_pnum());
		userDao.addUser(user);

		boolean isSave = false;

		// 저장된 User의 회원번호를 받기 위해 저장된 정보 받기
		user = userDao.findByID(user.getU_id());

		// IMAGE 저장
		// IMAGE는 회원의 회원번호를 폴더이름으로 하고 IMAGE는 image+숫자로 저장된다.
		try {
			isSave = saveProfileImage(form, path, user.getU_num());
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (!isSave) {
			userDao.deleteUser(user.getU_num());
		}

		return isSave;
	}

	private boolean saveProfileImage(UserCreateForm form, String path, int u_num)
			throws IllegalStateException, IOException {
		int i = 0;
		Profile profile = new Profile();
		String filepath = path + File.separatorChar + u_num;
		File directory = new File(filepath);
		if (!directory.exists()) {
			directory.mkdirs();
		}
		for (MultipartFile file : form.getPhotoes()) {
			if (file.getOriginalFilename() == "") {
				System.out.println("NULL " + i);
			} else {
				i++;
				System.out.println(file.getOriginalFilename());
			}
		}
		if (i < 2) {
			return false;
		} else {

			int j = 0;
			profile.setU_num(u_num);

			for (List<MultipartFile> files = form.getPhotoes(); j < i; j++) {
				MultipartFile file = files.get(j);
				String extendType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

				file.transferTo(new File(filepath + File.separatorChar + u_num + j + extendType));
				System.out.println("FILE TYPE : " + extendType);
				profile.setP_extendtype(extendType);
				profile.setP_photonum(j);
				profileService.addProfile(profile);
			}
		}

		return true;
	}
	/*
	 * @param in u_num 찾을 User Num
	 * @description
	 * 	u_num를 가진 회원의 정보 ( 사진, keyword)를 가져오기 위한 것
	 */
	
	public UserInfo getUserInfo(int u_num){
		UserInfo info = new UserInfo();
		info.setUser(userDao.findByUserNum(u_num));
		info.setProfiles(profileService.find(u_num));
		info.setMyKeywords(myKeywordDao.findMyKeywords(u_num));
		
		return info;
	}
	
	@Transactional
	public int updateRoleMyKeyword(User user, String[] keyword){
		Arrays.asList(keyword).forEach((s) -> {
			myKeywordDao.deleteMyKeyword(user.getU_num(), s);
		});
		user.setU_role(user.getU_role().nextRole());
		
		userDao.changeRole(user);
		
		return 0;
	}
}
