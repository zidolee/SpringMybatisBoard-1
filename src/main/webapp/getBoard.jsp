<%-- <%@page import="com.springbook.biz.board.impl.BoardDAO"%>
<%@page import="com.springbook.biz.board.BoardVO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="./bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="./dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<title><spring:message code="message.board.detail.mainTitle" /></title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%	
		// 세션에 저장된 게시글 정보를 꺼냄
		/* BoardVO board = (BoardVO)session.getAttribute("board"); */
	
		/* String seq = request.getParameter("seq");
		
		BoardVO vo = new BoardVO();
		vo.setSeq(Integer.parseInt(seq));
		
		BoardDAO boardDAO = new BoardDAO();
		BoardVO board = boardDAO.getBoardVO(vo); */
	%>
	<div class="wrapper">
		<header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>게</b>시판</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>게시판</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Tasks: style can be found in dropdown.less -->
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${userName }</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  ${userName }<spring:message code="message.board.list.welcomMsg"/>
                </p>
              </li>
              <!-- Menu Body -->
             <!--  <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                /.row
              </li> -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="getUser.do?id=${userId }" class="btn btn-default btn-flat"><spring:message code="message.board.list.userInfo"/></a>
                </div>
                <div class="pull-right">
                  <a href="logout.do" class="btn btn-default btn-flat"><spring:message code="message.board.list.logout"/></a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>

		<div class="box" align="center" width="700px">
			<section class="content container-fluid">
				<h1>
				<spring:message code="message.board.detail.mainTitle" />
			</h1>
			<a href="logout.do">Log-out</a>
			<hr>
			<form action="updateBoard.do" method="post">
				<input type="hidden" name="seq" value="${board.seq }">
				<table class="table" cellpadding="0" cellspacing="0">
					<tr>
						<td width="70"><spring:message
								code="message.board.detail.title" /></td>
						<td align="left"><input name="title" type="text"
							value="${board.title }"></td>
					</tr>
					<tr>
						<td><spring:message code="message.board.detail.writer" /></td>
						<td align="left">${board.writer }</td>
					</tr>
					<tr>
						<td><spring:message code="message.board.detail.content" /></td>
						<td align="left"><textarea rows="10" cols="40" name="content">${board.content }</textarea></td>
					</tr>
					<tr>
						<td><spring:message code="message.board.detail.regDate" /></td>
						<td align="left">${board.regDate }</td>
					</tr>
					<tr>
						<td><spring:message code="message.board.detail.cnt" /></td>
						<td align="left">${board.cnt }</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="<spring:message code="message.board.detail.updateBtn"/>">
						</td>
					</tr>
				</table>
			</form>
			<hr>
			<a href="insertBoard.do"><spring:message
					code="message.board.detail.link.insertBoard" /></a>&nbsp;&nbsp;&nbsp; <a
				href="deleteBoard.do?seq=${board.seq }"><spring:message
					code="message.board.detail.link.deleteBoard" /></a>&nbsp;&nbsp;&nbsp; <a
				href="getBoardList.do"><spring:message
					code="message.board.detail.link.boardList" /></a>
			</section>			
		</div>
	</div>

	<!-- jQuery 3 -->
	<script src="./bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="./bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="./dist/js/adminlte.min.js"></script>
	<!-- Sparkline -->
	<script
		src="./bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap  -->
	<script src="./plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="./plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll -->
	<script
		src="./bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS -->
	<script src="./bower_components/chart.js/Chart.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="./dist/js/pages/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./dist/js/demo.js"></script>
</body>
</html>