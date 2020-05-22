<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gBoardList</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>
</style>
<script type="text/javascript">
$(function(){
	$('.btn').click(function(){
		var tid = $(this).attr('id');
		var url = '';
		if(tid == 'Login'){
			url = '/clsProj/member/login.cls';
		}else if(tid =='Logout'){
			url = '/clsProj/member/logoutProc.cls';
		}else if(tid =='HOME'){
			url = '/clsProj/main.cls';
		}
		$(location).attr('href',url);
	});
});
</script>
</head>
<body>
	<div class="w3-content mxw">
			<div class="w3-col">
				<h2 class="w3-blue w3-center w3-padding w3-margin-bottom">방명록 리스트</h2>
				<div class="w3-col w3-margin-bottom">
					<c:if test="${empty SID}">
							<div class="w3-col m1 w3-right w3-button w3-tiny w3-blue btn" id="Login">login</div>
					</c:if>
					<c:if test="${not empty SID}">
							<div class="w3-col m1 w3-right w3-button w3-tiny w3-amber btn" id="Logout">Logout</div>
					</c:if>
							<div class="w3-col m1 w3-right w3-button w3-tiny w3-green btn" id="HOME">HOME</div>
				</div>
				<c:if test="${CNT ne 1}">
						<form class="w3-col w3-border w3-margin-bottom" id="frm" method="post" action="./gBoardProc.cls">
							<div class="w3-col w-100 w3-center pd-10 w3-border-right">
							<c:if test="${SID eq null }">
								<img class="h-80p" src="/clsProj/img/noimage.jpg" style="width: 89px;">
							</c:if>
							<c:if test="${not empty SID}">
								<img class="h-80p w-auto" src="/clsProj/img/${AVT}">
							</c:if>
							</div>
							<c:if test="${SID eq null }">
							<div class=" w3-rest pdh-10">
								<div class="w3-col w3-border-bottom pd-5">
									<h5 class="w3-half w3-left-align" style="margin: 0px; padding-left: 10px;"><b>GUEST</b></h5>
									<div class="w3-btn w3-padding-small w3-right w3-red" id="sbtn" style="display: none;">submit</div>
								</div>
								<div class="w3-col">
									<textarea id="Nbody" class="w3-padding" cols="59" rows="2" style="resize: none;" disabled>로그인 후 이용하세요.</textarea>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty SID}">
							<div class=" w3-rest pdh-10">
								<div class="w3-col w3-border-bottom pd-5">
									<h5 class="w3-half w3-left-align" style="margin: 0px; padding-left: 10px;"><b>${SID}</b></h5>
									<div class="w3-btn w3-padding-small w3-right w3-red" id="sbtn">submit</div>
								</div>
								<div class="w3-col">
									<textarea id="body" class="w3-padding" cols="59" rows="2" style="resize: none;"></textarea>
								</div>
							</div>
							</c:if>
						</form>
					</c:if>
				
					<c:forEach var="data" items="${LIST}">
						<div class="w3-col w3-border w3-margin-bottom" id="${data.gno}">
							<div class="w3-col w-100 w3-center pd-10 w3-border-right">
								<img class="h-80p w-auto imgs  w3-circle"" src="/clsProj/img/${data.avatar}">
							</div>
							<div class="w3-rest pdh-10">
								<div class="w3-col w3-border-bottom">
									<h5 class="w-auto w3-left-align" style="margin: 0px; padding-left: 10px;">${data.id}</h5>
									<h6 class="w-auto w3-text-gray w3-right-align" style="margin: 0px; padding-right: 10px;"><small>${data.sDate}</small></h6>
								</div>
								<div class="w3-col">
									<h6 class="w3-padding" >${data.gbody}</h6>
								</div>
							</div>
						</div>
					</c:forEach>
				
					<c:if test="${empty LIST}">
							<div class="w3-col w3-border w3-margin-bottom w3-card"  id="gmsg">
								<h3 class="w3-padding w3-center"> 아직 작성된 글이 없습니다.</h3>
							</div>
					</c:if>
			</div>
		</div>
</body>
</html>