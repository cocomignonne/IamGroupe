package com.kh.iag.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.kh.iag.login.service.LoginService;
import com.kh.iag.user.entity.UserDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private LoginService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션에 로그인정보가 담겨있는지 확인
		HttpSession session = request.getSession();
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			Cookie loginedCookie = WebUtils.getCookie(request, "savedLoginCookie");
			if (loginedCookie != null) {
				String sessionKey = loginedCookie.getValue();
				UserDto userDto = service.checkUserBySsKey(sessionKey);	
				if (userDto != null) {
					session.setAttribute("loginUser", userDto);
					return true;
				}
			} 
			request.setAttribute("msg", "로그인을 먼저 해주세요");
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			return false;
		}
		// 로그인된 유저
		return true;
	}
}