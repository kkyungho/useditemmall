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
	  <div class="container">	  	
  		<a title="홈페이지 이동" id="home" href="/" style="color: black;">
  			<img alt="Home" src="/resources/img/home.png" width="15" height="15">&nbsp;HOME
  		</a>  				  	  		  	
	  </div>
	  <br>
	  <!-- 검색상품이 없을 때 -->
      <div class="container" style="margin-left: 400px;">	      
	      <c:if test="${empty list}">
			<tr role="row"
				class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
				<td colspan="6"><b>판매중인 상품이 없습니다. 검색어를 변경해 보세요.</b></td>
			</tr>
		  </c:if>
	  </div>
	  <!-- 검색된 상품이 있을때 -->	  
      <div class="row">
      <c:if test="${not empty list}">
      <c:forEach items="${list }" var="productVO" varStatus="status">
        <div class="col-md-3">
          <div class="card mb-4">
          	<a href="${productVO.pro_num}" class="proDetail">                  
				<img name="productImage" width="100%" height="225" src="/customer/product/displayFile?fileName=s_<c:out value="${productVO.pro_img }"></c:out>&uploadPath=<c:out value="${productVO.pro_uploadpath }"></c:out>">
			</a>
            <div class="card-body">
              <p class="card-text">
              	<a href="${productVO.pro_num}" class="proDetail" style="color: black; 
              	text-decoration: none;"> 
              		<c:if test="${fn:length(productVO.pro_name) > 13 }">
              			<c:out value="${fn:substring(productVO.pro_name, 0, 13) }"></c:out>...<br>
              		</c:if>
              		<c:if test="${fn:length(productVO.pro_name) <= 13 }">
              			<c:out value="${fn:substring(productVO.pro_name, 0, 13) }"></c:out><br>
              		</c:if>
              	</a>
              	<label style="font-size: 1.100em; font-weight: bold;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${productVO.pro_price }" />원</label>
              	<input type="hidden" name="pro_num" value="${productVO.pro_num }">
              </p>              
              
            </div>
          </div>
        </div>
       </c:forEach>
       </c:if>        
      </div>   
      
	 <!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
	 <form id="actionForm" action="/customer/product/productList" method="get">
		<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="cate_code" value="${cate_code}">
		<!-- 검색파라미터 -->
		<!-- <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> -->
     <!--글번호추가-->			
	 </form>   
		
<%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

    <script>
	
      $(function(){
        
        let actionForm = $("#actionForm");
		//페이지번호 클릭시 : 선택한 페이지번호, 페이징정보, 검색정보
		$(".page-item a").on("click", function(e){
			e.preventDefault(); // <a href="">기능취소
			//기존 페이지번호를 사용자가 선택한 페이지번호로 변경
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();

		});
        
        // 상세페이지 이동
        $("a.proDetail").on("click", function(e){
        	e.preventDefault();
        	let pro_num = $(this).attr("href");
        	actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
        	actionForm.attr("action", "/customer/product/productDetail");
        	actionForm.submit();
        });

      });
	
    </script>

    
  </body>
</html>
