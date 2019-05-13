<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="message.user.login.title"/></title>
</head>
<body>
	<div align="center">
		<h1><spring:message code="message.user.login.title"/></h1>
		<a href="login.do?lang=en"><spring:message code="message.user.login.language.en"/></a>&nbsp;&nbsp;
		<a href="login.do?lang=ko"><spring:message code="message.user.login.language.ko"/></a>
		<hr>
		<form method="post" action="login.do">
			<table border="1" cellpadding = "0" cellspacing="0">
				<tr>
					<td bgcolor="orange"><spring:message code="message.user.login.id"/></td>
					<td><input type="text" name="id" value="${user.id }"></td>
				</tr>
				<tr>
					<td bgcolor="orange"><spring:message code="message.user.login.password"/></td>
					<td> <input type="password" name="password" value="${user.password }"></td>
				</tr>	
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="<spring:message code="message.user.login.loginBtn"/>">
						<input type="button" onclick="location.href='join.do'" value="<spring:message code="message.user.login.joinBtn"/>" />
					</td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
</body>
</html>