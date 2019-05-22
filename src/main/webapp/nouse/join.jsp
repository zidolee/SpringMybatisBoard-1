<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="message.board.join.mainTitle"/></title>
</head>
<body>
	<div align="center">
		<h1><spring:message code="message.board.join.mainTitle"/></h1>
		<a href="login.do"><spring:message code="message.board.join.loginBtn"/></a>
		<hr>
		<form action="join.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70"><spring:message code="message.board.join.id"/></td>
					<td align="left"><input name="id" type="text"></td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.join.password"/></td>
					<td align="left"><input type="password" name="password"></td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.join.name"/></td>
					<td align="left"><input type="text" name="name"></td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.join.sex"/></td>
					<td align="left">
						<input type="radio" name="sex" value="male"><spring:message code="message.board.join.male"/>
						<input type="radio" name="sex" value="female"><spring:message code="message.board.join.female"/>
					</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.join.birthday"/></td>
					<td align="left">
						<input type="date" name="birthday">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.join.hp"/></td>
					<td align="left">
						<input type="text" name="hp">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.board.join.address"/></td>
					<td align="left">
						<input type="text" name="address" size="50">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="<spring:message code="message.board.join.signupBtn"/>">
					</td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
</body>
</html>