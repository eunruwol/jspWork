<%@page import="kr.or.ddit.user.model.ProdVo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
.ida{color:#000}
.iks{text-align:center}
.iks > tbody > tr > th{text-align:center;background-color:#428bca;color:#fff}
.userClick{cursor:pointer}
.iks > tbody > tr:hover > a{background-color:#428bca;color:#fff}
.iks > tbody > tr > a:hover{background-color:#428bca;color:#fff}
</style>
<script type="text/javascript">
$(document).ready(function(){
	console.log("document.ready");
	
	// tr에 select (class="userClick")
	
	var ev = "click";
	$(".userClick").on(ev, function(){
		console.log("userClick");
		var prod_id = $(this).children()[1].innerText;
		
		$("#prod_id").val(prod_id);
		
		$("#frm").submit();
	});
});
</script>
</head>

<body>
<form id="frm" action="/prodDetail" method="get">
	<input type="hidden" id="prod_id" name="prod_id" />
</form>

	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="/common/left.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">제품</h2>
						<div class="table-responsive">
							<table class="table table-striped iks">
								<tr>
									<th>번호</th>
									<th>제품 아이디</th>
									<th>제품 이름</th>
									<th>제품 등록일</th>
								</tr>
								
								<%
								List<ProdVo> userList = (List<ProdVo>)request.getAttribute("userList");
								
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								%>
								<c:forEach items="${userList}" var="vo" varStatus="status">
									<tr class="userClick">
										<td>${status.index+1}</td>
										<td>
											<a class="ida" href="/prodDetail?prod_id=${vo.prod_id}">
												${vo.prod_id}
											</a>
										</td>
										<td>${vo.prod_name}</td>
										<td><fmt:formatDate value="${vo.prod_insdate}" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</table>
						</div>

						<a class="btn btn-default pull-right" href="/prodForm">제품 등록</a>

						<div class="text-center">
							<ul class="pagination">
								<li>
									<a href="/userProdList?page=1&pageSize=10"" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<%
									int pageCnt = (Integer) request.getAttribute("pageCnt");
								%>
								<c:forEach begin="1" end="${pageCnt}" var="p">
									<li><a href="/userProdList?page=${p}&pageSize=10">${p}</a></li>
								</c:forEach>
								<li>
									<a href="/userProdList?page=${pageCnt}&pageSize=10" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>