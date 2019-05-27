package com.springbook.biz.board.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.Criteria;
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
	public void deleteBoard(int seq) {
		boardDAO.deleteBoard(seq);
	}

	@Override
	public BoardVO getBoard(int seq) {
		return boardDAO.getBoard(seq);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria criteria) throws Exception {
		System.out.println(criteria.getPageStart());
		System.out.println(criteria.getPerPageNum());
	    return boardDAO.listCriteria(criteria);
	}
	
	@Override
	public int countArticles(Criteria criteria) throws Exception {
	    return boardDAO.countArticles(criteria);
	}
	
	@Override
	public String fileUpload(BoardVO vo, HttpServletRequest request) {
		MultipartFile uploadFile = vo.getUploadFile();
		boolean isSuccess = false;
//		Set pathSet = request.getSession().getServletContext().getResourcePaths("upload");
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");

//		String uploadPath = "/Users/zidol/Desktop/";
		File dir = new File(uploadPath);

		if (dir.isDirectory()) {
			dir.mkdir();
		}

		String originalFileName = uploadFile.getOriginalFilename();
		String saveFileName = originalFileName;

		if (saveFileName != null && !saveFileName.equals("")) {
			if (new File(uploadPath + saveFileName).exists()) {
				saveFileName = System.currentTimeMillis()+ "_"  + saveFileName;
			}
			try {
				uploadFile.transferTo(new File(uploadPath + saveFileName));
				isSuccess = true;
			} catch (IllegalStateException e) {

				e.printStackTrace();

				isSuccess = false;

			} catch (IOException e) {

				e.printStackTrace();

				isSuccess = false;

			}
		}
		return saveFileName; 
	   }
}
