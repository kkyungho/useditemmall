<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- css, js 파일포함 -->
<!-- 절대경로 /WEB-INF/views/include/header_info.jsp -->
<%@include file="/WEB-INF/views/admin/include/header_info.jsp"%>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-yellow sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@include file="/WEB-INF/views/admin/include/header.jsp"%>
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="/WEB-INF/views/admin/include/left_menu.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>H중고마켓 게시판</h1>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<!--------------------------
        | Your Page Content Here |
        -------------------------->

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Q&amp;A게시판</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
				              <div class="form-group">
				                <label for="brd_bno">글번호</label>
				                <input type="text" class="form-control" id="brd_bno" name="brd_bno" value="${board.brd_bno }" readonly="readonly">
				              </div>
				              <div class="form-group">
				                <label for="brd_title">제목</label>
				                <input type="text" class="form-control" id="brd_title" name="brd_title" value="${board.brd_title }" readonly="readonly">
				              </div>
				              <div class="form-group">
				                <label for="brd_content">내용</label>
				                <textarea class="form-control" rows="3" id="content" name="content" readonly="readonly">${board.brd_content }</textarea>				               
				              </div>
				              <div class="form-group">
				                <label for="hmal_name">이름/작성자</label>
				                <input type="text" class="form-control" id="hmal_name" name="hmal_name" value="${board.hmal_name }" readonly="readonly">
				              </div>
				            </div>
								<!-- /.box-body -->
								<div class="box-footer">
					                <button id="btnAnswer" name="btnAnswer" type="button" data-bno="${board.brd_bno }" class="btn btn-primary">문의답변하기</button>
					                <button id="btnList" type="button" class="btn btn-info">글목록</button>					
					
					                <form id="operForm" action="/board/get" method="get">
					                  <input type="hidden" id="brd_bno" name="brd_bno" value='<c:out value="${board.brd_bno}" />'>
					                  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
					                  <input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'>
					                  <input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
					                  <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
					                  
					                </form>
					
					              </div>					              
							</div>

						</div>
						<!-- /.col -->
					</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer (기타 footer파일 소스포함)-->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->
	<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>

	<script>
		$(document).ready(function() {

				let actionForm = $("#operForm");
				
				// 리스트에서 제목 클릭시 동작				
				$("button[name='btnAnswer']").on("click", function(e) {

					e.preventDefault(); // <a>태그의 기본적인 이벤트기능을 취소. 즉 링크기능취소.      

					let brd_bno = $(this).attr("href");
					console.log("글번호" + brd_bno);

					location.href = "/admin/board/answer?brd_bno=" + brd_bno; // /board/get?bno=1

							/*
					actionForm.append("<input type='hidden' name='brd_bno' value='" + $(this).attr("href") + "'>");										
					actionForm.attr("action", "/board/answer");

				    actionForm.submit();
				    */

				});
			
														
				// 페이지 번호 클릭시 동작 prev , page number, next 에 해당하는 <a>태그 선택
				$(".paginate_button a").on("click",	function(e) {
					e.preventDefault();

					actionForm.find("input[name='pageNum']").val($(this).attr("href"));

					console.log("click");

					actionForm.submit();
				});
				
				// 글목록버튼 클릭시
				$("#btnList").on("click", function(){
					
					location.href = "/admin/board/list";
				});
				
				/*
				// 문의답변클릭시				
				$("#btnAnswer").on("click", function(){
					
					let brd_bno = $(this).data("brd_bno");
					location.href = "/admin/board/answer?brd_bno=" + brd_bno;
				});
				*/
			});
	</script>

</body>
</html>
