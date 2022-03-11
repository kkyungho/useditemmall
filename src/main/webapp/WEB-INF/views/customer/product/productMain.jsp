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

    

    <!-- Bootstrap core CSS -->
        
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    
    
  </head>
  <body>
  
    
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
<!-- 카테고리정보 -->
<%@include file="/WEB-INF/views/include/category.jsp" %>
<br>
<div class="container">
	<!-- 핸드폰(phone(1)) -->
	<div class="row">
      	<c:forEach items="${phoneProductList}" var="phoneProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${phoneProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${phoneProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${phoneProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${phoneProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${phoneProductVO.pro_num}" class="proDetail">
                  <c:out value="${phoneProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" currencyCode="KRW" value="${phoneProductVO.pro_price }"/>
              	<input type="hidden" name="pro_num" value="${phoneProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${phoneProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 가구(furniture(2)) -->
	<div class="row">
      	<c:forEach items="${furnitureProductList}" var="furnitureProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${furnitureProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${furnitureProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${furnitureProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${furnitureProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${furnitureProductVO.pro_num}" class="proDetail">
                  <c:out value="${furnitureProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${furnitureProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${furnitureProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${furnitureProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 문구(stationery(3)) -->
	<div class="row">
      	<c:forEach items="${stationeryProductList}" var="stationeryProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${stationeryProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${stationeryProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${stationeryProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${stationeryProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${stationeryProductVO.pro_num}" class="proDetail">
                  <c:out value="${stationeryProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${stationeryProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${stationeryProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${stationeryProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 컴퓨터(computer(4)) -->
	<div class="row">
      	<c:forEach items="${computerProductList}" var="computerProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${computerProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${computerProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${computerProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${computerProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${computerProductVO.pro_num}" class="proDetail">
                  <c:out value="${computerProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${computerProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${computerProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${computerProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 생활(life(5)) -->
	<div class="row">
      	<c:forEach items="${lifeProductList}" var="lifeProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${lifeProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${lifeProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${lifeProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${lifeProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${lifeProductVO.pro_num}" class="proDetail">
                  <c:out value="${lifeProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${lifeProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${lifeProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${lifeProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 피규어(figure(6)) -->
	<div class="row">
      	<c:forEach items="${figureProductList}" var="figureProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${figureProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${figureProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${figureProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${figureProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${figureProductVO.pro_num}" class="proDetail">
                  <c:out value="${figureProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${figureProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${figureProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${figureProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 카메라(camera(7)) -->
	<div class="row">
      	<c:forEach items="${cameraProductList}" var="cameraProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${cameraProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${cameraProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${cameraProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${cameraProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${phoneProductVO.pro_num}" class="proDetail">
                  <c:out value="${cameraProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${cameraProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${cameraProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${cameraProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 게임(game(8)) -->
	<div class="row">
      	<c:forEach items="${gameProductList}" var="gameProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${gameProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${gameProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${gameProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${gameProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${gameProductVO.pro_num}" class="proDetail">
                  <c:out value="${gameProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${gameProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${gameProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${gameProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 가전(homeapp(9)) -->
	<div class="row">
      	<c:forEach items="${homeappProductList}" var="homeappProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${homeappProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${homeappProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${homeappProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${homeappProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${homeappProductVO.pro_num}" class="proDetail">
                  <c:out value="${homeappProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${homeappProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${homeappProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${homeappProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 여성의류(womensw(10)) -->
	<div class="row">
      	<c:forEach items="${womenswProductList}" var="womenswProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${womenswProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${womenswProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${womenswProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${womenswProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${womenswProductVO.pro_num}" class="proDetail">
                  <c:out value="${womenswProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${womenswProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${womenswProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${womenswProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 남성의류(mensw(11)) -->
	<div class="row">
      	<c:forEach items="${menswProductList}" var="menswProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${phoneProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${menswProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${menswProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${menswProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${menswProductVO.pro_num}" class="proDetail">
                  <c:out value="${menswProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${menswProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${menswProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${menswProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 신발/가방(shoesbag(12)) -->
	<div class="row">
      	<c:forEach items="${shoesbagProductList}" var="shoesbagProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${shoesbagProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${shoesbagProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${shoesbagProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${shoesbagProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${shoesbagProductVO.pro_num}" class="proDetail">
                  <c:out value="${shoesbagProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${shoesbagProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${shoesbagProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${shoesbagProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 도서(book(13)) -->
	<div class="row">
      	<c:forEach items="${bookProductList}" var="bookProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${bookProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${bookProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${bookProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${bookProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${bookProductVO.pro_num}" class="proDetail">
                  <c:out value="${bookProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${bookProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${bookProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${bookProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>
    <!-- 스포츠(sports(14)) -->
	<div class="row">
      	<c:forEach items="${sportsProductList}" var="sportsProductVO">
        <div class="col-md-3 parentDetail">
          <div class="card mb-4">
            <a href="${sportsProductVO.pro_num}" class="proDetail">
				<img name="productImage" width="100%" height="180" src="/customer/product/displayFile?fileName=s_<c:out value="${sportsProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${sportsProductVO.pro_uploadpath }"></c:out>">
			</a>
			<input type="hidden" name="cate_code" value="${sportsProductVO.cate_code}">
            <div class="card-body">
              <p class="card-text">
                <a href="${sportsProductVO.pro_num}" class="proDetail">
                  <c:out value="${sportsProductVO.pro_name }"></c:out><br>
                </a>
                <br>
              	<fmt:formatNumber type="currency" value="${sportsProductVO.pro_price }" />
              	<input type="hidden" name="pro_num" value="${sportsProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">              
                <small class="text-muted">${sportsProductVO.pro_uploadpath }</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    </div>

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

	$(function(){
		
		$("a.proDetail").on("click", function(e){
			e.preventDefault();
			
			let cate_code = $(this).parents(".parentDetail").find("input[name='cate_code']").val();
			console.log("카테고리: " + cate_code);
			//return;
			location.href = "/customer/product/productDetail?pro_num=" + $(this).attr("href") + "&cate_code=" + cate_code + "&type=N";
			
		});
		
	});
</script>

    
  </body>
</html>
