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
				<h1>H중고마켓 회원</h1>
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
								<h3 class="box-title">회원목록</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div id="example2_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6"></div>
									</div>
									<div class="container">
										<div class="col-sm-12">
											<table id="example2"
												class="table table-bordered table-hover dataTable"
												role="grid" aria-describedby="example2_info">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="example2" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="Rendering engine: activate to sort column descending">번호</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="Browser: activate to sort column ascending">아이디</th>
														<!-- 
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="Platform(s): activate to sort column ascending">비밀번호</th>
															 -->
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="Engine version: activate to sort column ascending">이름</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">이메일</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">우편번호</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">기본주소</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">상세주소</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">휴대폰번호</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">가입일</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">수정일</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">접속시간</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${list}" var="customer" varStatus="status">
														<tr role="row"
															class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
															<td class="sorting_1"><c:out value="${customer.brd_bno }"></c:out></td>
															<td><a class="move" href="<c:out value="${customer.brd_bno }">
																</c:out>"><c:out value="${customer.hmal_id }"></c:out>																
																</a>
															</td>
															<td><c:out value="${customer.hmal_name }"></c:out></td>
															<td><c:out value="${customer.hmal_email }"></c:out></td>
															<td><c:out value="${customer.hmal_zipcode }"></c:out></td>
															<td><c:out value="${customer.hmal_deaddr }"></c:out></td>
															<td><c:out value="${customer.hmal_phone }"></c:out></td>															
															<td><fmt:formatDate value="${customer.hmal_datesub }"
																	pattern="yyyy-MM-dd" /></td>
															<td><fmt:formatDate value="${customer.hmal_updatedate }"
																	pattern="yyyy-MM-dd" /></td>
														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-5 dataTables_info">
											<form id="searchForm" action="/admin/user/list" method="get">
												<select name="type">
													<option value=""
														<c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--</option>
													<option value="T"
														<c:out value="${pageMaker.cri.type eq 'I'? 'selected':'' }" />>아이디</option>
													<option value="C"
														<c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>이름</option>
													<option value="W"
														<c:out value="${pageMaker.cri.type eq 'E'? 'selected':'' }" />>이메일</option>													
												</select> 
												<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword }" />">
												<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum}"> 
												<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
												<button class="btn btn-primary">Search</button>
											</form>

											<!--
											<div class="dataTables_info" id="example2_info" role="status"
												aria-live="polite">Showing 1 to 10 of 57 entries</div>
												-->
										    </div>
											<div class="col-sm-7">
												<div class="dataTables_paginate paging_simple_numbers"
													id="example2_paginate">
													<ul class="pagination">
													<c:if test="${pageMaker.prev }">
														<li	class='paginate_button previous ${pageMaker.prev ? "": "disabled" }'
															id="example2_previous"><a href="${pageMaker.startPage - 1}"
															aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
														</c:if>
														<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
															<li	class='paginate_button ${pageMaker.cri.pageNum == num ? "active":""} '>
															<a href="${num}" aria-controls="example2" data-dt-idx="1" tabindex="0">${num}</a></li>
														</c:forEach>
														<c:if test="${pageMaker.next }">
															<li class="paginate_button next" id="example2_next">
															<a href="${pageMaker.endPage + 1}" aria-controls="example2"	data-dt-idx="7" tabindex="0">Next</a></li>
														</c:if>
													</ul>
												</div>
											</div>
											<!--prev,page number,next 를 클릭하면 아래 form이 작동된다.-->
											<form id="actionForm" action="/board/list" method="get">
												<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
												<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum}"> 
												<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
												<input type="hidden" name="type" value="${pageMaker.cri.type}"> 
												<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
												<!-- 글번호추가-->
											</form>

										</div>
									</div>
								</div>
								<!-- /.box-body -->
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

				let actionForm = $("#actionForm");
				
				// 리스트에서 제목 클릭시 동작
				$(".move").on("click", function(e) {

					e.preventDefault(); // <a>태그의 기본적인 이벤트기능을 취소. 즉 링크기능취소.      

					let bno = $(this).attr("href");
					console.log("글번호" + bno);

					// location.href = "/board/get?bno=" + bno; // /board/get?bno=1

					actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");										
					actionForm.attr("action", "/board/get");

				    actionForm.submit();

				});
			
														
				// 페이지 번호 클릭시 동작 prev , page number, next 에 해당하는 <a>태그 선택
				$(".paginate_button a").on("click",	function(e) {
					e.preventDefault();

					actionForm.find("input[name='pageNum']").val($(this).attr("href"));

					console.log("click");

					actionForm.submit();
				});
			});
	</script>

</body>
</html>
