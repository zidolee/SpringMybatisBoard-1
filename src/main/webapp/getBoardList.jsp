<%-- <%@page import="java.util.List"%>
<%@page import="com.springbook.biz.board.impl.BoardDAO"%>
<%@page import="com.springbook.biz.board.BoardVO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="message.board.list.mainTitle"/></title>
	<style type="text/css">
		a:link {
			text-decoration: none;
			color: black;		
		}
	</style>
</head>
<body>
	<%
		// 세션에 저장된 글 목록을 꺼냄
//		List<BoardVO> boardList = (List)session.getAttribute("boardList");
		/* BoardVO vo = new BoardVO();
		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> boardList = boardDAO.getBoardList(vo); */
	%>
	
	<div align="center">
		<h1><spring:message code="message.board.list.mainTitle"/></h1>
		<h3>${userName }<spring:message code="message.board.list.welcomMsg"/></h3>
		<h3>
		<a href="logout.do">Log-out</a>&nbsp;&nbsp;&nbsp;
		<a href="getUser.do?id=${userId }">회원정보</a>
		</h3>
		<form action="getBoardList.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<c:forEach var="option" items="${conditionMap}">
								<option value="${option.value }">${option.key}
							</c:forEach>
						</select>
						<input name="searchKeyword" type="text">
						<input type="submit" value="<spring:message code="message.board.list.search.condition.btn"/>">
					</td>
				</tr>
			</table>
		</form>
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.seq"/></th>
				<th bgcolor="orange" width="200"><spring:message code="message.board.list.table.head.title"/></th>
				<th bgcolor="orange" width="150"><spring:message code="message.board.list.table.head.writer"/></th>
				<th bgcolor="orange" width="150"><spring:message code="message.board.list.table.head.regDate"/></th>
				<th bgcolor="orange" width="100"><spring:message code="message.board.list.table.head.cnt"/></th>
			<tr>
		<%-- <% for(BoardVO board : boardList){ %> --%>
		<c:forEach items="${boardList }" var="board">
			<tr>
				<td align="center">${board.seq }</td>
				<td align="left">&nbsp;<a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
				<td align="center">${board.writer }</td>
				<td align="center"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
				<td align="center">${board.cnt }</td>
			</tr>
		</c:forEach>
		<%-- <%} %>	 --%>
		</table>
		<br>
		<a href="insertBoard.jsp"><spring:message code="message.board.list.link.insertBoard"/></a>
	</div>
</body>
</html>