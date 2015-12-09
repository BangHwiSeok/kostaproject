package com.shinseokki.puzzle.dto;

/*
 * ROLE_READY : 관리자의 승인 대기상태
 * ROLE_WATING: 사용자들의 평가받고 있는 상태
 * ROLE_USER : 사용자들에게 평가를 받고 나서, 사이트를 본격적으로 사용할 수 있는 상태
 * ROLE_ADMIN : 사이트 관리자 
 */
public enum Role {
	ROLE_READY,ROLE_WAITING,ROLE_USER,ROLE_ADMIN;
	
	// next level을 알려 줌
	public Role nextRole(){
		// Role.values().length()-1 은 ADMIN이므로  -2를 해줌으로 써 최종 Role을 User로 해줌
		return this.ordinal() < Role.values().length-2 ? Role.values()[this.ordinal()+1]: this;
				
	}
}
