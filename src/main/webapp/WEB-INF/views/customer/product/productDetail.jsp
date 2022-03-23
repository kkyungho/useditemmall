<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>Hmarket</title>

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
<div class="container">
	<div class="container">	  	
  		<a title="홈페이지 이동" id="home" href="/" style="color: black;">
  			<img alt="Home" src="/resources/img/home.png" width="15" height="15">&nbsp;HOME
  		</a>  				  	  		  	
	  </div>
	  <br>	
	<div class="row">
		<div class="swiper-wrapper parentDetail"
      	style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
      	<div class="swiper-slide thumbnail_wrapper swiper-slide-active"
			style="width: 418px;">
			<div class="badeagle">
				<div class="centered">
					<img name="productImage" width="120%" height="300" src="/customer/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
				</div>
			</div>
		</div>
      </div>
		<!-- 
		<div class="col-sm-6">
      		<img name="productImage" width="100%" height="225" src="/customer/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
      	</div>
      	 -->
        

      	<div class="col-sm-2">
      		
      	</div>  
      	    	
      	<div class="col-sm-5">
      		<input type="hidden" name="pro_num" value="${productVO.pro_num }">
      		<label style="font-size: 1.375em;">${productVO.pro_name }</label><br>
      		<label style="font-size: 2.375em; font-weight: bold;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${productVO.pro_price }"/>원</label><br><br>      		
      		<label style="font-size: 1.1em;"> 상품상태 &nbsp;&nbsp; ${productVO.pro_con }</label><br><br>
          <div class="form-row">
            <div class="btn-group">              
              <button type="button" name="btnCart" class="btn btn-light" style="font-size: 20px;">찜하기</button>&nbsp;              
              <button type="button" name="btnBuy" class="btn btn-warning" style="font-size: 20px;">바로구매</button>&nbsp;
            </div>                        
          </div>
      	</div> 
      </div>
      <br><br>
      <div class="form-row">
      	<h4 style="font-size: 1.875em;">상품정보</h4>      	
      </div>
      <br>
      <div>${productVO.pro_content }</div>	 
      
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
	
      $(function(){
    	  
    	  let actionForm = $("#actionForm");
    	  
    	  //장바구니 담기
          $("button[name='btnCart']").on("click", function(){
              
              let pro_num = $(this).parents("div.row").find("input[name='pro_num']").val();
               
              $.ajax({
                 url: '/cart/cartAdd',
                 type: 'post',
                 dataType: 'text',
                 data: {pro_num: ${productVO.pro_num } },
                 success: function(data) {
                   if(data == "success") {   
                	   if(confirm("찜상품에 추가되었습니다. \n 지금 확인하시겠습니까?")){
                		   location.href = "/cart/mycart?pro_num=" + pro_num;                		   
                	   }                                          
                   }
                 }
              });
          });         
    	
          //주문하기
          $("button[name='btnBuy']").on("click", function(){
          
            let pro_num = $(this).parents("div.row").find("input[name='pro_num']").val();
          
            console.log("상품코드" + pro_num);
          
		  
            $.ajax({
              url:'/order/buy',
              type: 'post',
              dataType: 'text',
              data: {pro_num: ${productVO.pro_num}, cart_amount: $("#pro_amount").val()},
              success: function(data) {
                if(data == "success") {
                  if(confirm("장바구니에 추가되었습니다.\n 지금 확인하겠습니까?")){
                    location.href = "/cart/cartList";
                  }
                }
              }
            });
		  
          });

      });
	
    </script>

    
  </body>
</html>
