package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
//조인포인트
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
//	private BoardDAO boardDAO;
//	private BoardDAOSpring boardDAO;
//	private BoardDAOSpring2 boardDAO;
//	private BoardDAOMybatis boardDAO;
	private BoardDAOMybatis2 boardDAO;
	
	@Override//포인트컷 대상(메서드)
	public void insertBoard(BoardVO vo) {
//		after-throwing test
//		if(vo.getSeq() == 0) {
//			throw new IllegalArgumentException("0번 글은 등록 할 수 없습니다.");
//		}
//		if(vo.getWriter().equals("홍길동")) {
//			throw new IllegalArgumentException("중복 에라");
//		}
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

	
}
