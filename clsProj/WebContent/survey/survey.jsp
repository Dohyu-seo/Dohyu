<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 페이지</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<%-- <script type="text/javascript" src="/clsProj/js/survey.js"></script> --%>
<style>
</style>
<script type="text/javascript">
$(function(){
	$('#sbtn').click(function(){
		$('#frm').submit();
	});
	
	$('#cbtn').click(function(){
		$(location).attr('href', '/clsProj/main.cls');
	});
});
</script>
</head>
<body>
	<div class="w3-content mxw"  >
		<!-- header -->
		<h2
			class="w3-card w3-center w3-padding w3-pink w3-margin-top w3-margin-bottiom" >설문
			조사</h2>
		<!-- /header -->
		<!-- title -->
		<div class="w3-col w3-border w3-card w3-margin-bottom"  style="background:linear-gradient( to right, yellow, red, purple, blue); opacity: 0.5;">
			<h4 class="w3-center ">${TITLE}</h4>
		</div>
		<!-- /title -->
		<!-- answer -->
		<div class="w3-col w3-border w3-card w3-margin-bottom"
			Style="padding-top: 50px; , padding-bottom: 50px;">
			
			<form method="post" action="/clsProj/survey/surveyProc.cls" id="frm">
			<input type="hidden" name="sino" id="12" value="${SINO}">
				<c:forEach var="data" items="${LIST}" varStatus="st">
				<input type="hidden" name="sno" value="${data.sno}">
				<!--  설문 문항 -->
					<h6 class="pd-Left-20 w3-margin-top w3-margin-bottom">
					${st.count}. ${data.sq}
					</h6>
					<!-- 설문 보기 -->
					<h6 Style="padding-left: 80px;" >
						<input type="radio" name="${data.sno}" value="1"><span
							class="pd-Left-10">1) ${data.sa1}</span>
					</h6>
					<h6 Style="padding-left: 80px;">
						<input type="radio" name="${data.sno}" value="2"><span
							class="pd-Left-10">2) ${data.sa2}</span>
					</h6>
					<h6 Style="padding-left: 80px;">
						<input type="radio" name="${data.sno}" value="3"><span
							class="pd-Left-10">3) ${data.sa3}</span>
					</h6>
					<h6 Style="padding-left: 80px;">
						<input type="radio" name="${data.sno}" value="4"><span
							class="pd-Left-10">4) ${data.sa4}</span>
					</h6>
					<!-- /설문보기 -->
				<!-- /설문문항 -->
				</c:forEach>
			</form>
		</div>
		<!-- answer -->
		<div class="w3-col w3-border w3-card">
			<div class="w3-half w3-button w3-red" id="cbtn">cancel</div>
			<div class="w3-half w3-button w3-blue" id="sbtn">submit</div>
		</div>
	</div>
</body>
</html>