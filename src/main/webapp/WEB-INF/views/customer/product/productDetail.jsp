<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>중고거래의 시작, H중고마켓</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">   
    
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
           
    
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
	<div class="container">	  	
  		<a title="홈페이지 이동" id="home" href="/" style="color: gray; text-decoration: none;">
  			<img alt="Home" src="/resources/img/home.png" width="15" height="15">&nbsp;HOME
  		</a>  				  	  		  	
	</div>
	<br>	
	  <div class="row">		
		<div class="col-sm-5">
      		<img name="productImage" width="120%" height="360" src="/customer/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
      	</div>
      	<div class="col-sm-1"></div>
      	<!-- 상품명, 상품가격, 상품상태, 판매자 -->
      	<div class="col-sm-5">
      		<input type="hidden" name="pro_num" value="${productVO.pro_num }">
      		<input type="hidden" name="cate_code" value="${productVO.cate_code}">
      		<label style="font-size: 1.3em; font-weight: 600; padding-left: 20px;">${productVO.pro_name }</label><br>
      		<label style="font-size: 2.375em; font-weight: 600; font-weight: 600; padding-left: 20px;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${productVO.pro_price }"/>원</label><br><br>      		
      		<label style="font-size: 1.0em; padding-left: 20px; color: gray;">• 상품상태 &nbsp;${productVO.pro_con }</label><br>
      		<label style="font-size: 1.0em; padding-left: 20px; color: gray;">• 판매자 &nbsp;${productVO.hmal_id }</label><br><br>
          <div class="form-row">
            <div class="btn-group" style="padding-left: 20px;"> 
            <!-- 로그인 이전 --> 
            <c:if test="${sessionScope.loginStatus == null }">            
              <button type="button" name="btnCartSoon" class="btn btn-light" style="font-size: 20px;">찜하기</button>&nbsp;              
              <button type="button" name="btnBuySoon" class="btn btn-warning" style="font-size: 20px;">바로구매</button>&nbsp;
            </c:if>
            <!-- 로그인 이후 -->
            <c:if test="${sessionScope.loginStatus != null }">            
              <button type="button" name="btnCart" class="btn btn-light" style="font-size: 20px;">찜하기</button>&nbsp;              
              <button type="button" name="btnBuy" class="btn btn-warning" style="font-size: 20px;">바로구매</button>&nbsp;
            </c:if>
            </div>                        
          </div>
      	</div> 
      </div>
      <br><br>
      <div class="nav">
		<ul class="nav nav-tabs" id="storelist" role="tablist">
		  <li class="nav-item" id="info_sub" role="presentation">
		    <a class="nav-link active" id="productInfo" data-toggle="tab" href="/customer/product/productDetail" 
		    style="color: black; width: 200px; text-align: center; border-top-color: black; border-left-color: black; border-right-color: black;" role="tab" aria-selected="true">상품정보</a>
		  </li>
		  <li class="nav-item" id="inqu_sub" role="presentation">
		    <a class="nav-link" id="productInqu" data-toggle="tab" href="/review/productReview" 
		    style="color: black; width: 200px; text-align: center; border-bottom-color: black;" role="tab" data-pro_num='<c:out value="${productVO.pro_num }"></c:out>' aria-selected="false">상품문의</a>		    
		  </li>		  
		</ul>
	  </div>
	  <!-- 상품정보 -->
	  <div class="tab-content" id="nav-tabContent">		  	    
		  <div class="tab-pane fade show active" id="product" role="tabpanel" aria-labelledby="product-tab">
		  	<div class="form-row">
	      	  <h4 style="font-size: 1.375em; font-weight: 600; padding-top: 30px;">상품정보</h4>      	
	        </div>
	        <br>
	        <div>${productVO.pro_content }</div><br>
		  </div>		  
	  </div>	  
      <form id="actionForm" action="" method="get">
        <!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
        
        <!-- Criteria클래스가 기본생성자에 의하여 기본값으로 파라미터가 사용 -->
        
        <c:if test="${type == 'Y' }">
        <input type="hidden" name="pageNum" value="${cri.pageNum}">
        <input type="hidden" name="amount" value="${cri.amount}">
        </c:if>
        
        <input type="hidden" name="cate_code" value="${cate_code}">
			  <!-- 상품코드 동적추가작업 -->
			  
		 
   	 </form>
   	 
   	 
       	
      
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>
	
	<%--
	// 상품문의
	let getProductReview = function(){
	  $("#product_review").load("/review/productReview?pro_num=" + ${productVO.pro_num });
	}
	
	getProductReview();    
    --%>
	
	// 상품관련
    $(function(){
    	
    	$("#productInqu").on("click", function(){
    		
    		let pro_num = $(this).data("pro_num");
    		
	  		location.href = "/review/productReview?pro_num=" + pro_num;
	  		
	  	});
    	  
    	let actionForm = $("#actionForm");
    	  
    	// 로그인 이전
    	// 찜상품 담기
    	$("button[name='btnCartSoon']").on("click", function(){ 
    		
    		location.href = "/customer/login";
        });
    	
    	// 주문하기
    	$("button[name='btnBuySoon']").on("click", function(){ 
    		
    		location.href = "/customer/login";
        });
    	
    	
    	// 로그인 이후
    	// 찜상품 담기
        $("button[name='btnCart']").on("click", function(){        	 
        	  
            let pro_num = $(this).parents("div.row").find("input[name='pro_num']").val();
            let cate_code = $(this).parents(".parentDetail").find("input[name='cate_code']").val();
            
            $.ajax({
               url: '/cart/cartAdd',
               type: 'post',
               dataType: 'text',
               data: {pro_num: ${productVO.pro_num } },
               success: function(data) {
                 if(data == "success") {   
              	   if(confirm("찜상품에 추가되었습니다. \n 지금 확인하시겠습니까?")){
              		   location.href = "/cart/mycart?pro_num=" + $(this).attr("href") + "&cate_code=" + cate_code + "&type=N";               		   
              	   }                                          
                 }
               }
            });
        });  
    	
    	// 로그인 이후    	
        // 주문하기
        $("button[name='btnBuy']").on("click", function(){       	
        	
            let pro_num = $(this).parents("div.row").find("input[name='pro_num']").val();
            
            location.href = "/order/orderInfo?type=direct&pro_num="+ pro_num;
  
        });
        
     	// 상품문의 등록
        $("#product_review").on("click", "#btnReview", function() {
          console.log("상품문의 클릭");
          
          let pro_num = $(this).data("pro_num");
          
          $.ajax({
            url: '/review/productReviewWrite',
            type:'post',
            dataType: 'text',
            data:  {
              pro_num : ${productVO.pro_num}, 
              rew_content : $("#reviewContent").val()              
            },
            success: function(data){
              if(data == "success") {
                alert("상품문의 등록완료");
                //location.href = "/customer/product/productDetail";
                getProductReview();
              }
            }
          });
        });
     	
      	//상품문의수정
        $("#product_review").on("click", "#btnReviewEdit", function(){
        	        	
        	$("#btnReviewAdd").show(); // 상품문의등록버튼 보이기
        	$("#btnReviewEdit").hide(); // 상품문의수정버튼 숨기기
        	
        	console.log($("#reviewContent").val());
        	
        	$.ajax({
                url: '/review/productReviewEdit',
                type:'post',
                dataType: 'text',
                data:  {
                  rew_num : $("#reviewNum").val(),
                  pro_num : ${productVO.pro_num }, 
                  rew_content : $("#reviewContent").val()
                },
                success: function(data){
                  if(data == "success") {
                    alert("상품문의 수정완료");
                    //getProductReview();
                    reviewLoad();
                  }
                }
              });
        });


        // 리뷰목록수정버튼
        $("#product_review").on("click", "button[name='btnReviewEditModal']", function(){
          //console.log("상품후기 클릭");

          $("#btnReviewAdd").show(); // 상품후기등록버튼 보이기
          $("#btnReviewEdit").hide(); // 상품후기수정버튼 숨기기

          console.log($("#reviewContent").val());
          
          //리뷰 번호
          let rew_num = $(this).parent().parent().find("[name='rew_num']").val();
          $("#reviewNum").val(rew_num);

          // 리뷰 별점
          /*
          let rew_score = $(this).parent().parent().find("[name='rew_score']").val();
          $("#reviewScore").val(rew_score);
          console.log("스코어" + rew_score);
          */

          // 리뷰내용
          let rew_content = $(this).parent().parent().find("[name='rew_content']").val();
          $("#reviewContent").val(rew_content);
          $("#btnReview").text("상품후기 수정");

          // a태그가 5개
          /*
          $("#star_grade a").each(function(index, item){
            if(index<rew_score) {
              $(item).addClass("on");
            }else {
              $(item).removeClass("on");
            }
          });
          */

        });

        // 상품후기 삭제클릭 btnReveiwDelModal
        $("#product_review").on("click", "button[name='btnReviewDelModal']", function(){
          
          //$("#reviewModal").modal("show");

          if(!confirm("상품후기를 삭제하겠습니까?")) return;

          // 리뷰 번호
          let rew_num = $(this).parent().parent().find("[name='rew_num']").val();
          $("#reviewNum").val(rew_num);

          $.ajax({
            url: '/review/productReviewDel',
            type: 'post',
            dataType: 'text',
            data: {
              rew_num : $("#reviewNum").val()
            },
            success: function(data){
              if(data == "success"){
                alert("상품후기가 삭제됨");
                getProductReview();
                pageNum = 1;
                reviewLoad();
              }
            }
          });
          
        });
        
        
        // 상품후기목록 페이지번호 클릭
        let pageNum, pro_num;        
        $("#product_review").on("click", "ul.pagination a.page-link", function(e){
        	e.preventDefault();
        	pro_num = $("#pro_num").val();
        	pageNum = $(this).attr("href");
        	
        	reviewLoad();
        	
        });
        
        let reviewLoad = function() {
        	let reviewForm = $("#reviewForm");
        	let amount = reviewForm.find("input[name=amount]").val();
        	
        	// 상품코드, 페이징정보
        	$("#product_review").load("/review/productReview?pro_num=" + pro_num + "&pageNum" + pageNum + "&amount" + amount);
        }

    });
      
      
	
</script>

    
  </body>
</html>
