package com.uni.ljss.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;


//https://docs.spring.io/spring-framework/docs/5.2.9.RELEASE/spring-framework-reference/core.html#aop-at-aspectj

@Aspect
@Component
public class AspectTest {
	//* 임의의 문자열 1개를 의미
	//.. 임의의 문자열 0개이상을 의미
	//*(..) 모든 메서드의미 
	
	@Pointcut("execution(* com.uni.ljss..*ServiceImpl.*(..))" )
	public void pointCut() {}
	
	
	@Before("pointCut()")// 메소드가 실행되기 전에 공통으로 처리할 작업을 위해 사용
	public void before(JoinPoint join) {
		
		Signature sig = join.getSignature();//AOP 가 적용되는 메소드의 정보반환
		
		Object[] params = join.getArgs();// 파라미터값 확인
		for(Object obj : params) {
			System.out.println("obj : "+ obj);
		}
		
		
		System.out.println("메소드 호출전 확인 : " + sig.getDeclaringTypeName() + " : "+ sig.getName());
	
		//sig.getDeclaringTypeName() : 메소드가있는 클래스의 풀네임 
	    //sig.getName() : 타겟 객체의 메소드명 
	}
	
	
	@After("pointCut()")// 예외 발생여부에 상관없이 비지니스 로직후 무조건 수행하는 기능을 작성하는 advice
	public void after(JoinPoint join) {
		
		Signature sig = join.getSignature();//AOP 가 적용되는 메소드의 정보반환
		
		System.out.println("메소드 호출후 확인 : " + sig.getDeclaringTypeName() + " : "+ sig.getName());
	
		//sig.getDeclaringTypeName() : 메소드가있는 클래스의 풀네임 
	    //sig.getName() : 타겟 객체의 메소드명 
	}
	
	@AfterReturning(pointcut="pointCut()", returning="returnObj")// 정상적으로 비지니스 메소드가 리턴한 결과 데이터를 다른 용도로 처리할때.
	public void returningPoint(JoinPoint join, Object returnObj) {
		
		Signature sig = join.getSignature();//AOP 가 적용되는 메소드의 정보반환
		
		System.out.println("메소드 호출후 @AfterReturning확인 : " + sig.getDeclaringTypeName() + " : "+ sig.getName() + " returnObj :  "+ returnObj);
	}
	
	@AfterThrowing(pointcut="pointCut()", throwing="exceptionObj" ) //예외발생시 수행
	public void throwingPoint(JoinPoint join, Exception exceptionObj) {
		Signature sig = join.getSignature();//AOP 가 적용되는 메소드의 정보반환
		
		System.out.println("메소드 호출후 @AfterThrowing확인 : " + sig.getDeclaringTypeName() + " : "+ sig.getName() );

		if(exceptionObj instanceof IllegalArgumentException) {
			System.out.println("부적합한 값이 입력되었습니다. ");
		}else {
			System.out.println("예외 발생 메세지: "+ exceptionObj.getMessage());
			System.out.println("예외발생 종류: "+ exceptionObj.getClass().getName());
		}
	}
	
	@Around("pointCut()")
	public Object aroundLog(ProceedingJoinPoint join) throws Throwable {
		
		String methodName = join.getSignature().getName();
		
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		
		Object obj = join.proceed();// 전과 후를 나누는 기준 
		
		stopwatch.stop();
		
		System.out.println(methodName + " 소요시간(ms) : "+ stopwatch.getTotalTimeMillis() + "초 ");
		
		
		return obj;
	}
	
}
