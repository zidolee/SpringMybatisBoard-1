package com.springbook.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class LogoutController {

	@RequestMapping("/logout.do")
	public String handleRequest(HttpSession session) {
		System.out.println("로그아웃 처리");
//		// 1. 브라우저와 연결된 세션 객체를 강제 종료
//		HttpSession session = request.getSession();
//		session.invalidate();
//		
//		// 2. 세션 종료후 , 메인 화면으로 이동
////		return "login";
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("redirect:login.jsp");
//		return mav;
		session.invalidate();
		return "redirect:login.do";
	}

}
