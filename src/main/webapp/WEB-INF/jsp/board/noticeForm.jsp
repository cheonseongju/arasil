<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아라실에 오신걸 환영합니다.</title>
<script
	src="${pageContext.request.contextPath}/static/jQuery/jquery-3.6.0.min.js"></script>
<link
	href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css"
	rel="stylesheet"></link>

<script>
		$(function(){
			$("#btnSave").on("click", function(){
				$("#form").submit();
			});
			$("#btnList").on("click", function(){
				location.href="${pageContext.request.contextPath}/board/noticePage";
			});
		});
</script>	
<script>	
		$(document).ready(function(){
			var mode = '<c:out value="${mode}"/>';
			if( mode == 'edit'){
				// 입력 셋팅
				$(#user_id).prop('readonly',true);
				$("input:hidden[name='notice_id']").val(<c:out value="${pageContent.notice_id}"/>);
				$("input:hidden[name='mode']").val('<c:out value ="${mode}"/>');
				$("#user_id").val('<c:out value ="${pageContent.user_id}"/>');
				$("#notice_title").val('c:out value ="${pageContent.notice_title}"/>');
				$("#notice_content").val('c:out value="${pageContent.notice_content}"/>');
			}
		});
</script>	

<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>공지사항 글쓰기</h2>
			<form:form name="form" id="form" role="form" modelAttribute="noticeVO" method="post"
				action="${pageContext.request.contextPath}/board/saveBoard">
				<form:hidden path="notice_id"/>
				<input type="hidden" name="mode"/>
				
				<div class="mb-3">
					<label for="notice_title">제목</label> 
					<form:input path ="notice_title" class="form-control" id="notice_title" placeholder="제목을 입력해 주세요"/>
				</div>
				<div class="mb-3">
					<label for="user_id">작성자</label>
					 <form:input path="user_id" class="form-control" id="user_id" placeholder="이름을 입력해 주세요"/>
				</div>
				<div class="mb-3">
					<label for="noticeContent">내용</label>
					<form:textarea path="notice_content" class="form-control" rows="5" id="noticeContent"
						placeholder="내용을 입력해 주세요"/>
				</div>
				<input type="hidden" value="admin" name="userId"/>
			</form:form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>