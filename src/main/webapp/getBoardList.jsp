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
<%-- <meta charset="UTF-8">
<title><spring:message code="message.board.list.mainTitle"/></title>
	<style type="text/css">
		a:link {
			text-decoration: none;
			color: black;		
		}
		.pagination {
		  display: inline-flex;
		  list-style:none;
		}
	</style> --%>
	<meta charset="utf-8">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="./bower_components/Ionicons/css/ionicons.min.css">
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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%
		// 세션에 저장된 글 목록을 꺼냄
//		List<BoardVO> boardList = (List)session.getAttribute("boardList");
		/* BoardVO vo = new BoardVO();
		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> boardList = boardDAO.getBoardList(vo); */
	%>
	<%-- 
	<div align="center">
		<h1><spring:message code="message.board.list.mainTitle"/></h1>
		<h3>${userName }<spring:message code="message.board.list.welcomMsg"/></h3>
		<h3>
		<a href="logout.do"><spring:message code="message.board.list.logout"/></a>&nbsp;&nbsp;&nbsp;
		<a href="getUser.do?id=${userId }"><spring:message code="message.board.list.userInfo"/></a>
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
		<% for(BoardVO board : boardList){ %>
		<c:forEach items="${boardList }" var="board">
			<tr>
				<td align="center">${board.seq }</td>
				<td align="left">&nbsp;<a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
				<td align="center">${board.writer }</td>
				<td align="center"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
				<td align="center">${board.cnt }</td>
			</tr>
		</c:forEach>
		<%} %>	
		</table>
		<br>
		<div class="box-footer" align="center">
		    <div class="text-center">
		        <ul class="pagination">
		            <c:if test="${pageMaker.prev}">
		                <li><a href="getBoardList.do?page=${pageMaker.startPage - 1}">이전</a>&nbsp;</li>
		            </c:if>
		            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
		                    <a href="getBoardList.do?page=${idx}">${idx}</a>&nbsp;
		                </li>
		            </c:forEach>
		            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		                <li><a href="getBoardList.do?page=${pageMaker.endPage + 1}">다음</a></li>
		            </c:if>
		        </ul>
		    </div>
		</div>
		<br>
		<a href="insertBoardForm.do"><spring:message code="message.board.list.link.insertBoard"/></a>
	</div> --%>
	
	
	<!-- ******************************bootstrap************************************** -->
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
              <li class="user-body">
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
                <!-- /.row -->
              </li>
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
	<div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Bordered Table</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
	            <form action="getBoardList.do" method="get">
					<table class="table table-bordered">
						<tr>
							<td align="right">
								<select name="searchCondition">
									<c:forEach var="option" items="${conditionMap}">
										<option value="${option.value }">${option.key}
									</c:forEach>
								</select>
								<input name="searchKeyword" type="text">
								<input type="submit" value="<spring:message code="message.board.list.search.condition.btn"/>" class="btn btn-primary">
							</td>
						</tr>
				</table>
				</form>
              <table class="table table-bordered">
                <tr>
                  <th style="width: 10%"><spring:message code="message.board.list.table.head.seq"/></th>
				  <th ><spring:message code="message.board.list.table.head.title"/></th>
			      <th ><spring:message code="message.board.list.table.head.writer"/></th>
				  <th ><spring:message code="message.board.list.table.head.regDate"/></th>
				  <th style="width: 5%"><spring:message code="message.board.list.table.head.cnt"/></th>
                </tr>
				<c:forEach items="${boardList }" var="board">
					<tr>
						<td align="center">${board.seq }</td>
						<td align="left">&nbsp;<a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
						<td align="center">${board.writer }</td>
						<td align="center"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
						<td align="center">${board.cnt }</td>
					</tr>
				</c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            <a href="insertBoardForm.do" class="btn btn-primary"><spring:message code="message.board.list.link.insertBoard"/></a>
			    <div class="text-center">
			        <ul class="pagination">
			            <c:if test="${pageMaker.prev}">
			                <li><a href="getBoardList.do?page=${pageMaker.startPage - 1}">이전</a></li>
			            </c:if>
			            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
			                    <a href="getBoardList.do?page=${idx}">${idx}</a>
			                </li>
			            </c:forEach>
			            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			                <li><a href="getBoardList.do?page=${pageMaker.endPage + 1}">다음</a></li>
			            </c:if>
			        </ul>
			    </div>
			</div>
          </div>
          <!-- /.box -->
</div>
          

<!-- jQuery 3 -->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="./bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="./bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="./plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="./plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="./bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="./bower_components/chart.js/Chart.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="./dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="./dist/js/demo.js"></script>
</body>
</html>