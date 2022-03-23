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
	              		<c:out value="${productVO.pro_name }"></c:out><br>
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
	  
<script>

  $(function(){
	  
	  	// 수정버튼 클릭시
	    $("button[name='btnModify']").on("click", function(){ 
	    	
	      let pro_num = $(this).data("pro_num");	
      	  location.href = "/customer/product/productModify?pro_num=" + pro_num;
        });
	  	
	  	// 삭제버튼 클릭시
	  	$("button[name='btnDelete']").on("click", function(){
	  			  		
	  		if(!confirm("상품을 삭제하시겠습니까?")) return;
	  			  		
	  		let pro_num = $(this).data("pro_num");
	  		location.href = "/customer/product/productMain";	  		
	  				
			
	  	});
	  	
	 	// 상세페이지 이동
	    $("a.proDetail").on("click", function(e){
	     	e.preventDefault();
	     	/*
	     	let pro_num = $(this).attr("href");
	     	actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
	     	actionForm.attr("action", "/customer/product/productDetail");
	     	actionForm.submit();
	     	*/
	     	let cate_code = $(this).parents(".parentDetail").find("input[name='cate_code']").val();
	        console.log("카테고리: " + cate_code);
	        
	        location.href = "/customer/product/productDetail?pro_num=" + $(this).attr("href") + "&cate_code=" + cate_code + "&type=N";
	     	
	     }); 
	  	
  });

</script>
</body>
</html>