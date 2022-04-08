<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>중고거래의 시작, H중고마켓</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
	
	
	<style>
		
		h4{
		    text-align : center;    	
		}
			
		form.getForm{
		  border: 0.01px solid rgb(224, 224, 224); border-collapse: collapse;
		  border-radius: 5px;
		  padding-bottom: 40px;
	    } 	
	  	
	  	  
  	</style>
    
    
  </head>
  <body>
    
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
<br>
<!-- 카테고리정보 -->
<%@include file="/WEB-INF/views/include/category.jsp" %>
<br>
<!-- 사이드메뉴 -->
<%@include file="/WEB-INF/views/include/sideMenu.jsp" %>
<br>
<div class="container">
  
  <!-- 게시판 -->  
  	<div class="container" style="width: 100%; background-color: white; font-size: 16px;">
  		<form class="getForm" action="/board/get" method="get" id="getForm">  		
		  <div class="container" style="width: 900px; padding: 3% 2px;">
		  	<h4>Q&amp;A게시판</h4><br><br>
		  	 <div class="form-row">			    
				<div class="col-md-2">
				    <label for="brd_title" style="font-weight: 800;">제목</label>									    
				</div>				
				<div class="col-md-9">
					<input type="text" class="form-control" id="brd_title" name="brd_title"
						style="max-width:400px; display: inline-block;" value="${board.brd_title }" readonly>
				</div>
			 </div>
			 <br>
			 <div class="form-row">			    
				<div class="col-md-2">
				    <label for="hmal_name" style="font-weight: 800;">이름/작성자</label>									    
				</div>				
				<div class="col-md-9">
					<input type="text" class="form-control" id="hmal_name" name="hmal_name"
						style="max-width:400px; display: inline-block;" value="${board.hmal_name }" readonly> 
				</div>
			 </div>
			 <br>
			 <div class="form-row">
			    <div class="col-md-2">
			      <label for="brd_content" style="font-weight: 800;">내용</label>
				</div>
				<div class="col-md-10">
			      <textarea id="brd_content" name="brd_content" maxlength="65536" style="width:100%; height:300px;
			       border: 0.01px solid rgb(224, 224, 224); border-collapse: collapse; border-radius: 5px;" readonly><c:out value="${board.brd_content}" /></textarea>			      
			    </div>
			 </div>				 	  			          		  
	  		 <div class="form-row" style="float: right; margin-top: 10px;">
	  		 	<input type="hidden" id="brd_bno" name="brd_bno" value='<c:out value="${ board.brd_bno}" />'>
	  		 	<button type="button" id="btnModify" data-brd_bno="${board.brd_bno }" class="btn btn-dark">수정</button>&nbsp;
	  			<button type="button" id="btnList" class="btn btn-light">글목록</button>&nbsp;
	  		 </div> 
	  	   </div> 
		</form>	 
	  </div>  
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>


<script>

  $(document).ready(function(){	
	  
	let form = $("#getForm");
    
	// 글수정 버튼 클릭시
	$("#btnModify").on("click", function(){
		
		let brd_bno = $(this).data("brd_bno");
		
		location.href = "/board/modify?brd_bno=" + brd_bno;
	});
	
    // 글목록 버튼 클릭시
	$("#btnList").on("click", function(){
		
		location.href = "/board/list";
	});

  	
    
    
  });


</script>

  </body>
</html>
