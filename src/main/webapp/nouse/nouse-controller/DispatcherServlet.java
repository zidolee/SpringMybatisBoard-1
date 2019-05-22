package com.springbook.view.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

/*@WebServlet("*.do")*/
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	
	
       
	@Override
	public void init() throws ServletException {
		handlerMapping = new HandlerMapping();
		viewResolver = new ViewResolver();
		viewResolver.setPrefix("./");
		viewResolver.setSuffix(".jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 1. 클라이언트의 요청 path  정보 추출
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String path = uri.substring(uri.lastIndexOf("/"));
		System.out.println("uri : " + uri);
		System.out.println("url : " + url);
		System.out.println("contextpath : " + request.getContextPath());
		System.out.println("getrealpath : " + request.getRealPath("upload"));
		System.out.println("path : " + path);
		
		// 2. HandlerMapping을 통해 path에 해당하나느 controller검색
		Controller ctrl = handlerMapping.getController(path);
		
		// 3. 검색된 Controller 검색
		String viewName = ctrl.handleRequest(request, response);
		
		//  4. ViewResolver를 통해 viewName에 해당하는 화면 검색
		String view = null;
		if(!viewName.contains(".do")) {
			view = viewResolver.getView(viewName);
		} else {
			view = viewName;
		}
		
		// 5. 검색된 화면으로 이동
		response.sendRedirect(view);


	}

}
