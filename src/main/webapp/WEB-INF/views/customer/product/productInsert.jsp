<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>Hmarket</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
	
  <style>	  
  
	  h4{
		  text-align: center;		  
	  }

	  form.insertForm{
		  border: 0.01px solid rgb(235, 235, 235); border-collapse: collapse;
		  padding: 15px;
	  }
	  
	
	  
  </style>  
    
  </head>
  <body>
  
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
<br>
<!-- 카테고리정보 -->
<%@include file="/WEB-INF/views/include/category.jsp" %>
<br>

<div class="container">
	  
  <!-- 판매하기 -->  
  	<div class="container" style="width: 100%; background-color: white; font-size: 16px;">
  		<form class="insertForm" action="/customer/product/productInsert" method="post" id="insertForm" enctype="multipart/form-data">
		  <div class="container" style="width: 900px; padding: 3% 2px;">
		  	<h4>상품 등록</h4>
		  	<br><br>
		  	<div class="form-row">
			    <div class="col-md-2">
			      <label for="pro_img" style="font-weight: 800;">상품이미지</label>
			    </div>
			    <div class="col-md-5">
			      <label for="upload">
			      	<img alt="이미지 업로드" src="/resources/img/camera.png" height="230" width="230" id="previewImage" style="border: 0.01px solid rgb(235, 235, 235); border-collapse: collapse;">			      	
			      </label>
			      <br>			      
			      <b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b>
			    	<br>- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.
			    	<br>- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.
			    	<br>- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.
			    	<br>- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.
			    	<br>최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
			      <input type="file" style="display: none;" id="upload" name="upload" multiple="multiple">
			    </div>			  
			    <div class="col-md-5">
			      <label for="previewImage"></label>
			      <img alt="" src="" id="previewImage">			      		      
			    </div>			    	
			</div>
			<br><br>                 		  	
		  	<div class="form-row">			    
				<div class="col-md-2">
				    <label for="pro_name" style="font-weight: 800;">상품제목</label>									    
				</div>				
				<div class="col-md-9">
					<input type="text" class="form-control" id="pro_name" name="pro_name" placeholder="상품제목을 입력해주세요."
						style="border: 0.01px solid rgb(235, 235, 235); border-collapse: collapse;">
				</div>
			  </div>
			  <br><br>
			  <div class="form-row">
			    <div class="col-md-2">
				    <label for="cate_prt_code" style="font-weight: 800;">카테고리</label>
				</div>
				<div class="col-md-3">
				    <select class="form-control" id="mainCategory" name="cate_prt_code" style="border: 0.01px solid rgb(235, 235, 235); border-collapse: collapse;">
				      <option value="">카테고리</option>				      
				      <c:forEach items="${mainCategory}" var="categoryVO">
				      	<option value="${categoryVO.cate_code }">${categoryVO.cate_name }</option>
				      </c:forEach>					   
				    </select>
				</div>
				<div class="col-md-3">
					<select class="form-control" id="subCategory" name="cate_code" style="border: 0.01px solid rgb(235, 235, 235); border-collapse: collapse;">				      
						<option value="">하위 카테고리</option>										  
				    </select>
				</div>
			  </div>
			  <br><br>
			  <div class="form-row">
			    <div class="col-md-2">
					<label for="pro_price" style="font-weight: 800;">상품가격</label>
				</div>
				<div class="col-md-4">
				    <input type="text" class="form-control" id="pro_price" name="pro_price" placeholder="가격을 입력해주세요."
				    	value="" style="border: 0.01px solid rgb(235, 235, 235); border-collapse: collapse; ime-mode:disabled">				    				    
			    </div><p style="text-align: justify;">원</p>			    			    
			  </div>
			  <br><br>
			   <!-- 상품설명 : CKeditor -->
			   <div class="form-row">
			    <div class="col-md-2">
			      <label for="pro_content" style="font-weight: 800;">상품설명</label>
				</div>
				<div class="col-md-10">
			      <textarea id="pro_content" name="pro_content" rows="10" cols="100" style="border: 0.01px solid rgb(235, 235, 235); border-collapse: collapse;" placeholder="상품 설명을 입력해주세요."></textarea>
			    </div>
			  </div>
			  <br><br>			 
			   <div class="form-row">
			    <div class="col-md-2">
			      <label for="pro_amount" style="font-weight: 800;">재고수량</label>
			    </div>
			    <div class="col-md-4">
			      <input value="1" type="text" class="form-control" id="pro_amount" name="pro_amount">			      
			    </div>
			   	  개
			   </div>		   		 
				<br><br>
				<div class="form-row">
				    <div class="col-md-2">
				      <label for="pro_con" style="font-weight: 800;">상품상태</label>
				    </div>
			    	<div class="col-md-5">
				      <select class="form-control" id="pro_con" name="pro_con">				      	  
				      	  <option value="" hidden=""></option>
					      <option value="새상품">새상품</option>
					      <option value="거의새것">거의새것</option>
					      <option value="중고">중고</option>
					  </select>					   
					</div>					
			    </div>
			    <br><br>
			    <div class="btn-box" style="text-align: center;">
			      <button type="button" id="btnProductInsert" class="btn btn-warning" style="font-size: 20px;">상품등록</button>
			    </div>
			    <br>	    
	  	   </div> 
		</form>	 
	  </div> 
    

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<!-- 상품이미지 미리보기 -->
<script>
  
    function readImage(input) {
      if (input.files && input.files[0]) {
          
        //let imgPath = input.files[0].value;
        let imgPath = $("#upload").val();
        //alert(imgPath);
        //return;
        let ext = imgPath.substring(imgPath.lastIndexOf(".")+1).toLowerCase();
        //alert(ext);
        if(typeof(FileReader) == "undefined") {
          alert("브라우저가 작업을 지원안합니다.");
          return;
        }

        if(ext == "gif" || ext == "png" || ext == "jpg" || ext == "jpeg" ) {
          
          const reader = new FileReader();
          

          //이벤트 설정. reader객체가 이미지파일을 성공적으로 읽어들였을 때 발생하는 이벤트
          reader.onload = (e) => {
              //alert("onload");
              const previewImage = document.getElementById('previewImage');
              previewImage.src = e.target.result;
          }

          // reader객체가 파일을 읽어들이는 작업
          reader.readAsDataURL(input.files[0]);
        }else{
          $("#upload").val("");
          alert("이미지 파일을 선택하세요.");
        }
      }
    }
    // 이벤트 리스너
    document.getElementById('upload').addEventListener('change', (e) => {
        readImage(e.target);
    })

</script>


 
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="subCategoryTemplate" type="text/x-handlebars-template">
  
  <option value="">하위 카테고리</option>
  
  {{#each .}}
  
	<option value="{{cate_code}}">{{cate_name}}</option>
  
  {{/each}}
</script>

<script>

  $(document).ready(function(){

    $("#mainCategory").on("change", function(){

      if($(this).val() == "") {alert("카테고리 선택하세요."); return;}

      let url = "/customer/product/subCategory/" + $(this).val()

      $.getJSON(url, function(data){

        subCategoryBindingView(data, $("#subCategory"), $("#subCategoryTemplate"));

      });

    });

  });


</script>
<script>
  // subCategory: 2차카테고리 데이타
  // target : 2차카테고리 바인딩 결과가 출력될 위치
  // template : 2차카테고리 핸들바템플릿
  let subCategoryBindingView = function(subCategory, target, template) {

    let templateObj = Handlebars.compile(template.html());
    let subCateOptionsResult = templateObj(subCategory);


    //누적되는 증상발생. 처리..
    $("#subCategory option").remove();
    target.append(subCateOptionsResult);

  }

</script>

<!-- 가격 3자리단위마다 쉼표 -->
<!-- 
<script>

	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$("#pro_price").on("keyup", function(e){
		$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});
	
</script>
 -->

<script>
	
	$(document).ready(function(){
		/*
		type="button"  : $("#btnProductInsert").on("click"  ~~
		type="submit"  : $("폼이름").on("submit")
		*/		
		let form = $("#insertForm");

		$("#btnProductInsert").on("click", function(){		
			let result = confirm("상품을 등록하시겠습니까?");
			
			if(result){
				// 유효성검사
				let upload = $("#upload");
				let pro_name = $("#pro_name");
				let mainCategory = $("#mainCategory");
				let subCategory = $("#subCategory");
				let pro_price = $("#pro_price");
				let pro_content = $("#pro_content");				
				let pro_amount = $("#pro_amount");
				let pro_con = $("#pro_con");		
			
				if(upload.val() == "" || upload.val() == null){
					alert("사진을 1장이라도 넣어주세요.");
					upload.focus();
					return;
					
				} else if(pro_name.val() == "" || pro_name.val() == null) {
					alert("상품제목을 입력해주세요.");
					pro_name.focus();
					return;
					
				} else if(mainCategory.val() == "" || mainCategory.val() == null) {
					alert("카테고리를 선택해주세요.");
					mainCategory.focus();
					return;
					
				} else if(subCategory.val() == "" || subCategory.val() == null) {
					alert("하위 카테고리를 선택해주세요.");
					subCategory.focus();
					return;
					
				} else if(pro_price.val() == "" || pro_price.val() == null) {
					alert("가격을 입력해주세요.");
					pro_price.focus();
					return;
					
				} else if(pro_content.val() == "" || pro_content.val() == null) {
					alert("상품내용을 입력해주세요.");
					pro_content.focus();
					return;
					
				} else if(pro_amount.val() == "" || pro_amount.val() == null) {
					alert("재고수량을 입력해주세요.");
					pro_amount.focus();
					return;
					
				} else if(pro_con.val() == "" || pro_con.val() == null) {
					alert("상품상태를 입력해주세요.");
					pro_con.focus();				
					return;
					
				} else {
					form.submit();
				}
			} 			
		});
	});
	
	
</script>



    
  </body>
</html>
