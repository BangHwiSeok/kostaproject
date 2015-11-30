package com.shinseokki.puzzle.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.shinseokki.puzzle.dto.UserCreateForm;
import com.shinseokki.puzzle.service.UserService;

public class UserValidator implements Validator{
	private UserService userService;
	
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
		UserCreateForm form = (UserCreateForm) target;
		
		// 유저 ID 유효성 검사
		validateID(form,errors);
		// 유저 비밀번호 유효성 검사
		validatePassword(form,errors);
		// 유저의 사진 유효성 검사
		
	}
	
	private void validateID(UserCreateForm form, Errors errors){
		if(userService.getUser(form.getU_id()).isPresent()){
			errors.reject("u_id.exist", "error!!! exists '"+form.getU_id()+"'");
		}
	}
	
	private void validatePassword(UserCreateForm form,Errors errors){
		if(!form.getU_pwd().equals(form.getU_rePwd())){
			errors.reject("password.no_match","Passsword No Matcherd");
		}
	}

}
