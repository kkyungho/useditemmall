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
	<div class="row">
		<div class="swiper-wrapper"
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
      		<label style="font-size: 1.375em;">${productVO.pro_name }</label><br>
      		<label style="font-size: 2.375em; font-weight: bold;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${productVO.pro_price }"/>원</label><br><br>      		
      		<label style="font-size: 1.275em;">상품상태 : ${productVO.pro_con }</label><br><br>
          <div class="form-row">
            <div class="btn-group">              
              <button type="button" name="btnCartAdd" class="btn btn-light">찜하기</button>&nbsp;
              <button type="button" name="btnCartList" class="btn btn-secondary">상품목록</button>&nbsp;
              <button type="button" name="btnBuyAdd" class="btn btn-warning">바로구매</button>&nbsp;
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
	  
	  	<c:if test="${type == 'Y' }">
		   	<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">			
		</c:if>
		
			<input type="hidden" name="cate_code" value="${cate_code}">
		<!-- 상품코드 동적 추가작업 -->
	  </form>	
      
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

    <script>
	
      $(function(){

    	let actionForm = $("#actionForm");
    	
        //장바구니 담기
        $("button[name='btnCartAdd']").on("click", function(){
          
          let pro_num = $(this).parents("div.card-body").find("input[name='pro_num']").val();
          
          //console.log("상품코드" + pro_num);

          $.ajax({
            url:'/cart/cartAdd',
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
