<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>surveyAdd</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/clsProj/js/survey.js"></script>
<style>
</style>
<script type="text/javascript">
	$(function(){
		$('.frm2').css('display', 'none');
	});
</script>
</head>
<body>
	<div class="w3-content mxw">
		<h2 class="w3-indigo w3-card w3-margin-bottom w3-center">설문 정보 입력</h2>
		<!-- 설문주제 -->
		<form class="w3-col w3-card w3-padding frm1" id="frm1" method="POST" action="/clsProj/survey/surveyInfoProc.cls">
			<label class="w3-col w3-right-align w3-padding" for="title" style="width:20%;">설문 주제 : </label>
				<div class="w3-rest ">
				<input class="w3-input w3-border" type="text" id="title" name="title" style="resize:none; width:80%;">
				</div>
			<label class="w3-col w3-right-align w3-padding" for="start" style="width:20%;">설문 시작 : </label>
				<div class="w3-rest ">
				<input class="w3-input w3-border" type="date" id="start" name="start" style="resize:none; width:80%;">
				</div>
			<label class="w3-col w3-right-align w3-padding" for="end" style="width:20%;">설문 종료 : </label>
				<div class="w3-rest ">
				<input class="w3-input w3-border" type="date" id="end" name="end" style="resize:none; width:80%;">
				</div>
		</form>
		<!-- /설문주제 -->
		<!-- 버튼 -->
			<div class="w3-col w3-center w3-padding w3-margin-top frm1">
			<span class="w3-center w3-indigo w3-margin-top w3-padding  w3-button" id="addIbtn">submit</span>
		<span class="w3-center w3-red w3-margin-top w3-padding  w3-button" id="cbtn">cancel</span>
		</div>
		<!-- //버튼 -->
		
		<!-- 설문 문항 등록 -->
		<form class="w3-col w3-card w3-padding w3-margin-top frm2" method="POST" action="/clsProj/survey/surveyInfoProc.cls">
		<h4 class="w3-center w3-grey w3-padding w3-card w3-margin-bottom">* ${TITLE}</h4>
			<label class="w3-col w3-right-align w3-padding" for="sq" style="width:20%;">설문 문항 : </label>
			<input type="hidden" name="sino" id="sino" value="${sino}"/>
				<div class="w3-rest ">
					<input class="w3-input w3r" type="text" id="sq" name="sq" style="resize:none; width:80%;">
				</div>
		<div class="w3-row w3-margin-top">
			<label class="w3-col w3-right-align w3-padding" for="sa1" style="width:20%;">보기 1 : </label>
				<div class="w3-rest ">
					<input class="w3-input w3-border" type="text" id="sa1" name="sa1" style="resize:none; width:80%;">
				</div>
		</div>
		<div class="w3-row w3-margin-top">
			<label class="w3-col w3-right-align w3-padding" for="sa2" style="width:20%;">보기 2 : </label>
				<div class="w3-rest">
					<input class="w3-input w3-border" type="text" id="sa2" name="sa2" style="resize:none; width:80%;">
				</div>
		</div>
		<div class="w3-row w3-margin-top">
			<label class="w3-col w3-right-align w3-padding" for="sa3" style="width:20%;">보기 3 : </label>
				<div class="w3-rest ">
					<input class="w3-input w3-border" type="text" id="sa3" name="sa3" style="resize:none; width:80%;">
				</div>
		</div>
		<div class="w3-row w3-margin-top">
			<label class="w3-col w3-right-align w3-padding" for="sa4" style="width:20%;">보기 4 : </label>
				<div class="w3-rest ">
					<input class="w3-input w3-border" type="text" id="sa4" name="sa4" style="resize:none; width:80%;">
				</div>
		</div>
		<div class="w3-col w3-center w3-padding w3-margin-top frm2">
		<span class="w3-center w3-indigo w3-margin-top w3-padding  w3-button" id="addQA">submit</span>
		<span class="w3-center w3-red w3-margin-top w3-padding  w3-button" id="cbtn2">cancel</span>
		</div>
		</form>
	</div>
</body>
</html>