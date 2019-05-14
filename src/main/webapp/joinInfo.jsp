<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보확인</title>
</head>
<body>
	<div align="center">
		<h1>회원정보</h1>
		<a href="getBoardList.do">글 목록</a>
		<hr>
		<form action="join.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">아이디</td>
					<td align="left">${user.id }</td>
				</tr>
				<tr>
					<td bgcolor="orange">비밀번호</td>
					<td align="left"><input type="password" name="password" value="${user.password }"></td>
				</tr>
				<tr>
					<td bgcolor="orange">이름</td>
					<td align="left">${user.name }</td>
				</tr>
				<tr>
					<td bgcolor="orange">성별</td>
					<td align="left">
						<input type="radio" <c:if test="${user.sex eq 'male'}">checked="checked"</c:if> name="sex" value="male">남
						<input type="radio" <c:if test="${user.sex eq 'female'}">checked="checked"</c:if> name="sex" value="female">여
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">생년월일</td>
					<td align="left">
						<input type="date" name="birthdaty" value="${user.birthday }">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">휴대폰</td>
					<td align="left">
						<input type="text" name="hp" value="${user.hp }">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">주소</td>
					<td align="left">
						<input type="text" name="address" size="50" value="${user.address }">
					</td>
				</tr>
				<tr>
					<td bgcolor="orange">가입일</td>
					<td align="left">
						${user.reg_date }
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="정보수정">&nbsp;
						<input type="button" onclick="location:href=''" value="회원탈퇴">&nbsp;
					</td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
</body>
</html>