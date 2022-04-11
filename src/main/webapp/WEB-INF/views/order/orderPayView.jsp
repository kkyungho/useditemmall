<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>    
  	<meta charset="utf-8"> 
    <title>중고거래의 시작, H중고마켓</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
    
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
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
  
  <h5>결제하기</h5>
  <div class="row">
	<div class="col-sm-12">
   		<img src="/resources/img/payment_icon_yellow_medium.png" id="btn_kakaopay" style="cursor:pointer;">
  	</div>
  </div>  
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>


<script>
  
//카카오결제
	$(function(){
		
		//카카오페이결제
		$("#btn_kakaopay").click(function () {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp79205988'); 
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
			IMP.request_pay({
				pg: 'kakaopay',
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				/* 
				 *  merchant_uid에 경우 
				 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name: '${pro_name}',//'주문명 : 아메리카노',
				// 결제창에서 보여질 이름
				// name: '주문명 : ${auction.a_title}',
				// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
				amount: ${order.ord_price},
				// amount: ${bid.b_bid},
				// 가격 
				buyer_name: '${order.ord_name}',
				// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
				// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
				buyer_postcode: '${order.ord_zipcode}',
				}, function (rsp) {
					console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '결제 금액 : ' + rsp.paid_amount;
					// success.submit();
					// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
					// 자세한 설명은 구글링으로 보시는게 좋습니다.
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
		/*
		$("#btn_kakaopay2").click(function(){
			
			// 필수입력값을 확인.
			var name = $("#form-payment input[name='pay-name']").val();
			var tel = $("#form-payment input[name='pay-tel']").val();
			var email = $("#form-payment input[name='pay-email']").val();
			
			if(name == ""){
				$("#form-payment input[name='pay-name']").focus();
			}
			if(tel == ""){
				$("#form-payment input[name='pay-tel']").focus();
			}
			if(email == ""){
				$("#form-payment input[name='pay-email']").focus();
			}
			
			// 결제 정보를 form에 저장한다.
			let totalPayPrice = parseInt($("#total-pay-price").text().replace(/,/g,''));
			let totalPrice = parseInt($("#total-price").text().replace(/,/g,''));
			let discountPrice = totalPrice - totalPayPrice; 
			let usePoint = $("#point-use").val();
			let useUserCouponNo = $(":radio[name='userCoupon']:checked").val();
			
			// 카카오페이 결제전송
			$.ajax({
				type:'get'
				,url:'/order/pay'
				,data:{
					total_amount: totalPayPrice
					,payUserName: name
					,sumPrice:totalPrice
					,discountPrice:discountPrice
					,totalPrice:totalPayPrice
					,tel:tel
					,email:email
					,usePoint:usePoint
					,useCouponNo:useUserCouponNo	
					
				},
				success:function(response){
					location.href = response.next_redirect_pc_url;		
				}
			});
		});
		*/
	});
  </script>
  </body>
  
  
</html>
