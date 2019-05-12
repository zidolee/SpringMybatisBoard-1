package com.springbook.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class JoinController {
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String jogin(UserVO vo, UserDAO userDAO) {
		System.out.println("회원가입"); 
		int join = 0;
		join = userDAO.insertUser(vo);
		if(join == 1) {
			return "redirect:login.do";
		} else {
			return "join.jsp";
		}
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String loginView(@ModelAttribute("user") UserVO vo) {
		return "join.jsp";
	}
}
