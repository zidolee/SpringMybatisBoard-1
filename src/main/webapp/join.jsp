<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div align="center">
		<h1>회원가입</h1>
		<a href="login.do">로그인 페이지</a>
		<hr>
		<form action="join.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">아이디</td>
					<td align="left"><input name="id" type="text"></td>
				</tr>
				<tr>
					<td bgcolor="orange">비밀번호</td>
					<td align="left"><input type="password" name="password"></td>
				</tr>
				<tr>
					<td bgcolor="orange">이름</td>
					<td align="left"><input type="text" name="name"></td>
				</tr>
				<tr>
					<td bgcolor="orange">성별</td>
					<td align="left">
						<input type="radio" name="sex" value="male">남
						<input type="radio" name="sex" value="female">여
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">생년월일</td>
					<td align="left">
						<input type="date" name="birthday">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">휴대폰</td>
					<td align="left">
						<input type="text" name="hp">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">주소</td>
					<td align="left">
						<input type="text" name="address" size="50">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="가입">
					</td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
</body>
</html>