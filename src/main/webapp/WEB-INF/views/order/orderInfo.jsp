<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>중고거래의 시작, H중고마켓</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
    
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    	    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
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
<br>

<div class="container">
  
  <h5>주문내역</h5>
  <div class="row">
	<div class="col-sm-12">
   <form action="/order/orderAction" method="post" id="orderForm">
		<table id="example2"
			class="table table-bordered table-hover dataTable"
			role="grid" aria-describedby="example2_info">
			<thead>
				<tr role="row">
					<th class="sorting" tabindex="0" aria-controls="example2"
						rowspan="1" colspan="1"
						aria-label="Browser: activate to sort column ascending">상품이미지</th>
					<th class="sorting" tabindex="0" aria-controls="example2"
						rowspan="1" colspan="1"
						aria-label="Browser: activate to sort column ascending">상품명</th>
					<th class="sorting" tabindex="0" aria-controls="example2"
						rowspan="1" colspan="1"
						aria-label="Engine version: activate to sort column ascending">수량</th>
					<th class="sorting" tabindex="0" aria-controls="example2"
						rowspan="1" colspan="1"
						aria-label="Platform(s): activate to sort column ascending">할인</th>
					<th class="sorting" tabindex="0" aria-controls="example2"
						rowspan="1" colspan="1"
						aria-label="Engine version: activate to sort column ascending">합계</th>
					
				</tr>
			</thead>
			<tbody>
				<%--
				<c:if test="${empty orderInfo}">
					<tr role="row"
						class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td colspan="6">장바구니가 비워있읍니다.</td>
					</tr>
				</c:if>
				 --%>
				
				<c:if test="${not empty orderInfo}">
				<c:forEach items="${orderInfo }" var="orderInfoVO" varStatus="status">
					<tr role="row"
						class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td>
							<a class="move" href="<c:out value="${orderInfoVO.pro_num }"></c:out>">
								<img name="proudctImage" src="/order/displayFile?fileName=s_<c:out value="${orderInfoVO.pro_img }"></c:out>&uploadPath=<c:out value="${orderInfoVO.pro_uploadpath }"></c:out>">
							</a>
						</td>
						<td>
							<input type="text" value='<c:out value="${orderInfoVO.pro_name }"></c:out>' readonly>
							<input type="hidden" name="orderDetailList[${status.index }].pro_num" value='<c:out value="${orderInfoVO.pro_num }"></c:out>'>
						</td>
						<td>
							<input type="text" name="orderDetailList[${status.index }].dt_amount" value='<c:out value="${orderInfoVO.cart_amount }"></c:out>' readonly>
							
						</td>
						<td>
							&nbsp;
						</td>
						
						<td>
								<input type="text" class="order_price" name="orderDetailList[${status.index }].dt_price" value='<c:out value="${orderInfoVO.orderprice }"></c:out>'>
						</td>
						
					</tr>
				</c:forEach>
					<tr>
						<td colspan="6">주문 총합계 : <input type="text" name="ord_price" readonly></td>
					</tr>
					
				</c:if>
			</tbody>

		</table>
	</div>
	</div>
  
  <h5>주문자정보</h5>
  <hr>
  <div class="form-row">
    <div class="col-md-2">
	    <label for="hmal_name">이름</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 500px" id="hmal_name" name="hmal_name" value="${sessionScope.loginStatus.hmal_name}" readonly>
	</div>
	<div class="col-md-2">
	    <label for="hmal_email">이메일</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 500px" id="hmal_email" name="hmal_email" value="${sessionScope.loginStatus.hmal_email}">
	    
	</div>
	<div class="col-md-2">
	    <label for="hmal_phone">연락처</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 500px" id="hmal_phone" name="hmal_phone" value="${sessionScope.loginStatus.hmal_phone}">
	</div>
	<div class="col-md-2">
	    <label for="hmal_addr">주소</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 250px" id="hmal_addr" name="hmal_addr" value="${sessionScope.loginStatus.hmal_addr}"> -
	    <input type="text" style="width: 250px" id="hmal_deaddr" name="hmal_deaddr" value="${sessionScope.loginStatus.hmal_deaddr}">
	        우편번호
	    <input type="text" style="width: 250px" id="hmal_zipcode" name="hmal_zipcode" value="${sessionScope.loginStatus.hmal_zipcode}">
	</div>
  </div>
  <br><br><br>
  <h5>배송 정보</h5>
  <input type="checkbox" id="orderInfoCopy">위정보와 같음
  <hr>
  <div class="form-row">
    <div class="col-md-2">
	    <label for="hmal_name">이름</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 250px" id="ord_name" name="ord_name">
	</div>
	<div class="col-md-2">
	    <label for="haml_phone">연락처</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 250px" id="ord_tel" name="ord_tel">
	</div>
	<div class="col-md-2">
	    <label for="haml_addr">주소</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 250px" id="ord_addr_basic" name="ord_addr_basic"> -
	    <input type="text" style="width: 250px" id="ord_addr_detail" name="ord_addr_detail">
	    	우편번호
	    <input type="text" style="width: 250px" id="ord_zipcode" name="ord_zipcode">
	</div>
	<div class="col-md-2">
	    <label for="ord_message">배송메세지<br>(100자내외)</label>
	</div>
	<div class="col-md-10">
	    <textarea rows="3" style="width: 100%" name="ord_message" id="ord_message"></textarea>
	</div>
	<div class="col-md-2">
	    <label for="mbsp_email">무통장 입금자명</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 250px" id="ord_depositor" name="ord_depositor">(주문자와 같을경우 생략가능)
	</div>
	<div class="col-md-12">
	    <input type="submit" style="width: 250px" value="주문하기">
	    <input type="button" style="width: 250px" value="주문취소">
	</div>
  </div>
</form>
  
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

  $(document).ready(function(){

    // 주문 전체금액
		let orderTotalPrice = function() {

      let totalPrice = 0;
      $(".order_price").each(function(){
        totalPrice += parseInt($(this).val());
      });

      $("input[name=ord_price]").val(totalPrice);

    }

    orderTotalPrice();

    // 주문자정보 복사
    $("#orderInfoCopy").on("click", function(){
         $("#ord_name").val($("#mbsp_name").val());
         $("#ord_tel").val($("#mbsp_phone").val());

         $("#ord_addr_basic").val($("#mbsp_addr").val());
         $("#ord_addr_detail").val($("#mbsp_deaddr").val());
         $("#ord_zipcode").val($("#mbsp_zipcode").val());
    });
    

  });


</script>

   
  </body>
</html>
