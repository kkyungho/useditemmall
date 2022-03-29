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
  		<a title="홈페이지 이동" id="home" href="/" style="color: black;">
  			<img alt="Home" src="/resources/img/home.png" width="15" height="15">&nbsp;HOME
  		</a>  				  	  		  	
	</div>
	<br><br>	
	  <div class="row">		
		<div class="col-sm-5">
      		<img name="productImage" width="120%" height="360" src="/customer/product/displayFile?fileName=<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
      	</div>        

      	<div class="col-sm-1">
      		
      	</div>  
      	    	
      	<div class="col-sm-5">
      		<input type="hidden" name="pro_num" value="${productVO.pro_num }">
      		<input type="hidden" name="cate_code" value="${productVO.cate_code}">
      		<label style="font-size: 1.3em; font-weight: 600; padding-left: 20px;">${productVO.pro_name }</label><br>
      		<label style="font-size: 2.375em; font-weight: 600; padding-left: 20px;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${productVO.pro_price }"/>원</label><br><br>      		
      		<label style="font-size: 1.0em; padding-left: 20px; color: gray;">• 상품상태 &nbsp;${productVO.pro_con }</label><br>
      		<label style="font-size: 1.0em; padding-left: 20px; color: gray;">• 판매자 &nbsp;${productVO.hmal_id }</label><br><br>
          <div class="form-row">
            <div class="btn-group" style="padding-left: 20px;">              
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
    	  
    	  //찜상품 담기
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
    	
          //주문하기
          $("button[name='btnBuy']").on("click", function(){
          
            let pro_num = $(this).parents("div.row").find("input[name='pro_num']").val();            

            location.href = "/order/orderInfo?type=direct&pro_num="+ pro_num;
		  
          });

      });
	
    </script>

    
  </body>
</html>
