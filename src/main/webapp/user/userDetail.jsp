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
<style>
.fontsize{letter-spacing:-1px;font-size:13px}
.images{width:200px;height:200px;border-radius:5px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	console.log("document.ready");
	
	// tr에 select (class="userClick")
	
	var ev = "click";
	$(".listGo").on(ev, function(){
		location.href="userPageList?page=1&pageSize=10";
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
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">사용자 사진</span></label>
						<div class="col-sm-10">
							<% if(selectUserVo.getProfile() == null){ %>
								<img src="/profile/noimage.png" class="images"/>
							<% }else{ %>
								<img src="<%=selectUserVo.getProfile()%>" class="images" />
							<% } %>
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">사용자 아이디</span></label>
						<div class="col-sm-10">
							<label class="control-label">
								<%=request.getParameter("userId")%>
							</label>
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize">사용자 이름</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userNm" name="userNm"
								placeholder="사용자 이름" value="<%=selectUserVo.getName()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"><span class="fontsize"><span class="fontsize">주소</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userAddr1"
								name="userAddr1" placeholder="주소" value="<%=selectUserVo.getAddr1()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">상세주소</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userAddr2" name="userAddr2"
								placeholder="상세주소" value="<%=selectUserVo.getAddr2()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">우편번호</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userPost" name="userPost"
								placeholder="우편번호" value="<%=selectUserVo.getZipcd()%>">
						</div>
					</div>
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					%>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">생년월일</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userBir" name="userBir"
								placeholder="생년월일" value="<%=sdf.format(selectUserVo.getBirth())%>">
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">이메일</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userMail" name="userMail"
								placeholder="이메일" value="<%=selectUserVo.getEmail()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label"><span class="fontsize">연락처</span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userTel" name="userTel"
								placeholder="연락처" value="<%=selectUserVo.getTel()%>">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">사용자 등록</button>
							<button type="button" class="btn btn-default listGo">목록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>