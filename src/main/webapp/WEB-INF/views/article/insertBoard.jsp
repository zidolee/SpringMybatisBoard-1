<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                게시판
                <small>목록페이지</small>
            </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-edit"></i> article</li>
                <li class="active"><a href="${path}/getBoardList.do"> list</a></li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content container-fluid">
            <div class="col-lg-12">
                <form role="form" id="writeForm" method="post" action="insertBoard.do" enctype="multipart/form-data">
               		<input class="form-control" type="hidden" id="writer" name="writer" value="${userId }">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><spring:message code="message.board.insert.title"/></h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label for="title"><spring:message code="message.board.insert.title"/></label>
                                <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
                            </div>  
				        </div>
				            <!-- /.box-header -->
				            <div class="box-body pad">
				              		<label for="content"><spring:message code="message.board.insert.content"/></label>
				                    <textarea id="editor1" name="content" rows="10" cols="80" placeholder="내용을 입력해주세요"></textarea>
				            </div>
                            <div class="box box-info">
                            <div class="form-group">
                                <label for="upload"><spring:message code="message.board.insert.upload"/></label>
                                <input class="form-control" type="file" name="uploadFile">
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="button" onclick="location.href='getBoardList.do'" class="btn btn-primary"><i class="fa fa-list"></i>
                            <spring:message code="message.board.insert.boardList"/></button>
                            <div class="pull-right">
                                <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                                <input type="submit" class="btn btn-success" value="<spring:message code="message.board.insert.insertBtn"/>">
                            </div>
                        </div>
                    </div>
                </form>
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
</script>
</body>
</html>