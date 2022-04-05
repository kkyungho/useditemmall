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
		    <a class="nav-link active" id="myproduct" data-toggle="tab" href="/customer/product/myproduct" style="color: black;" role="tab" aria-selected="true">판매상품</a>
		  </li>
		  <li class="nav-item" id="mycart_sub" role="presentation">
		    <a class="nav-link " id="mycart" data-toggle="tab" href="/cart/mycart" style="color: black;" role="tab" aria-selected="false">찜상품</a>		    
		  </li>		  
		</ul>
	</div>	
	<br>	
	<div class="tab-content" id="nav-tabContent">
	  <!-- 판매상품 -->	    
	  <div class="tab-pane fade show active" id="product" role="tabpanel" aria-labelledby="product-tab">
	  	<div class="row">
	      <c:forEach items="${myproduct }" var="productVO" varStatus="status">
	        <div class="col-md-3 parentDetail">
	          <div class="card mb-4">
	          	<a href="${productVO.pro_num}" class="proDetail">                  
					<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
				</a>
				<input type="hidden" name="cate_code" value="${productVO.cate_code }">
	            <div class="card-body">
	              <p class="card-text">
	              	<a href="${productVO.pro_num}" class="proDetail" style="color: black; text-decoration: none;"> 
	              		<c:if test="${fn:length(productVO.pro_name) > 13 }">
		           			<c:out value="${fn:substring(productVO.pro_name, 0, 13) }"></c:out>...<br>
		           		</c:if>
		           		<c:if test="${fn:length(productVO.pro_name) <= 13 }">
		           			<c:out value="${fn:substring(productVO.pro_name, 0, 13) }"></c:out><br>
		           		</c:if><br>
	              	</a>
	              	<label style="font-size: 1.100em; font-weight: bold;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${productVO.pro_price }" />원</label>
	              	<input type="hidden" name="pro_num" value="${productVO.pro_num }">
	              </p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" name="btnModify" class="btn btn-sm btn-outline-secondary" data-pro_num='<c:out value="${productVO.pro_num }"></c:out>'>수정</button>&nbsp;
	                  <button type="button" name="btnDelete" class="btn btn-sm btn-outline-danger" data-pro_num='<c:out value="${productVO.pro_num }"></c:out>'>삭제</button>&nbsp;                  
	                </div>                
	              </div> 
	            </div>
	          </div>
	        </div>
	       </c:forEach> 
	      </div>
	  	</div>
	</div>
	
            
		   
		
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>
  
  $(function(){
	  
	  $("#mycart").on("click", function(){
		 
		  location.href = "/cart/mycart";
	  });
	    
  	  // 수정버튼 클릭시
      $("button[name='btnModify']").on("click", function(){ 
    	
        let pro_num = $(this).data("pro_num");	
   	    location.href = "/customer/product/productModify?pro_num=" + pro_num;
   	    
      });
	  	
	  // 삭제버튼 클릭시
	  $("button[name='btnDelete']").on("click", function(){
	  			  		
	  	if(!confirm("상품을 삭제하시겠습니까?")) return;
	  			  		
	  	let pro_num = $(this).data("pro_num");
	  	location.href = "/customer/product/productDelete?pro_num=" + pro_num;	  		
	  				
			
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
