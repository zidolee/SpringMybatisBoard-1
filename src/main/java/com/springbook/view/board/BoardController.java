package com.springbook.view.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.Criteria;
import com.springbook.biz.board.PageMaker;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;

//	XML방식으로 처리
//	@RequestMapping("/dataTransform.do")
//	@ResponseBody
//	public BoardListVO dataTransform(BoardVO vo) {
//		vo.setSearchCondition("TITLE");
//		vo.setSearchKeyword("");
//		List<BoardVO> boardList = boardService.getBoardList(vo);
//		BoardListVO boardListVO = new BoardListVO();
//		boardListVO.setBoardList(boardList);
//		return boardListVO;
//	}
	
//	JSON 방법으로 처리
	@RequestMapping("/dataTransform.do")
	@ResponseBody
	public List<BoardVO> dataTransform(BoardVO vo) {
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardService.getBoardList(vo);
		return boardList;
	}

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchCondtionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "WRITER");
		return conditionMap;
	}
	
	@RequestMapping(value="/insertBoard.do")	//value=생략 가능
	public String insertBoard(BoardVO vo) throws IOException {
		System.out.println("글 등록 처리");
		
		//파일 업로드
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/temp/" + fileName));
		}
//		 for (int i = 1; i <= 1000; i++) {
//		     
//		        vo.setTitle(i+ "번째 글 제목입니다...");
//		        vo.setContent(i+ "번재 글 내용입니다...");
//		        vo.setWriter("user0"+(i%10));
//
//		        boardService.insertBoard(vo);
//		    }
		boardService.insertBoard(vo);
		return "redirect:getBoardList.do";
		
	}
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public String modifyForm(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "/article/modify";
	}
	@RequestMapping("/modify.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println("번호 : " + vo.getSeq());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("작성자 : " + vo.getWriter());
		System.out.println("내용 : " + vo.getContent());
		System.out.println("등록일 : " + vo.getRegDate());
		System.out.println("조회수 : " + vo.getCnt());
		
		boardService.updateBoard(vo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/insertBoardForm.do")
	public String insertBoardForm() {

		return "/article/insertBoard";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deletBoard(BoardVO vo) {
		System.out.println("글 삭제 처리");
		
		boardService.deleteBoard(vo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		model.addAttribute("board", boardService.getBoard(vo));
		return "article/getBoard";
	}
	
//	원본
//	@RequestMapping("/getBoardList.do")
//	public String getBoardList(BoardVO vo, Model model, HttpSession session) {
//		System.out.println("글 목록 검색 처리");
//		System.out.println(session.getAttribute("userName"));
//		String auth  = (String)session.getAttribute("userName");
//		
//		// Null Check
//		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
//		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
//		if(auth == null && auth.equals("")) {
//			return "redirect:login.do";
//		} else {
//			model.addAttribute("boardList", boardService.getBoardList(vo));
//			return "getBoardList.jsp";
//		}
//		
//	}
	
	
	@RequestMapping(value="/getBoardList.do", method = RequestMethod.GET)
	public String getBoardList(BoardVO vo, Model model, HttpSession session, Criteria criteria) throws Exception {
		System.out.println("글 목록 검색 처리");
		System.out.println(session.getAttribute("userName"));
		String auth  = (String)session.getAttribute("userName");
		
		// Null Check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		if(auth == null && auth.equals("")) {
			return "redirect:login.do";
		} else {
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCriteria(criteria);
		    pageMaker.setTotalCount(boardService.countArticles(criteria));
		    
			model.addAttribute("boardList", boardService.listCriteria(criteria));
			model.addAttribute("pageMaker", pageMaker);
			return "/article/getBoardList";
		}
		
	}
}
