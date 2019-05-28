<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>

<%@ include file="../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini layout-boxed">

<div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../include/main_header.jsp"%>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <spring:message code="message.board.detail.mainTitle" />
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> article</li>
                <li class="active"><a href="${path}/getBoardList.do">getBoard</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title"><spring:message code="message.board.detail.title" />: ${board.title}</h3>
                    </div>
                    <div class="box-body" style="height: 700px">
                       <div id="content">
                       </div>
                    </div>
                    <div class="box-footer">
                        <div class="user-block">
                            <img class="img-circle img-bordered-sm" src="${path }/resources/dist/img/user1-128x128.jpg" alt="user image">
                            <span class="username">
                                <a href="#">${board.writer }</a>
                            </span>
                            <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${board.regDate}"/></span>
                            <span><spring:message code="message.board.detail.attachments" /> : 
                            <a href="download.do?originalFileName=${board.originalFileName }&seq=${board.seq}">${board.originalFileName }</a></span>
                        </div>
                    </div>
                    <div class="box-footer">
                        <form role="form" method="post">
                            <input type="hidden" name="seq" value="${board.seq }">
                        </form>
                        <button type="button" class="btn btn-info listBtn" onclick="location.href='getBoardList.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}'"><i class="fa fa-list"></i> <spring:message code="message.board.detail.link.boardList" /></button>
                    <div class="pull-right">
                    <c:if test="${userId eq board.writer}">
                    	<button type="button" onclick="location.href='modifyForm.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&seq=${board.seq }'" 
                    	class="btn btn-warning modBtn"><i class="fa fa-edit"></i> <spring:message code="message.board.detail.updateBtn"/></button>
                    	<button type="button" onclick="location.href='deleteBoard.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&seq=${board.seq }'" 
                    	class="btn btn-danger delBtn"><i class="fa fa-trash"></i> <spring:message code="message.board.detail.link.deleteBoard" /></button>
                    </c:if>
                    </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../include/main_footer.jsp"%>

</div>
<!-- ./wrapper -->
<%@ include file="../include/plugin_js.jsp"%>
<script>
    var result = "${msg}";
    if (result == "regSuccess") {
        alert("게시글 등록이 완료되었습니다.");
    } else if (result == "modSuccess") {
        alert("게시글 수정이 완료되었습니다.");
    } else if (result == "delSuccess") {
        alert("게시글 삭제가 완료되었습니다.");
    }
    document.getElementById('content').innerHTML = "${board.content}"
</script>
</body>
</html>