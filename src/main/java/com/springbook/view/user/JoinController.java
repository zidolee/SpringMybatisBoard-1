package com.springbook.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

public class JoinController {
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public void jogin(UserVO vo, UserDAO userDAO, HttpSession session) {
		System.out.println("회원가입"); 
		int login = 0;
		userDAO.insertUser(vo);
	}
}
