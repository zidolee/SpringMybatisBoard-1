package com.springbook.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class JoinController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String jogin(UserVO vo) {
		System.out.println("회원가입"); 
		int join = 0;
		join = userService.insertUserVO(vo);
		if(join == 1) {
			return "redirect:login.do";
		} else {
			return "join.jsp";
		}
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String loginView(UserVO vo) {
		return "join.jsp";
	}
	
	@RequestMapping("/getUser.do")
	public String getUser(UserVO vo, Model model, HttpSession session) {
		System.out.println("개인정보 조회");
		String auth = (String)session.getAttribute("userName");
		
		if(auth == null && auth.equals("")) {
			return "redirect:login.do";
		} else {
			model.addAttribute("user", userService.getUserVO(vo));
			return "joinInfo.jsp";
		}
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("user") UserVO vo) {
		System.out.println("개인정보 수정");
		userService.updateUser(vo);
		return "getUser.do";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deletUser(UserVO vo) {
		System.out.println("회원 탈퇴 처리");
		userService.deleteUser(vo);
		return "redirect:login.do";
	}
	
}
