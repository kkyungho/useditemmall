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

<!-- 주문 -->
<div class="container" style="width: 100%; min-width: 900px; background-color: white; font-size: 16px; padding-top: 10px;">
  <form action="/order/orderAction" method="post" id="orderForm">    
  <div class="row">
  	<h5 style="font-weight: 600;">주문내역</h5><br><br>
	<div class="col-sm-12">   
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
						rowspan="1" colspan="0.5"
						aria-label="Engine version: activate to sort column ascending">상품가격</th>
					
				</tr>
			</thead>
			<tbody>			
				<c:forEach items="${orderInfo }" var="orderInfoVO" varStatus="status">
					<tr role="row"
						class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
						<td>
							<a class="move" href="#">
								<img name="proudctImage" src="/order/displayFile?fileName=s_<c:out value="${orderInfoVO.pro_img }"></c:out>&uploadPath=<c:out value="${orderInfoVO.pro_uploadpath }"></c:out>">
							</a>
						</td>
						<td>							
							<input type="text" value='<c:out value="${orderInfoVO.pro_name }"></c:out>' readonly>
							<input type="hidden" name="orderDetailList[${status.index }].pro_num" value='<c:out value="${orderInfoVO.pro_num }"></c:out>'>
						</td>												
						<td>
							<input type="text" style="width: 30%;" class="order_price" name="orderDetailList[${status.index }].dt_price" value='<c:out value="${orderInfoVO.orderprice }"></c:out>' readonly>원							
						</td>
						
					</tr>
				</c:forEach>
					<tr>
						<td colspan="6">주문 총합계 : <input type="text" name="ord_price" style="width: 10%;" readonly>원</td>
					</tr>			
			</tbody>

		</table>
	</div>
	</div>
  <br><br>
  <h5 style="font-weight: 600;">주문자정보</h5><hr>  
  <div class="form-row">
    <div class="col-md-2">
	    <label for="hmal_name">이름</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 200px; display: inline-block;" id="hmal_name" name="hmal_name" value="${sessionScope.loginStatus.hmal_name}" readonly>
	</div>	
	<div class="col-md-2">
	    <label for="hmal_email">이메일</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 200px; display: inline-block;" id="hmal_email" name="hmal_email" value="${sessionScope.loginStatus.hmal_email}" readonly>	    
	</div>
	<div class="col-md-2">
	    <label for="hmal_phone">연락처</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 200px; display: inline-block;" id="hmal_phone" name="hmal_phone" value="${sessionScope.loginStatus.hmal_phone}" readonly>
	</div>
	<div class="col-md-2">
	    <label for="hmal_addr">주소</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 300px; display: inline-block;" id="hmal_addr" name="hmal_addr" value="${sessionScope.loginStatus.hmal_addr}" readonly> -
	    <input type="text" style="width: 200px; display: inline-block;" id="hmal_deaddr" name="hmal_deaddr" value="${sessionScope.loginStatus.hmal_deaddr}" readonly>
	        우편번호
	    <input type="text" style="width: 200px; display: inline-block;" id="hmal_zipcode" name="hmal_zipcode" value="${sessionScope.loginStatus.hmal_zipcode}" readonly>
	</div>
  </div>
  <br><br>
  <h5 style="font-weight: 600;">배송 정보</h5>
  <input type="checkbox" id="orderInfoCopy">위정보와 같음  
  <hr>
  <div class="form-row">
    <div class="col-md-2">
	    <label for="ord_name">이름</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 200px; display: inline-block;" id="ord_name" name="ord_name">
	</div>
	<div class="col-md-2">
	    <label for="ord_tel">연락처</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 200px; display: inline-block;" id="ord_tel" name="ord_tel">
	</div>
	<div class="col-md-2">
	    <label for="haml_addr">주소</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 300px; display: inline-block;" id="ord_addr_basic" name="ord_addr_basic"> -
	    <input type="text" style="width: 200px" id="ord_addr_detail" name="ord_addr_detail">
	    	우편번호
	    <input type="text" style="width: 200px" id="ord_zipcode" name="ord_zipcode">
	</div>
	<div class="col-md-2">
	    <label for="ord_message">배송메세지<br>(100자내외)</label>
	</div>
	<div class="col-md-10">
	    <textarea rows="3" style="width: 50%" name="ord_message" id="ord_message"></textarea>
	</div>
	<!-- 
	<div class="col-md-2">
	    <label for="ord_depositor">무통장 입금자명</label>
	</div>
	<div class="col-md-10">
	    <input type="text" style="width: 250px" id="ord_depositor" name="ord_depositor">(주문자와 같을경우 생략가능)
	</div>
	 -->
	<br><br>
	<div class="col-md-12" style="text-align: center; padding-top: 20px;">
		<button type="submit" id="btnOrder" name="btnOrder" class="btn btn-outline-dark">주문하기</button>
		<button type="reset" id="btnCancle" name="btnCancle" class="btn btn-danger">취소</button>		
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
         $("#ord_name").val($("#hmal_name").val());
         $("#ord_tel").val($("#hmal_phone").val());

         $("#ord_addr_basic").val($("#hmal_addr").val());
         $("#ord_addr_detail").val($("#hmal_deaddr").val());
         $("#ord_zipcode").val($("#hmal_zipcode").val());
    });
    
    // 주문버튼 클릭시
    $("#btnOrder").on("click", function(){
    	let result = confirm("상품 주문 하시겠습니까?");
    	
    	if(result) {
    		// 유효성 검사
    		let ord_name = $("#ord_name");
    		let ord_tel = $("#ord_tel");    		
    		let ord_addr_basic = $("#ord_addr_basic");
    		let ord_addr_detail = $("#ord_addr_detail");
    		let ord_zipcode = $("#ord_zipcode");
    		
    		if(ord_name.val() == "" || ord_name.val() == null){
				alert("이름을 입력해주세요");
				ord_name.focus();
				return false;
				
			} else if(hmal_phone.val() == "" || hmal_phone.val() == null){
				alert("핸드폰번호를 입력해주세요.");
				hmal_phone.focus();
				return false;
				
			} else if(ord_addr_basic.val() != ord_addr_basic.val()){
				alert("기본주소를 입력해주세요");
				ord_addr_basic.focus();
				return false;
	
			} else if(ord_addr_detail.val()== "" || ord_addr_detail.val() == null){
				alert("상세주소를 입력해주세요.");
				ord_addr_detail.focus();
				return false;
				
			} else if(ord_zipcode.val()== "" || ord_zipcode.val() == null){
				alert("우편번호를 입력해주세요.");
				ord_zipcode.focus();
				return false;
				
			} else {
				form.submit();
			}
    	}
    	
    });
    
 	// 취소 버튼 클릭시
	$("#btnCancle").on("click", function(){
		
		let result = confirm("주문을 취소하시겠습니까?");
		if(result){
			location.href="/"; 
		} else{}
	});
    

  });


</script>

   
  </body>
</html>
