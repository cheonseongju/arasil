<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/img/favicon.ico" />

<script>
	$(function() {
		$("#btnList").on("click",function() {
		location.href = "${pageContext.request.contextPath}/board/noticePage";
		});
		$("#btnUpdate").on("click", function(){
			var url = "${pageContext.request.contextPath}/board/editForm";
			url = url + "?noticeId=" +${pageContent.notice_id};
			url = url + "&mode=edit";
			
			location.href = url;
		});
		
		$("#btnDelete").on("click",function(){
			var url = "${pageContext.request.contextPath}/board/deleteBoard";
			url = url + "?noticeId=" + ${pageContent.notice_id};
			location.href = url;
		});
	});
</script>
</head>

<body>
	<article>
		<div class="container" role="main">
			<h2>게시글 내용</h2>

				<div class="bg-white rounded shadow-sm">
					<div class="notice_title">
						<c:out value="${pageContent.notice_title }" />
					</div>
					<div class="notice_info_box">
						<span class="notice_author">
								<c:out value="${pageContent.user_id}" /></span>
						<span class="notice_date">
								<c:out value="${pageContent.notice_date}" /></span>
					</div>
					<div class="notice_content">${pageContent.notice_content }</div>
				</div>

			</div>

			<div style="margin-top: 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>