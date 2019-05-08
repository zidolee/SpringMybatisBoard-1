package com.springbook.biz.user;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class UserServiceClient {
	public static void main(String[] args) {
		// 1. Spring  컨테이너  구동
//		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext2.xml");
		
		// 2. Spring 컨테이너로부터 UserServiceImpl 객체를 Lookup
		UserService userService = (UserService) container.getBean("userService");
		
		// 3. 사용자 등록
		UserVO userVo = new UserVO();
		
		userVo.setId("test3");
		userVo.setPassword("123");
		userVo.setName("소농민");
		userVo.setRole("admin");
		
//		userService.insetUserVO(userVo);
		// 4. 사용자 검색(로그인 처리)
		UserVO user = userService.getUserVO(userVo);
		if(user != null) {
			System.out.println(user.getRole() + ": " +  user.getName() + "님 확영합니다.");
		} else {
			System.out.println("로그인 실패");
		}
		
		// 5. Spring 컨테이너 종료
		container.close();
	}
}
