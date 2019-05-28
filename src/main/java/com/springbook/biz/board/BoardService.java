package com.springbook.biz.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	Map<String, String> fileUpload(BoardVO vo, HttpServletRequest request);
	
	byte[] fileDownload(BoardVO vo, HttpServletResponse response, HttpServletRequest request) throws Exception;
}