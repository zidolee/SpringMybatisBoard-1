<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="message.board.insert.mainTitle"/></title>
</head>
<body>
	<div align="center">
		<h1><spring:message code="message.board.insert.mainTitle"/></h1>
		<a href="logout.do"><spring:message code="message.board.insert.logout"/></a>
		<hr>
		<form action="insertBoard.do" method="post" enctype="multipart/form-data">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70"><spring:message code="message.board.insert.title"/></td>
					<td align="left"><input name="title" type="text"></td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.insert.writer"/></td>
					<td align="left"><input type="text" name="writer" size="10"></td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.insert.content"/></td>
					<td align="left"><textarea rows="10" cols="40" name="content"></textarea></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70" align="center"><spring:message code="message.board.insert.upload"/></td>
					<td align="left"><input type="file" name="uploadFile"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="<spring:message code="message.board.insert.insertBtn"/>">
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="getBoardList.do"><spring:message code="message.board.insert.boardList"/></a>
	</div>
</body>
</html>