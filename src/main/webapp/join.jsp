<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
</head>
<body>
	<div>
		<form action="join.do" method="post">
		<p>
			아이디 : <br><input type="text" name="id">
		</p>
		<p>
			이름 : <br><input type="text" name="name">
		</p>
		<p>
			비밀번호 : <br><input type="password" name="password">
		</p>
		<input type="submit" value="가입">
	</form>	
	</div>
</body>
</html>