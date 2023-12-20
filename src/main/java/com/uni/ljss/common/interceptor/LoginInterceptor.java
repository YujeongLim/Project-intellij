package com.uni.ljss.common.interceptor;

import java.net.InetAddress;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.HandlerInterceptor;
import com.uni.ljss.member.model.dto.Member;
import ch.qos.logback.classic.Logger;

public class LoginInterceptor implements HandlerInterceptor {
	private static final Logger logger = (Logger) LoggerFactory.getLogger(LoginInterceptor.class);


	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginMember");

		if (loginUser != null) {
			InetAddress local = InetAddress.getLocalHost();
			logger.info(loginUser.getMemId() + "  " + local.getHostAddress());
		}
	}
}
