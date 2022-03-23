<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hmarket</title>
</head>
<body>
	<div class="tab-pane fade" id="mycart" role="tabpanel" aria-labelledby="cart-tab">
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
	              	<a href="${cartListVO.pro_num}" class="proDetail" style="color: black;"> 
	              		<c:out value="${cartListVO.pro_name }"></c:out><br>
	              	</a>
	              	<label style="font-size: 1.100em; font-weight: bold;"><fmt:formatNumber type="currency" pattern="###,###,###" value="${cartListVO.pro_price }" />원</label>
	              	<input type="hidden" name="pro_num" value="${cartListVO.pro_num }">
	              </p>	               
	            </div>
	          </div>
	        </div>
	       </c:forEach> 
	      </div>
	  </div>
</body>
</html>