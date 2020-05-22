<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Relaye</title>
<link rel="stylesheet" href="/css/w3.css">
<script type="text/javascript" src="/js/jquery-3.5.0.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(function(){
		//location.href='/clsProj/BoardDetail.cls'; --> get방식
		$('#frm').submit();
	});
</script>
</head>
<body>
	<form method="post" action="/clsProj/board/boardDetail.cls" id="frm">
		<input type="hidden" name="bno" value="${DATA.bno}">
		<input type="hidden" name="title" value="${DATA.title}">
		<input type="hidden" name="body" value="${DATA.body}">
		<input type="hidden" name="name" value="${DATA.name}">
		<input type="hidden" name="click" value="${DATA.click}">
		<input type="hidden" name="sdate" value="${DATA.sdate}">
		<input type="hidden" name="nowPage" value="${nowPage}">
			<!-- fileVO에 1번째에서 bino를 꺼내서 , 조건식 -->
		<c:if test="${DATA.file.get(0).bino ne 0}">
			<c:forEach var="data" items="${DATA.file}">
				<input type="hidden" name="bino" value="${DATA.bino}">
				<input type="hidden" name="oriname" value="${DATA.oriname}">
				<input type="hidden" name="savename" value="${DATA.savename}">
			</c:forEach>
		</c:if>
	</form>
</body>
</html>