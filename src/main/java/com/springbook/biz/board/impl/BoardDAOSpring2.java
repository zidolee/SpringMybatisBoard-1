package com.springbook.biz.board.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;

@Repository
public class BoardDAOSpring2 {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//SQL명령어
	private final String BOARD_INSERT = "insert into board(seq, title, writer, "
			+ "content) values((select nvl(max(seq), 0)+1 from board),?,?,?)";
	//트랜젝션 테스트
//	private final String BOARD_INSERT = "insert into board(seq, title, writer, "
//			+ "content) values(?,?,?,?)";
	private final String BOARD_UPDATE = "update board set title=?, "
			+ "content=? where seq?";
	private final String BOARD_DELETE = "delete board where seq=?";
	private final String BOARD_GET = "select * from board where seq=?";
	private final String BOARD_LIST = "select * from board order by seq desc";
	private final String BOARD_LIST_T = "select * from board where title like '%'||?||'%' order by seq desc";
	private final String BOARD_LIST_C = "select * from board where content like '%'||?||'%' order by seq desc";
	private final String BOARD_LIST_W = "select * from board where writer like '%'||?||'%' order by seq desc";

	//crud 기능의 메소드 구현
	//글 등록
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Spring2 JDBC로 insertBoard() 기능 처리");
		jdbcTemplate.update(BOARD_INSERT, vo.getTitle(), vo.getWriter(), vo.getContent());
	}
	
	// 글 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Sring2 JDBC로 updateBoard() 기능 처리");
		jdbcTemplate.update(BOARD_UPDATE, vo.getTitle(), vo.getContent(), vo.getSeq());
	}
	
	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Spring2 JDBC로 deleteBoard() 기능 처리");
		jdbcTemplate.update(BOARD_DELETE, vo.getSeq());
	}
	
	// 글 상세 조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Spring2 JDBC로 getBoard() 기능 처리");
		Object[] args = {vo.getSeq()};
		return jdbcTemplate.queryForObject(BOARD_GET, args, new BoardRowMapper2());
	}
	
	//글 목록조회
	public List<BoardVO>  getBoardList(BoardVO vo) {
		System.out.println("===> Spring2 JDBC로 getBoardList() 기능 처리");
//		Object[] args = {vo.getSearchKeyword()};
//		if(vo.getSearchCondition().equals("TITLE")) {
//			return jdbcTemplate.query(BOARD_LIST_T, args, new BoardRowMapper2());
//		} else if(vo.getSearchCondition().equals("CONTENT")) {
//			return jdbcTemplate.query(BOARD_LIST_C, args,  new BoardRowMapper2());
//		} else if(vo.getSearchCondition().equals("WRITER")) {
//			return jdbcTemplate.query(BOARD_LIST_W, args, new BoardRowMapper2());
//		}
		return null;
	}
}

class BoardRowMapper2 implements RowMapper<BoardVO> {

	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardVO board = new BoardVO();
		board.setSeq(rs.getInt("SEQ"));
		board.setTitle(rs.getString("TITLE"));
		board.setWriter(rs.getString("WRITER"));
		board.setContent(rs.getString("CONTENT"));
		board.setRegDate(rs.getDate("REGDATE"));
		board.setCnt(rs.getInt("CNT"));
		return board;
	}

}
