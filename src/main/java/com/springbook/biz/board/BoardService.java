package com.springbook.biz.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {

	//글 등록
	void insertBoard(BoardVO vo);

	//글 수정
	void updateBoard(BoardVO vo);

	//글 삭제
	void deleteBoard(int seq);

	//글 상세 조회
	BoardVO getBoard(int seq);
	
	//글 목록 조회 
	List<BoardVO> getBoardList(BoardVO vo);

	List<BoardVO> listCriteria(Criteria criteria) throws Exception;
	
	int countArticles(Criteria criteria) throws Exception;
	
	String fileUpload(BoardVO vo, HttpServletRequest request);
}