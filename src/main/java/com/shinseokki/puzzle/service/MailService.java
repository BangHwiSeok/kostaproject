package com.shinseokki.puzzle.service;


import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.User;

	@Service
	public class MailService {
	private JavaMailSender mailSender;
	private final static Logger logger = LoggerFactory.getLogger(UserService.class);
	private UserDao userDao;
	
	@Autowired
	public MailService(SqlSession sqlSession,JavaMailSender mailSender) {
		logger.info("Constructed");
		userDao = sqlSession.getMapper(UserDao.class);
		this.mailSender = mailSender;
		
	}
	
	//핸드폰 번호로 ID찾기
	public String findIdByPhone(String u_pnum) {

	if (u_pnum != null && !u_pnum.equals("")) {

		User user = userDao.findIdByPhone(u_pnum);

		if (user != null) {

			logger.info("[findId] - U_id:[" + user.getU_id() + "] / 아이디 찾기");

			return user.getU_id();
		}

	}
	return "";

}

	//ID랑 핸드폰 번호로 비밀번호찾기
public String findPwdByIdPhone(String u_id, String u_pnum) {

	if (u_id != null && !u_id.equals("") && u_pnum != null && !u_pnum.equals("")) {

		User user = userDao.findPwdByIdPhone(u_id, u_pnum);

		if (user != null) {

			logger.info("[findId] - U_pwd:[" + user.getU_pwd() + "] / 비밀번호 찾기");

			changePwd(user.getU_num(), "1234");
			try {
				sendMail(user.getU_id(), "1234");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "OK";
		}
	}
	

	return "NO";

}




//패스워드 초기화 및 변경 (암호화)
public int changePwd(int u_num, String pwd) {
		String password = new BCryptPasswordEncoder().encode(pwd);

		return userDao.changePWD(u_num, password);
	}
	

//메일 보내기
public boolean sendMail(String id, String pwd) throws Exception {
	try {
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setFrom(); // 송신자를 설정해도 소용없지만 없으면 오류가 발생한다
		msg.setSubject("제목입니다");
		msg.setText("비밀번호는 " + pwd + " 입니다");
		msg.setRecipient(RecipientType.TO, new InternetAddress(id));

		mailSender.send(msg);
		return true;
	} catch (Exception ex) {
		ex.printStackTrace();
	}
	return false;
  }

}


