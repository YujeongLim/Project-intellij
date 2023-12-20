package com.uni.ljss.common.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ch.qos.logback.classic.Logger;
import org.slf4j.LoggerFactory;

public class TestInterceptor implements HandlerInterceptor {
	private static final Logger logger = (Logger) LoggerFactory.getLogger(TestInterceptor.class);


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.debug("==================preHandle start ====================");
		logger.debug(request.getRequestURI());
		return true; // 계속 진행하려면 true를 반환해야 합니다.
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.debug("==================postHandle start ====================");
		postHandle(request, response, handler, modelAndView);
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		logger.debug("==================afterCompletion start ====================");
		afterCompletion(request, response, handler, ex);
	}
}
