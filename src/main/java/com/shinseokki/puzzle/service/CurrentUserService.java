package com.shinseokki.puzzle.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.dto.User;

@Service
public class CurrentUserService implements UserDetailsService{
	private final static Logger logger = LoggerFactory.getLogger(CurrentUserService.class);
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		logger.info("User 확인 {}",userService);
		User user =userService.findByID(id)
							.orElseThrow( () -> new UsernameNotFoundException( String.format("Not Found %s",id) ) );
		logger.info("User : {}",user.toString());
		/*user.setU_id(id);
		user.setU_pwd(new BCryptPasswordEncoder().encode("test"));
		user.setU_role(Role.ROLE_USER);*/
		
		return new CurrentUser(user);
	}

}
