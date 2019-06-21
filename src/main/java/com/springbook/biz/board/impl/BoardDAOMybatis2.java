package com.springbook.biz.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.Criteria;
import com.springbook.biz.board.ReplyVO;

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
	
	
    public List<ReplyVO> list(int articleNo) throws Exception {
        return mybatis.selectList("ReplyDAO.list", articleNo);
    }

    //댓글 추가
    public void create(ReplyVO replyVO) throws Exception {
    	mybatis.insert("ReplyDAO.create", replyVO);
    }
   
    //댓글 수정
    public void update(ReplyVO replyVO) throws Exception {
    	mybatis.update("ReplyDAO.update", replyVO);
    }
    
    //댓글 삭제
    public void delete(Integer replyNo) throws Exception {
    	mybatis.delete("ReplyDAO.delete", replyNo);
    }
    
    //댓글 수 조회
    public int countReplies(Integer articleNo) throws Exception {
        return mybatis.selectOne("ReplyDAO.countReplies", articleNo);
    }
    
    //댓글의 게시글 번호 조회
    public int getArticleNo(Integer replyNo) throws Exception {
        return mybatis.selectOne("ReplyDAO.getArticleNo", replyNo);
    }
    
    //댓글 전체 조회 (페이징)
    public List<ReplyVO> listPaging(Integer articleNo, Criteria criteria) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("articleNo", articleNo);
        paramMap.put("criteria", criteria);
        return mybatis.selectList("ReplyDAO.listPaging", paramMap);
    }
      
}

