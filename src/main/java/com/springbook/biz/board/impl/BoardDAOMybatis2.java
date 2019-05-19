package com.springbook.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.Criteria;

@Repository
public class BoardDAOMybatis2 {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	//crud 기능의 메소드 구현
	//글 등록
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis2 JDBC로 insertBoard() 기능 처리");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	// 글 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis2 JDBC로 updateBoard() 기능 처리");
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis2 JDBC로 deleteBoard() 기능 처리");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	// 글 상세 조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis2 JDBC로 getBoard() 기능 처리");
		mybatis.update("BoardDAO.updateHitCnt", vo);
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}
		
	//글 목록조회
//	public List<BoardVO> getBoardList(BoardVO vo) {
//		System.out.println("===> Mybatis2 JDBC로 getBoardList() 기능 처리");
//		if(vo.getSearchCondition().equals("TITLE")) {
//			return mybatis.selectList("BoardDAO.getBoardList_T", vo);
//		} else if(vo.getSearchCondition().equals("CONTENT")) {
//			return mybatis.selectList("BoardDAO.getBoardList_C", vo);
//		} else if(vo.getSearchCondition().equals("WRITER")) {
//			return mybatis.selectList("BoardDAO.getBoardList_W", vo);
//		}
//		return null;
//	}
	
	// Dynamic SQL 사용 할때
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> Mybatis2 JDBC로 getBoardList() 기능 처리");
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
	
	public List<BoardVO> listPaging(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return mybatis.selectList("BoardDAO.listPaging", page);
	}
	
	public List<BoardVO> listCriteria(Criteria criteria) throws Exception {
		System.out.println("===> Mybatis2 JDBC 페이징 기능 처리");
	    return mybatis.selectList("BoardDAO.listCriteria", criteria);
	}
	

	public int countArticles(Criteria criteria) throws Exception {
	    return mybatis.selectOne("BoardDAO.countArticles", criteria);
	}

}

