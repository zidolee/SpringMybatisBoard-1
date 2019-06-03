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
	public void deleteBoard(int seq) {
		System.out.println("===> Mybatis2 JDBC로 deleteBoard() 기능 처리");
		mybatis.delete("BoardDAO.deleteBoard", seq);
	}
	
	// 글 상세 조회
	public BoardVO getBoard(int seq) {
		System.out.println("===> Mybatis2 JDBC로 getBoard() 기능 처리");
		mybatis.update("BoardDAO.updateHitCnt", seq);
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", seq);
	}
	
	// 게시판 리스트 조
	public List<BoardVO> listCriteria(Criteria criteria) throws Exception {
		System.out.println("===> Mybatis2 JDBC 페이징 기능 처리");
	    return mybatis.selectList("BoardDAO.listCriteria", criteria);
	}
	
	// 게시판 글 총 수
	public int countArticles(Criteria criteria) throws Exception {
	    return mybatis.selectOne("BoardDAO.countArticles", criteria);
	}
	// 업로드 한 파일 이름 조회 
	public BoardVO selectSaveFileName(BoardVO vo) throws Exception {
	    return mybatis.selectOne("BoardDAO.getSaveFileName", vo);
	}

}

