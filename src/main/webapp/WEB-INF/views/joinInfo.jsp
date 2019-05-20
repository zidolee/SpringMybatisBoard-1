<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="message.board.joinInfo.mainTitle"/></title>
</head>
<body>
	<div align="center">
		<h1><spring:message code="message.board.joinInfo.mainTitle"/></h1>
		<a href="getBoardList.do"><spring:message code="message.board.joinInfo.boardList"/></a>
		<hr>
		<form action="updateUser.do" method="post">
			<input name="id" type="hidden" value="${user.id}">
			<input name="name" type="hidden" value="${user.name}">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70"><spring:message code="message.board.joinInfo.id"/></td>
					<td align="left">${user.id }</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.joinInfo.password"/></td>
					<td align="left"><input type="password" name="password" value="${user.password }"></td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.joinInfo.name"/></td>
					<td align="left">${user.name }</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.joinInfo.sex"/></td>
					<td align="left">
						<input type="radio" <c:if test="${user.sex eq 'male'}">checked="checked"</c:if> name="sex" value="male"><spring:message code="message.board.joinInfo.male"/>
						<input type="radio" <c:if test="${user.sex eq 'female'}">checked="checked"</c:if> name="sex" value="female"><spring:message code="message.board.joinInfo.female"/>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.joinInfo.birthday"/></td>
					<td align="left">
						<input type="date" name="birthday" value="${user.birthday }">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.joinInfo.hp"/></td>
					<td align="left">
						<input type="text" name="hp" value="${user.hp }">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.joinInfo.address"/></td>
					<td align="left">
						<input type="text" name="address" size="50" value="${user.address }">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.joinInfo.signupDate"/></td>
					<td align="left">
						${user.reg_date }
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="<spring:message code="message.board.joinInfo.updateBtn"/>">&nbsp;
						<input type="button" onclick="location.href='deleteUser.do?id=${user.id}'" value="<spring:message code="message.board.joinInfo.deleteBtn"/>">&nbsp;
					</td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
</body>
</html>