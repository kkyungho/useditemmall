<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	background: #f2f2f2;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="container_wr">



			<h2 class="regi_tt">Join Us</h2>

			<!-- 회원정보 입력/수정 시작 { -->
			<script src="http://moden939.gabia.io/js/jquery.register_form.js"></script>
			<script src="http://moden939.gabia.io/js/certify.js?v=171253"></script>

			<form id="fregisterform" name="fregisterform"
				action="http://moden939.gabia.io/bbs/register_form_update.php"
				onsubmit="return fregisterform_submit(this);" method="post"
				enctype="multipart/form-data" autocomplete="off">
				<input type="hidden" name="w" value=""> 
				<input type="hidden" name="url" value="%2Fbbs%2Fregister_form2.php"> 
				<input type="hidden" name="agree" value="1"> 
				<input type="hidden" name="agree2" value="1"> 
				<input type="hidden" name="cert_type" value=""> 
				<input type="hidden" name="cert_no" value=""> 
				<input type="hidden" name="mb_sex" value="">

				<div id="register_form" class="form_01">
					<h3>
						기본정보 <span class="req">필수입력사항</span>
					</h3>
					<div class="regi_table">
						<table>
							<caption>사이트 이용정보 입력</caption>
							<colgroup>
								<col width="130">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="reg_mb_id" class="req">아이디</label></th>
									<td><input type="text" name="mb_id" value=""
										id="reg_mb_id" required="" class="reg_input" minlength="4"
										maxlength="20" placeholder="영문소문자/숫자, 3~20자."> <span
										id="msg_mb_id" class="reg_msg"></span></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_password" class="req">비밀번호</label></th>
									<td><input type="password" name="mb_password"
										id="reg_mb_password" required="" class="reg_input"
										minlength="3" maxlength="20"></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_password_re"
										class="req">비밀번호 확인</label></th>
									<td><input type="password" name="mb_password_re"
										id="reg_mb_password_re" required="" class="reg_input"
										minlength="3" maxlength="20"> <span id="msg_mb_pw"
										class="reg_msg"></span></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_name" class="req">이름</label></th>
									<td><input type="text" id="reg_mb_name" name="mb_name"
										value="" required="" class="reg_input">

										<button type="button" id="win_hp_cert" class="btn_frmline">휴대폰
											본인확인</button>
										<noscript>본인확인을 위해서는 자바스크립트 사용이 가능해야합니다.</noscript> <span
										class="frm_info">아이핀 본인확인 후에는 이름이 자동 입력되고 휴대폰 본인확인 후에는
											이름과 휴대폰번호가 자동 입력되어 수동으로 입력할수 없게 됩니다.</span></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_nick" class="req">닉네임</label></th>
									<td><input type="hidden" name="mb_nick_default" value="">
										<input type="text" name="mb_nick" value="" id="reg_mb_nick"
										required="" class="reg_input nospace" maxlength="20">
										<span id="msg_mb_nick" class="reg_msg"></span></td>
								</tr>

								<tr>
									<th scope="row"><label for="reg_mb_zip" class="req">주소</label></th>
									<td><input type="text" name="mb_zip" value=""
										id="reg_mb_zip" required="" class="reg_input" maxlength="6"
										placeholder="우편번호">
										<button type="button" class="btn_frmline"
											onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button>
										<br> <input type="text" name="mb_addr1" value=""
										id="reg_mb_addr1" required="" class="reg_input"
										placeholder="기본주소"> <label for="reg_mb_addr1"
										class="sound_only">기본주소<strong> 필수</strong></label><br> <input
										type="text" name="mb_addr2" value="" id="reg_mb_addr2"
										class="reg_input" placeholder="상세주소"> <label
										for="reg_mb_addr2" class="sound_only">상세주소</label><br> <input
										type="text" name="mb_addr3" value="" id="reg_mb_addr3"
										class="reg_input" readonly="readonly" placeholder="참고항목">
										<label for="reg_mb_addr3" class="sound_only">참고항목</label> <input
										type="hidden" name="mb_addr_jibeon" value=""></td>
								</tr>

								<tr>
									<th scope="row"><label for="reg_mb_tel">일반전화</label></th>
									<td>
										<div class="telselect_wrap">
											<select name="tel1" id="tel1" class="reg_input">
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="043">043</option>
												<option value="044">044</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
												<option value="0502">0502</option>
												<option value="0503">0503</option>
												<option value="0504">0504</option>
												<option value="0505">0505</option>
												<option value="0506">0506</option>
												<option value="0507">0507</option>
												<option value="070">070</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> <b>-</b> <input type="text" name="tel2" value="" id="tel2"
												class="reg_input" maxlength="4"> <b>-</b> <input
												type="text" name="tel3" value="" id="tel3" class="reg_input"
												maxlength="4">
										</div> <input type="hidden" name="mb_tel" value="" id="reg_mb_tel">
									</td>
								</tr>

								<tr>
									<th scope="row"><label for="reg_mb_hp" class="req">휴대전화</label></th>
									<td>
										<div class="telselect_wrap">
											<select name="hp1" id="hp1" class="reg_input" required="">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> <b>-</b> <input type="text" name="hp2" value="" id="hp2"
												class="reg_input" maxlength="4" required=""> <b>-</b>
											<input type="text" name="hp3" value="" id="hp3"
												class="reg_input" maxlength="4" required="">
										</div> <input type="hidden" name="mb_hp" value="" id="reg_mb_hp">

										<input type="hidden" name="old_mb_hp" value="">
									</td>

								</tr>

								<tr>
									<th scope="row"><label for="reg_mb_email" class="req">이메일</label></th>
									<td><input type="hidden" name="old_email" value="">

										<div class="emailselect_wrap">
											<input type="text" name="email1" value="" id="email1"
												class="reg_input" maxlength="20" required=""> <b>@</b>
											<input type="text" name="email2" value="" id="email2"
												class="reg_input" maxlength="20" required="" readonly="">
											<select name="email3" id="email3" class="reg_input"
												required="">
												<option value="">선택하세요</option>
												<option value="직">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmail.com">hanmail.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="yahoo.com">yahoo.com</option>
											</select>
										</div> <input type="hidden" name="mb_email" value=""
										id="reg_mb_email"> <span id="msg_mb_email"
										class="reg_msg"></span></td>
								</tr>

								<tr>
									<th scope="row"><label for="">수신여부</label></th>
									<td>
										<ul class="agree_chk">
											<li><span>SMS 수신동의</span>
												<div class="checks">
													<input type="checkbox" name="mb_sms" value="1"
														id="reg_mb_sms" checked=""> <label
														for="reg_mb_sms">동의함</label>
												</div></li>
											<li><span>메일 수신동의</span>
												<div class="checks">
													<input type="checkbox" name="mb_mailling" value="1"
														id="reg_mb_mailling" checked=""> <label
														for="reg_mb_mailling">동의함</label>
												</div></li>
										</ul>
									</td>
								</tr>

								<tr style="display: none;">
									<th scope="row"><label for="">정보공개</label></th>
									<td><input type="hidden" name="mb_open_default" value="">
										<ul class="agree_chk">
											<li>
												<div class="checks">
													<input type="checkbox" name="mb_open" value="1" checked=""
														id="reg_mb_open"> <label for="reg_mb_open">다른분들이
														나의 정보를 볼 수 있도록 합니다.</label>
												</div>
											</li>
										</ul> <span class="frm_info"> 정보공개를 바꾸시면 앞으로 0일 이내에는 변경이
											안됩니다. </span></td>
								</tr>



							</tbody>
						</table>
					</div>

					<div class="regi_table" style="margin-top: 50px;">
						<h3>기타 개인설정</h3>
						<table>
							<caption>기타 개인설정</caption>
							<colgroup>
								<col width="130">
								<col width="*">
							</colgroup>
							<tbody>





								<tr class="is_captcha_use">
									<th scope="row"><label for="">자동등록방지</label></th>
									<td><script>
										var g5_captcha_url = "http://moden939.gabia.io/plugin/kcaptcha";
									</script>
										<script
											src="http://moden939.gabia.io/plugin/kcaptcha/kcaptcha.js"></script>
										<fieldset id="captcha" class="captcha">
											<legend>
												<label for="captcha_key">자동등록방지</label>
											</legend>
											<img
												src="http://moden939.gabia.io/plugin/kcaptcha/kcaptcha_image.php?t=1648448012856"
												alt="" id="captcha_img"><input type="text"
												name="captcha_key" id="captcha_key" required=""
												class="captcha_box required" size="6" maxlength="6">
											<button type="button" id="captcha_mp3">
												<span></span>숫자음성듣기
											</button>
											<button type="button" id="captcha_reload">
												<span></span>새로고침
											</button>
											<span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
										</fieldset></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_confirm">
						<a href="http://moden939.gabia.io" class="btn_cancel">CANCEL</a> <input
							type="submit" value="JOIN" id="btn_submit" class="btn_submit"
							accesskey="s">
					</div>
				</div>


			</form>

			<!-- 유효성검사 -->
			<script
				src="http://moden939.gabia.io/skin/member/basic/register_form.skin2.check.js?v=171253"></script>

			<script>
				$(function() {
					$("#reg_zip_find").css("display", "inline-block");

					// 휴대폰인증
					$("#win_hp_cert")
							.click(
									function() {
										if (!cert_confirm())
											return false;

										certify_win_open("kcp-hp",
												"http://moden939.gabia.io/plugin/kcpcert/kcpcert_form.php");
										return;
									});
				});

				// submit 최종 폼체크
				function fregisterform_submit(f) {
					// 회원아이디 검사
					if (f.w.value == "") {
						var msg = reg_mb_id_check();
						if (msg) {
							alert(msg);
							f.mb_id.select();
							return false;
						}
					}

					if (f.w.value == "") {
						if (f.mb_password.value.length < 3) {
							alert("비밀번호를 3글자 이상 입력하십시오.");
							f.mb_password.focus();
							return false;
						}
					}

					if (f.mb_password.value != f.mb_password_re.value) {
						alert("비밀번호가 같지 않습니다.");
						f.mb_password_re.focus();
						return false;
					}

					if (f.mb_password.value.length > 0) {
						if (f.mb_password_re.value.length < 3) {
							alert("비밀번호를 3글자 이상 입력하십시오.");
							f.mb_password_re.focus();
							return false;
						}
					}

					// 이름 검사
					if (f.w.value == "") {
						if (f.mb_name.value.length < 1) {
							alert("이름을 입력하십시오.");
							f.mb_name.focus();
							return false;
						}

						/*
						var pattern = /([^가-힣\x20])/i;
						if (pattern.test(f.mb_name.value)) {
						    alert("이름은 한글로 입력하십시오.");
						    f.mb_name.select();
						    return false;
						}
						 */
					}

					// 닉네임 검사
					if ((f.w.value == "")
							|| (f.w.value == "u" && f.mb_nick.defaultValue != f.mb_nick.value)) {
						var msg = reg_mb_nick_check();
						if (msg) {
							alert(msg);
							f.reg_mb_nick.select();
							return false;
						}
					}

					// E-mail 검사
					if ((f.w.value == "")
							|| (f.w.value == "u" && f.mb_email.defaultValue != f.mb_email.value)) {
						var msg = reg_mb_email_check();
						if (msg) {
							alert(msg);
							f.reg_mb_email.select();
							return false;
						}
					}

					// 휴대폰번호 체크
					var msg = reg_mb_hp_check();
					if (msg) {
						alert(msg);
						f.reg_mb_hp.select();
						return false;
					}

					if (typeof f.mb_icon != "undefined") {
						if (f.mb_icon.value) {
							if (!f.mb_icon.value.toLowerCase().match(
									/.(gif|jpe?g|png)$/i)) {
								alert("회원아이콘이 이미지 파일이 아닙니다.");
								f.mb_icon.focus();
								return false;
							}
						}
					}

					if (typeof f.mb_img != "undefined") {
						if (f.mb_img.value) {
							if (!f.mb_img.value.toLowerCase().match(
									/.(gif|jpe?g|png)$/i)) {
								alert("회원이미지가 이미지 파일이 아닙니다.");
								f.mb_img.focus();
								return false;
							}
						}
					}

					if (typeof (f.mb_recommend) != "undefined"
							&& f.mb_recommend.value) {
						if (f.mb_id.value == f.mb_recommend.value) {
							alert("본인을 추천할 수 없습니다.");
							f.mb_recommend.focus();
							return false;
						}

						var msg = reg_mb_recommend_check();
						if (msg) {
							alert(msg);
							f.mb_recommend.select();
							return false;
						}
					}

					if (!chk_captcha())
						return false;

					document.getElementById("btn_submit").disabled = "disabled";

					return true;
				}
			</script>

			<!-- } 회원정보 입력/수정 끝 -->
		</div>

	</div>
</body>
</html>