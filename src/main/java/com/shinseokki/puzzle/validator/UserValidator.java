package com.shinseokki.puzzle.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.shinseokki.puzzle.dto.User;
import com.shinseokki.puzzle.dto.UserCreateForm;
import com.shinseokki.puzzle.service.UserService;

public class UserValidator implements Validator{
	private final static Logger logger = LoggerFactory.getLogger(UserValidator.class);
	private UserService userService;
	
	@Autowired
	public UserValidator(UserService userService) {
		this.userService = userService;
	}
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return  clazz.equals(UserCreateForm.class);
	}

	/*
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 * @param Object target 입력된 폼이 정확한지 확인하고자 하는 대상
	 * @param Errors errors error가 있을 경우 담아서 보낸다.
	 */
	@Override
	public void validate(Object target, Errors errors) {
		logger.info("User Validate ID");
		UserCreateForm form = (UserCreateForm) target;
		
		ValidationUtils.rejectIfEmpty(errors, "u_id", "u_id.empty","input email");
		ValidationUtils.rejectIfEmpty(errors, "u_pwd", "u_pwd.empty","input PWD");
		ValidationUtils.rejectIfEmpty(errors, "u_repwd", "u_repwd.empty","input RePWD");
		ValidationUtils.rejectIfEmpty(errors, "u_pnum", "u_pnum.empty","input phone num");
		ValidationUtils.rejectIfEmpty(errors, "u_birth", "u_birth.empty","input birthday");
		
		
		
		// 유저 ID 유효성 검사
		validateID(form,errors);
		// 유저 비밀번호 유효성 검사
		validatePassword(form,errors);
		// 유저의 사진 유효성 검사
		
	}
	
	private void validateID(UserCreateForm form, Errors errors){
		if(userService.findByID(form.getU_id()).isPresent()){
			errors.rejectValue("u_id","u_id.exist","error!!! exists '"+form.getU_id()+"'");
		}
	}
	
	private void validatePassword(UserCreateForm form,Errors errors){
		logger.info("PASSWORD VALIDATE");
		if(!form.getU_pwd().equals(form.getU_repwd())){
			errors.rejectValue("u_pwd","u_pwd.not_matched","Passsword No Matcherd");
			for(ObjectError error : errors.getAllErrors()){
				logger.info("Error log {} ", error.toString());
			}
		}
	}

}
