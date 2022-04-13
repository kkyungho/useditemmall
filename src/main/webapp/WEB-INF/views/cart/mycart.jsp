<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<h3>내 상점</h3>
	<br>
	<div class="nav">		
		<ul class="nav nav-tabs" id="storelist" role="tablist">
		  <li class="nav-item" id="myproduct_sub" role="presentation">
		    <a class="nav-link " id="myproduct" data-toggle="tab" href="/customer/product/myproduct" 
		    style="color: black; width: 200px; text-align: center; font-weight: 600; border-bottom-color: black;" role="tab" aria-selected="false">상품</a>
		  </li>
		  <li class="nav-item" id="mycart_sub" role="presentation">
		    <a class="nav-link active" id="mycart" data-toggle="tab" href="/cart/mycart" 
		    style="color: black; width: 200px; text-align: center; font-weight: 600; border-top-color: black; border-bottom-color: white; border-left-color: black; border-right-color: black;" role="tab" aria-selected="true">찜&nbsp;&nbsp;&nbsp;<span>${hmal_id }</span></a>		    
		  </li>		  
		</ul>
	</div>	
	<br>	
	<!-- 찜목록 -->
	<!-- 찜상품이 없을 때 -->
	<div class="tab-content" id="nav-tabContent" style="margin-left: 200px;">		
	    <c:if test="${empty mycart}" >
			<tr role="row"
				class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
				<td colspan="6"><img src="/resources/img/productEmpty.png"></td>
			</tr>
		</c:if>
	</div>
	<!-- 찜상품이 있을 때 -->	
	<div class="tab-content" id="nav-tabContent">
		<c:if test="${not empty mycart}">	     
	    <div class="tab-pane fade fade show active" id="mycart" role="tabpanel" aria-labelledby="cart-tab">
	  	<div class="row">
	      <c:forEach items="${mycart }" var="cartListVO" varStatus="status">
	        <div class="col-md-3 parentDetail">
	          <div class="card mb-4">	          	
	          	<a href="${cartListVO.pro_num}" class="proDetail">                  
					<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${cartListVO.pro_img }"></c:out>&uploadPath=<c:out value="${cartListVO.pro_uploadpath }"></c:out>">
				</a>
				<input type="hidden" name="cate_code" value="${cartListVO.cate_code }">
	            <div class="card-body">
	              <p class="card-text">
	              	<a href="${cartListVO.pro_num}" class="proDetail" style="color: black; text-decoration: none;"> 
	              		<c:if test="${fn:length(cartListVO.pro_name) > 13 }">
		           			<c:out value="${fn:substring(cartListVO.pro_name, 0, 13) }"></c:out>...<br>
		           		</c:if>
		           		<c:if test="${fn:length(cartListVO.pro_name) <= 13 }">
		           			<c:out value="${fn:substring(cartListVO.pro_name, 0, 13) }"></c:out><br>
		           		</c:if>
	              	</a>
	              	<label style="font-size: 1.100em; font-weight: bold;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${cartListVO.pro_price }" />원</label>
	              	<input type="hidden" name="pro_num" value="${cartListVO.pro_num }">
	              </p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" name="btnBuy" class="btn btn-sm btn-outline-secondary" data-pro_num='<c:out value="${cartListVO.pro_num }"></c:out>'>구매</button>&nbsp;
	                  <button type="button" name="btnEmtpy" class="btn btn-sm btn-outline-danger" data-cart_code='<c:out value="${cartListVO.cart_code }"></c:out>'>찜삭제</button>&nbsp;                                    
	                </div>                
	              </div>	               
	            </div>
	          </div>
	        </div>
	       </c:forEach> 
	      </div>
	  </div>	
	  </c:if>  	  
	</div>
	
            
		   
		
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>
  
  $(function(){	  
	  
	  $("#myproduct").on("click", function(){
		 
		  location.href = "/customer/product/myproduct";
	  });	    
  	  
	  // 삭제버튼 클릭시
	  $("button[name='btnEmtpy']").on("click", function(){  	
	  			  		
	  	let cart_code = $(this).data("cart_code");
	  	location.href = "/cart/cartEmpty?cart_code=" + cart_code;	  		
	  				
			
	  });
	  
	  // 구매버튼 클릭시
	  $("button[name='btnBuy']").on("click", function(){
		  
		  let pro_num = $(this).data("pro_num");
		 
		  location.href = "/order/orderInfo?type=cart_order&pro_num="+ pro_num;
	  });
	  	
	  // 상세페이지 이동
	  $("a.proDetail").on("click", function(e){
	     e.preventDefault();
	     
	     let cate_code = $(this).parents(".parentDetail").find("input[name='cate_code']").val();
	     console.log("카테고리: " + cate_code);
	        
	     location.href = "/customer/product/productDetail?pro_num=" + $(this).attr("href") + "&cate_code=" + cate_code + "&type=N";
	     	
	   }); 
	  	
  });

</script>

    
  </body>
</html>
