package com.springbook.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class DeleteBoardController {

	@RequestMapping("/deleteBoard.do")
	public String deletBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println("글 삭제 처리");
		
		// 1. 사용자 입력 정보 추출
//		String seq = request.getParameter("seq");
//		BoardVO vo = new BoardVO();
//		vo.setSeq(Integer.parseInt(seq));
		
		// 2. DB 연동 처리
//		BoardDAO boardDAO = new BoardDAO();
//		boardDAO.deleteBoard(vo);
		
		// 3. 화면 네비게이션
//		return "getBoardList.do";
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("redirect:getBoardList.do");
//		return mav;
		boardDAO.deleteBoard(vo);
		return "redirect:getBoardList.do";
	}
	
}
