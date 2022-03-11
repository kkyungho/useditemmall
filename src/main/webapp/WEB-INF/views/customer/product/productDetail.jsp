<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Hmarket</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">   
    
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
           
    
  </head>

  <body>
    
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!-- 카테고리정보 -->
<%@include file="/WEB-INF/views/include/category.jsp" %>
<br>
<div class="container">
	<h3 style="font-size: 1.875em;">상품상세</h3>
	<div class="row">
		<div class="swiper-wrapper"
      	style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
      	<div class="swiper-slide thumbnail_wrapper swiper-slide-active"
			style="width: 418px;">
			<div class="badeagle">
				<div class="centered">
					<img name="proudctImage" width="100%" height="225" src="/customer/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
				</div>
			</div>
		</div>
      </div>
		<!-- 
		<div class="col-sm-6">
      		<img name="productImage" width="100%" height="225" src="/customer/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
      	</div>
      	 -->
        <div class="col-sm-2"></div>

      	<div class="col-sm-2">
      		상품명<br><br>
      		판매가격<br><br>
      		주문수량<br><br>
      	</div>      	
      	<div class="col-sm-2">
      		${productVO.pro_name }<br><br>
      		${productVO.pro_price }<br><br>
      		<input type="number" name="pro_amount" value="1"><br><br>
          <div class="d-flex justify-content-between align-items-center">
            <div class="btn-group">
              <button type="button" name="btnBuyAdd" style="size: 30px;" class="btn btn-sm btn-warning">바로구매</button>&nbsp;
              <button type="button" name="btnCartAdd" class="btn btn-sm btn-light">찜하기</button>&nbsp;
              <button type="button" name="btnCartList" class="btn btn-sm btn-secondary">상품목록</button>&nbsp;
            </div>              
          </div>
      	</div> 
      </div>
      <br><br>
      <div class="row">
      	<h4 style="font-size: 1.875em;">상세설명</h4>      	
      </div>
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
