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
		var userId = $(this).children()[1].innerText;
		
		$("#userId").val(userId);
		
		$("#frm").submit();
	});
});
</script>
</head>

<body>
<form id="frm" action="/userDetail" method="get">
	<input type="hidden" id="userId" name="userId" />
</form>

	<%@ include file="/common/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="/common/left.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">사용자</h2>
						<div class="table-responsive">
							<table class="table table-striped iks">
								<tr>
									<th>번호</th>
									<th>사용자 아이디</th>
									<th>사용자 이름</th>
									<th>생일</th>
								</tr>
								
								<%
								List<UserVo> userList = (List<UserVo>)request.getAttribute("userList");
								
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								for(UserVo uv : userList){
								%>
								<tr class="userClick">
									<td><%=uv.getRnum() %></td>
									<td>
										<a class="ida" href="/userDetail?userId=<%=uv.getUserId()%>"><%=uv.getUserId() %></a>
									</td>
									<td><%=uv.getName() %></td>
									<td><%=sdf.format(uv.getBirth()) %></td>
								</tr>
								<%} %>
							</table>
						</div>

						<a class="btn btn-default pull-right">사용자 등록</a>

						<div class="text-center">
							<ul class="pagination">
								<li>
									<a href="/userPageList?page=1&pageSize=10"" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<%
									int pageCnt = (Integer) request.getAttribute("pageCnt");
									for(int p=1; p<=pageCnt; p++){
								%>
										<li><a href="/userPageList?page=<%=p%>&pageSize=10"><%=p%></a></li>
								<%
									}
								%>
								<li>
									<a href="/userPageList?page=<%=pageCnt%>&pageSize=10" aria-label="Next">
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