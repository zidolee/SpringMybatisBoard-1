<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 에러 화면</title>
</head>
<body bgcolor="#ffffff" text="#000000">
	<table width="800" border="1" cellpacing="0" cellpadding="0" align="center">
		<tr><td align="center" bgcolor="orange"><b>기본 에러 화면 입니다.</b></td></tr>
	</table>
	<br>
	<table width="800" border="1" cellpacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center">
			<br><br><br><br><br>
			Message: ${exception.message }
			<br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>