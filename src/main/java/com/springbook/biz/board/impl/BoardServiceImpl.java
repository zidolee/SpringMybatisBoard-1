package com.springbook.biz.board.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.Criteria;
//조인포인트
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAOMybatis2 boardDAO;
	
	@Override//포인트컷 대상(메서드)
	public void insertBoard(BoardVO vo) {
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
	public Map<String, String>  fileUpload(BoardVO vo, HttpServletRequest request) {
		MultipartFile uploadFile = vo.getUploadFile();
		boolean isSuccess = false;		
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");

		File dir = new File(uploadPath);

		if (dir.isDirectory()) {
			dir.mkdir();
		}

		String originalFileName = uploadFile.getOriginalFilename();
		String saveFileName = originalFileName;
		Map<String, String> fileName = new HashMap<String, String>();

		if (saveFileName != null && !saveFileName.equals("")) {
			if (new File(uploadPath + saveFileName).exists()) {
				saveFileName = System.currentTimeMillis()+ "_"  + saveFileName;
			}
			try {
				uploadFile.transferTo(new File(uploadPath + saveFileName));
				isSuccess = true;
				fileName.put("originalFileName", originalFileName);
				fileName.put("saveFileName", saveFileName);
			} catch (IllegalStateException e) {

				e.printStackTrace();

				isSuccess = false;

			} catch (IOException e) {

				e.printStackTrace();

				isSuccess = false;
			}
		}
		return fileName; 
	   }

	@Override
	public byte[] fileDownload(BoardVO vo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		BoardVO saveFileName = selectFileName(vo);
		String save_fileName = saveFileName.getSaveFileName();
        File file = new File(uploadPath + save_fileName);
        byte[] bytes = FileCopyUtils.copyToByteArray(file);
        String fn = new String(vo.getOriginalFileName().getBytes("utf-8"), "iso_8859_1");
        response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
        response.setContentLength(bytes.length);
		return bytes;
	}
	
	public BoardVO selectFileName(BoardVO vo) throws Exception {
		return boardDAO.selectSaveFileName(vo);
	}
}
