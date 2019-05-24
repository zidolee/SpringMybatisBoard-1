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
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">게시글 목록</h3>
                    </div>
                    <div class="box-body">
                    	<form action="getBoardList.do" method="get">
							<table class="table">
								<tr>
									<td align="right">
										<select name="searchCondition">
											<c:forEach var="option" items="${conditionMap}">
												<option value="${option.value }">${option.key}
											</c:forEach>
										</select>
										<input name="searchKeyword" type="text">
										<input type="submit" value="<spring:message code="message.board.list.search.condition.btn"/>" class="btn btn-info">
									</td>
								</tr>
							</table>
						</form>
                        <table class="table table-bordered">
			                <tr>
			                  <td align="center" width="8%" style="font-weight: bolder;"><spring:message code="message.board.list.table.head.seq"/></td>
							  <td align="center" style="font-weight: bolder;"><spring:message code="message.board.list.table.head.title"/></td>
						      <td align="center" style="font-weight: bolder;"><spring:message code="message.board.list.table.head.writer"/></td>
							  <td align="center" style="font-weight: bolder;"><spring:message code="message.board.list.table.head.regDate"/></td>
							  <td align="center" width="8%" style="font-weight: bolder;"><spring:message code="message.board.list.table.head.cnt"/></td>
			                </tr>
							<c:forEach items="${boardList }" var="board">
								<tr>
									<td align="center">${board.seq }</td>
									<%-- <td align="left">&nbsp;<a href="getBoard.do?seq=${board.seq }">${board.title }</a></td> --%>
									<td align="left">&nbsp;<a href="getBoard.do${pageMaker.makeQuery(pageMaker.criteria.page)}&seq=${board.seq }">${board.title }</a></td>
									<td align="center">${board.writer }</td>
									<td align="center"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
									<td align="center"><span class="badge bg-red">${board.cnt}</span></td>
								</tr>
							</c:forEach>
              			</table>
                    </div>
                    <div class="box-footer">
                        <div class="pull-right">
                            <a href="insertBoardForm.do" class="btn btn-info"><spring:message code="message.board.list.link.insertBoard"/></a>
                        </div>
                         <div class="text-center">
					        <ul class="pagination">
					            <c:if test="${pageMaker.prev}">
					                <%-- <li><a href="getBoardList.do?page=${pageMaker.startPage - 1}">이전</a></li> --%>
					                <li><a href="getBoardList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					            </c:if>
					            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
					                    <%-- <a href="getBoardList.do?page=${idx}">${idx}</a> --%>
					                    <a href="getBoardList.do${pageMaker.makeQuery(idx)}">${idx}</a>
					                </li>
					            </c:forEach>
					            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					                <%-- <li><a href="getBoardList.do?page=${pageMaker.endPage + 1}">다음</a></li> --%>
					                <li><a href="getBoardList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					            </c:if>
					        </ul>
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
</script>
</body>
</html>