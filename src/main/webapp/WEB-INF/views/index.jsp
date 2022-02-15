<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <!-- <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"> -->
    <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <!-- <link href="pricing.css" rel="stylesheet"> -->
  </head>
  <body>
  <script>
  	
  	let msg = '${msg}';
  	if(msg == 'alterUserOk'){
  		alert("회원정보가 수정됨");
  	}
  </script>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Hmarket</h1>
  <p class="lead">중고거래 마켓</p>
</div>

<div class="container">
  <div class="card-deck mb-3 text-center">
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal"></h4>
      </div>
      <div class="card-body">
        <h1 class="card-title pricing-card-title"> <small class="text-muted"></small></h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
        <button type="button" class="btn btn-lg btn-block btn-outline-primary"></button>
      </div>
    </div>
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal"></h4>
      </div>
      <div class="card-body">
        <h1 class="card-title pricing-card-title"> <small class="text-muted"></small></h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
        <button type="button" class="btn btn-lg btn-block btn-primary"></button>
      </div>
    </div>
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal"></h4>
      </div>
      <div class="card-body">
        <h1 class="card-title pricing-card-title"> <small class="text-muted"></small></h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
        <button type="button" class="btn btn-lg btn-block btn-primary"></button>
      </div>
    </div>
  </div>

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>


    
  </body>
</html>
