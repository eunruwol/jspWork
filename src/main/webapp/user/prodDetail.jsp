<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
.fontsize{letter-spacing:-1px;font-size:13px}
.images{width:200px;height:200px;border-radius:5px;}
.addressDiv{display:flex;}
.prods{padding-bottom:20px;border-bottom:1px solid #000;letter-spacing:-1px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	console.log("document.ready");
	
	// tr에 select (class="userClick")
	
	var ev = "click";
	$(".listGo").on(ev, function(){
		location.href="userProdList?page=1&pageSize=10";
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
			<h2 class="prods">제품 상세 페이지</h2>
				<form action="/prodUpdateForm" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">제품 아이디</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="prod_id" name="prod_id" value="${prodVo.prod_id}" readOnly />
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">제품 이름</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="prod_name" name="prod_name"
								placeholder="제품 이름" value="${prodVo.prod_name}">
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">제품 등록일</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="prod_insdate" name="prod_insdate"
								placeholder="제품 등록일" value="<fmt:formatDate value="${prodVo.prod_insdate}" pattern="yyyy-MM-dd" />">
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">바이어 아이디</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="buyer_id" name="buyer_id"
								placeholder="바이어 아이디" value="${prodVo.buyer_id}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">바이어 이름</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="buyer_name" name="buyer_name"
								placeholder="바이어 이름" value="${prodVo.buyer_name}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">바이어 이메일</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="buyer_mail" name="buyer_mail"
								placeholder="바이어 이름" value="${prodVo.buyer_mail}">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">수정</button>
							<button type="button" class="btn btn-default listGo">목록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>