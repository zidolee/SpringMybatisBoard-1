<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<%--main_header.jsp--%>
<%-- Main Header --%>
<header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo" style="background-color: #00c0ef">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>게</b>시판</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>게시판</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" style="background-color: #00c0ef">
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
              <img src="${path}/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${userName }</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${path}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                <c:choose>
				    <c:when test="${not empty userId}">
						${userName }<spring:message code="message.board.list.welcomMsg"/>
				    </c:when>
				    <c:otherwise>
						<spring:message code="message.board.list.loginPls"/>
				    </c:otherwise>
				</c:choose>
                  
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
                <c:choose>
				    <c:when test="${not empty userId}">
                 		 <a href="getUser.do?id=${userId }" class="btn btn-default btn-flat"><spring:message code="message.board.list.userInfo"/></a>
				    </c:when>
				    <c:otherwise>
						<a href="joinPage.do" class="btn btn-default btn-flat"><spring:message code="message.board.list.join"/></a>
				    </c:otherwise>
				</c:choose>
                </div>
                
                <div class="pull-right">
                <c:choose>
				    <c:when test="${not empty userId}">
						<a href="logout.do" class="btn btn-default btn-flat"><spring:message code="message.board.list.logout"/></a>
				    </c:when>
				    <c:otherwise>
						<a href="login.do" class="btn btn-default btn-flat"><spring:message code="message.board.list.login"/></a>
				    </c:otherwise>
				</c:choose>
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