<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>우측 퀵메뉴</title>
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

ul, li {
	list-style: none;
}

#side_menu {
	position: fixed;
	top: 0;
	right: -237px;
	z-index: 9999;
	height: 100%;
	background: #fff
}

.side_menu_wr {
	width: 236px;
	overflow-y: auto;
	height: 100%;
	border-left: 1px solid #d6d6d6;
}

#btn_sidemenu {
	position: absolute;
	top: 50%;
	left: -47px;
	width: 39px;
	height: 39px;
	margin-top: -20px;
	background: none;
	border: 0px solid #cdcdcd;
	border-right: 0;
	font-size: 14px
}

.new_side_box_wrap {
	padding: 90px 0px 0px 28px;
}

.new_side_box01 {
	margin-bottom: 10px
}

.new_side_title {
	font-family: 'Lato', sans-serif;
	line-height: 36px;
	border-bottom: 1px solid #414141;
	color: #414141;
	font-size: 12px;
	text-align: left;
	font-weight: bold;
}

.new_side_con01 {
	padding: 22px 0px;
}

.new_side_btn01 {
	display: block;
	width: 182px;
	line-height: 24px;
	text-align: Center;
	margin-left: 0px;
	color: #676767;
	font-size: 10px;
	font-family: 'Lato', sans-serif;
	margin-bottom: 3px;
	border: 1px solid #dedede
}

.new_side_con02 {
	padding: 12px 0px 22px;
}

.new_side_text01 {
	font-size: 13px;
	font-family: 'Lato', sans-serif;;
	line-height: 1.2em;
	color: #181818;
	text-align: left;
	font-weight: bold;
	margin-bottom: 10px
}

.new_side_text02 {
	font-size: 10px;
	font-family: 'Lato', sans-serif;;
	line-height: 1.6em;
	color: #676767;
	text-align: left;
	font-weight: bold;
	margin-bottom: 10px
}

.new_side_text03 {
	font-size: 10px;
	font-family: 'Lato', sans-serif;;
	line-height: 1.2em;
	color: #676767;
	text-align: left;
	font-weight: bold;
}

.new_side_con0201 {
	margin-top: 15px;
}

.new_side_con0201 ul {
	overflow: hidden;
}

.new_side_con0201 ul li {
	float: left;
}

.new_side_con0201 ul li a {
	display: block;
	width: 92px;
	margin: 0px auto;
	text-align: Center;
	border: 1px solid #dedede;
}

.quick_show {
	width: 55px;
	height: 55px;	
	background-image: url("/resources/img/open.png");
}

.quick_close {
	width: 50px;
	height: 50px;
	background-image: url("/resources/img/close.png");
}
</style>
</head>
<body>
	<div id="side_menu" style="right: -237px;">
		<button type="button" id="btn_sidemenu" class="btn_sidemenu_cl">
			<div class="quick_show"></div>
		</button>
		<div class="side_menu_wr">
			<div class="new_side_box_wrap">
				<div class="new_side_box01">
					<div class="new_side_title">QUICK MENU</div>
					<div class="new_side_con01">
						<!-- /board/insert 주소바꾸기 /board/list -->
						<!-- 로그인 이전상태 표시 -->
	    				<c:if test="${sessionScope.loginStatus == null }">
							<a href="/customer/login" class="new_side_btn01" style="color: black; text-decoration: none;">Q&amp;A</a>
							<a href="#"	class="new_side_btn01" style="color: black; text-decoration: none;">검색</a>
						</c:if>						
						<!-- 로그인 이후상태 표시 -->
	    				<c:if test="${sessionScope.loginStatus != null }">
	    					<a href="/board/list" class="new_side_btn01" style="color: black; text-decoration: none;">Q&amp;A</a>
							<a href="#"	class="new_side_btn01" style="color: black; text-decoration: none;">검색</a>
	    				</c:if>
					</div>
				</div>
				<div class="new_side_box02">
					<div class="new_side_title">CS CENTER</div>
					<div class="new_side_con02">
						<p class="new_side_text01">1577-0000</p>
						<p class="new_side_text02">
							MON - FRI <br>AM 09:00 - PM 06:00
						</p>
						<p class="new_side_text02">
							LUNCH<br>PM 12:00 - PM 01:00
						</p>
						<p class="new_side_text03">SAT,SUN,HOLIDAY OFF</p>
						<div class="new_side_con0201">
							<ul>
								<li><a href="#"><img src="/resources/img/side_kakao.jpg" alt=""></a></li>
							</ul>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>

	<script>
		$(function() {
			$(".btn_sidemenu_cl").on("click", function() {
				$(".quick_show").toggleClass("quick_close");

				if ($(".quick_show").hasClass("quick_close")) {
					$("#side_menu").stop().animate({
						"right" : "0"
					});
				} else {
					$("#side_menu").stop().animate({
						"right" : "-237px"
					});
				}

			});
		});
	</script>



</body>
</html>