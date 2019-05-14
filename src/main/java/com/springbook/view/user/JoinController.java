package com.springbook.view.user;

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
	UserService userService;
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String jogin(UserVO vo, UserDAO userDAO) {
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
	public String loginView(@ModelAttribute("user") UserVO vo) {
		return "join.jsp";
	}
	
	@RequestMapping("/getUser.do")
	public String getUser(UserVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		
		model.addAttribute("board", userService.getUserVO(vo));
		return "getBoard.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(@ModelAttribute("board") UserVO vo) {	
		userService.updateUser(vo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deletUser(UserVO vo) {
		System.out.println("글 삭제 처리");
		
		userService.deleteBoard(vo);
		return "redirect:getBoardList.do";
	}
	
	
	
}
