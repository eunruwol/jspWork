<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Jsp</title>
<%@ include file="/common/basicLib.jsp"%>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
.fontsize{letter-spacing:-1px;font-size:13px}
.images{width:200px;height:200px;border-radius:5px;}
.addressDiv{display:flex;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	console.log("document.ready");
	
	$("#userId").val();
	$("#pass").val("pass");
	$("#name").val("testUserName");
	$("#addr1").val("대전 중구 중앙로 76");
	$("#addr2").val("영민빌딩 2층 대덕인재개발원");
	$("#zipcd").val("34940");
	$("#birth").val("2018-08-08");
	$("#email").val("newUser@gmail.com");
	$("#tel").val("0422228202");
	
	// tr에 select (class="userClick")
	
	var ev = "click";
	$(".listGo").on(ev, function(){
		location.href="userPageList?page=1&pageSize=10";
	});
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
// 주소 검색 버튼 클릭이벤트가 발생 했을때 실행
$(document).ready(function(){
	$("#addrSearch").click(function(){		
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            console.log(data);
	            // 주소 : roadAddress
	            // 상세주소 : ""
	            // 우편번호 : zonecode
	            // 여기서부터 진행
	            document.getElementById("addr1").value = data.roadAddress;
	            document.getElementById("zipcd").value = data.zonecode;
	        }
	    }).open();
	});	
});
</script>
</head>

<body>

	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="/common/left.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<%
					UserVo selectUserVo = (UserVo)request.getAttribute("userVo");
				%>
				<form action="/userForm" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
				
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">사용자 사진</span></label>
						<div class="col-sm-10">
							<input type="file" id="profile" name="profile" value="" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="userId" class="col-sm-2 control-label"><span class="fontsize">사용자 아이디</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 아이디">
						</div>
					</div>
					
					<div class="form-group">
						<label for="userId" class="col-sm-2 control-label"><span class="fontsize">비밀번호</span></label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="pass" name="pass" placeholder="사용자 비밀번호">
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">사용자 이름</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name" placeholder="사용자 이름">
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">주소</span></label>
						<div class="col-sm-10 addressDiv">
							<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" readonly>
							<button type="button" id="addrSearch" class="btn btn-default">주소검색</button>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">상세주소</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">우편번호</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="zipcd" name="zipcd" placeholder="우편번호" readonly>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">생년월일</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일">
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">이메일</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="email" name="email" placeholder="이메일">
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">연락처</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="tel" name="tel" placeholder="연락처">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">사용자 등록</button>
							<button type="button" class="btn btn-default listGo">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	$(function() {
		$("#birth").datepicker({
			changeMonth: true,
		    changeYear: true,
		    yearRange: "1980:2018",
		    dateFormat: "yy/mm/dd",
		    monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dayNamesMin: ["일","월","화","수","목","금","토"]
		});
	});
	</script>
</body>
</html>