package com.shinseokki.puzzle.handler;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.SavedRequest;

public class RoleBaseAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(RoleBaseAuthenticationSuccessHandler.class);
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		handle(req, resp, auth);

		clearAuthenticationAttributes(req);

	}

	protected void handle(HttpServletRequest req, HttpServletResponse resp, Authentication auth) throws IOException {
		String targetUrl = determineTargetUrl(auth, req);

		if (resp.isCommitted()) {
			logger.debug("Response has already been committed. Unable to redirect to " + targetUrl);
			return;
		}
		// redirect
		
		System.out.println(req.getHeader("REFFER"));
		
		redirectStrategy.sendRedirect(req, resp, targetUrl);
	}

	protected String determineTargetUrl(Authentication authentication, HttpServletRequest req) {
		String targetUrl = "";
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {
			System.out.println(req.getRequestURI());
			if (grantedAuthority.getAuthority().equals("ROLE_WAITING")) {
				targetUrl = "/";
			} else if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
				targetUrl = "/matches";
			} else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
				targetUrl = "/console";
			}

		}

		return targetUrl;
	}

	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	protected RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

}
