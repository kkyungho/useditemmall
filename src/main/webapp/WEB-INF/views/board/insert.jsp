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
			
		form.insertForm{
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
<div class="container">
  
  <!-- 게시판 -->  
  	<div class="container" style="width: 100%; background-color: white; font-size: 16px;">
  		<form class="insertForm" action="/board/insert" method="post" id="insertForm">
		  <div class="container" style="width: 900px; padding: 3% 2px;">
		  	<h4>Q&amp;A게시판</h4><br><br>
		  	 <div class="form-row">			    
				<div class="col-md-2">
				    <label for="brd_title" style="font-weight: 800;">제목</label>									    
				</div>				
				<div class="col-md-9">
					<input type="text" class="form-control" id="brd_title" name="brd_title"
						style="max-width:400px; display: inline-block;">
				</div>
			 </div>
			 <br>
			 <div class="form-row">			    
				<div class="col-md-2">
				    <label for="hmal_name" style="font-weight: 800;">이름/작성자</label>									    
				</div>				
				<div class="col-md-9">
					<input type="text" class="form-control" id="hmal_name" name="hmal_name"
						style="max-width:400px; display: inline-block;">
				</div>
			 </div>
			 <br>
			 <div class="form-row">
			    <div class="col-md-2">
			      <label for="brd_content" style="font-weight: 800;">내용</label>
				</div>
				<div class="col-md-10">
			      <textarea id="brd_content" name="brd_content" maxlength="65536" style="width:100%; height:300px;
			       border: 0.01px solid rgb(224, 224, 224); border-collapse: collapse; border-radius: 5px;"></textarea>			      
			    </div>
			 </div>	
			 	  			          		  
	  		 <div class="form-row" style="float: right; margin-top: 10px;">
	  		 	<button type="button" id="btnInsert" class="btn btn-dark">작성</button>&nbsp;
	  			<button type="reset" id="btnCancle" class="btn btn-danger">취소</button>&nbsp;
	  		 </div> 
	  	   </div> 
		</form>	 
	  </div>  
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>


<script>

  $(document).ready(function(){	
	  
	let form = $("#insertForm");
    
    // 회원가입 버튼 클릭 시 
	$("#btnInsert").on("click", function(){
		let result = confirm("글 작성을 하시겠습니까?");		
        
		if(result) {		
			// 유효성 검사 
			let brd_title = $("#brd_title");
			let hmal_name = $("#hmal_name");
			let brd_content = $("#brd_content");					
			
			if(brd_title.val() == "" || brd_title.val() == null){
				alert("제목을 입력해주세요");
				brd_title.focus();
				return false;				
		
			} else if(hmal_name.val()== "" || hmal_name.val() == null){
				alert("이름을 입력해주세요.");
				hmal_name.focus();
				return false;
			
			} else if(brd_content.val()== "" || brd_content.val() == null){
				alert("내용을 입력해주세요.");
				brd_content.focus();
				return false;
	
			}  
			
			form.submit();			
		}		
		
	});
	
    // 취소 버튼 클릭시
	$("#btnCancle").on("click", function(){
		
		let result = confirm("작성을 취소하시겠습니까?");
		if(result){
			location.href="/board/list"; 
		} else{}
	});

  	
    
    
  });


</script>
    
  </body>
</html>
