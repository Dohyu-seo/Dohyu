<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Emp List</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>
	h4{
		margin-Left: 20px;
		margin-top: 0px;
		margin-bottom: 0px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#content').css('display','none');
		$('.select').click(function(){
			//할일
			//어떤 버튼이 눌러졌는지 알아낸다
			var tid = $(this).attr('id');
			// ajax 안에서 this를 쓰려고 버튼을 함수에 담아놓자
			var elm = $(this);	// 제이쿼리 객체
			var el = this; //  자바스크립트 객체
			
			$.ajax({
				url: '/clsProj/ajax/empInfo.cls',
				type: 'post',
				//dataType: 'json',
				dataType: 'text',
				data: {
					'eno': tid
				},
				success: function(obj){
					/*
						success 함수의 매개변수의 의미
							비동기 통신으로 요청을 하게되면
							dataType의 형식의 문서를 서버가 작성해서 응답해주게 되어있다.
							따라서
								dataType: 'json'
							이라고 정의를 하면
							요청에 대한 응답으로 json 문서를 작성해서 응답을 해준다.
							이 때
							요청 측에서 응답 내용을 받아야 하는데
							그 때 받아서 지정하는 것이 success 함수의 매개변수이다.
							
							따라서 자바스크립트의 형식으로 표현하자면
								var obj = {
										 데이터 내용
								}
							그래서 사용할 때는 매개변수를 json 객체로 사용하면 된다.
					*/
					/*
					$('#title').html('[ <b>'+ obj.ename + '</b> ] <small>사원 상세정보</small>');
					$('#eno').html(obj.eno);
					$('#ename').html(obj.ename);
					$('#mgr').html(obj.mgr);
					$('#hdate').html(obj.sdate);
					$('#sal').html(obj.sal);
					$('#grade').html(obj.grade);
					$('#comm').html(obj.comm);
					$('#dno').html(obj.dno);
					$('#dname').html(obj.dname);
					$('#loc').html(obj.loc);
					*/
					
					// append 함수로 처리
				/*	$('#content').append(
					'<hr><div class="w3-col"><h3 class="w3-center w3-blue w3-padding w3-margin-bottom w3-margin-top">'+'<b>'+ obj.ename + '</b>' + '<small>사원 상세정보</small></h3>' +
					'<div class="w3-col w3-card w3-padding">' +
						'<div class="w3-row">' +
						'<h4 class="w3-col w-150 w3-right-olign">사원번호 : </h4>' +
						'<h4 class="w3-rest pd-Left-20">'+obj.eno+'</h4>' +
						'</div>' +
						'<div class="w3-row">' +
						'<h4 class="w3-col w-150 w3-right-olign">사원이름 : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.ename+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">상사번호 : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.mgr+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">입사일   : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.sdate+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">급   여  : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.sal+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">급여등급 : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.grade+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">커미션   : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.comm+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">부서번호 : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.dno+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">부서이름 : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.dname+'</h4>' +
							'</div>' +
							'<div class="w3-row">' +
							'<h4 class="w3-col w-150 w3-right-olign">부서위치 : </h4>' +
							'<h4 class="w3-rest pd-Left-20">'+obj.loc+'</h4>' +
							'</div>' +
							'</div>' +
							'</div>'
					);
					$('#content').css('display','');
					*/
					//text로 주고받기
					alert(obj);
					//alert($(this).html()); // 이건 scuess 함수를 호출하게된다.
					// 현재 실행중인 자기 자신 : 실행중인 함수가 this 이다.
					alert($(elm).html());
					alert(el.innerHTML); 
				},
				error: function(){
					alert('### 통신에러 ###');
				}
			})
			
		})
	})
</script>
</head>
<body>
<div class="w3-content mxw">
	<h2 class="w3-pink w3-center w3-padding w3-margin-top">사원 리스트</h2>
	<div class="w3-col w3-margin-bottom">
		<div class="w3-button w3-small w-100 w3-green w3-Left" id="HOME">HOME</div>
		<div class="w3-button w3-small w-100 w3-blue w3-right" id="LOGIN">LOGIN</div>
	</div>
	<div class="w3-col w3-center">
		<c:forEach var="data" items="${LIST}" varStatus="st">
		<div class="select w3-button w3-margin-bottom w-150 ${COLOR.get(st.index) }" id="${data.eno}" style="margin-bottom: 20px;">${data.name}</div>
		</c:forEach>
	</div>
	<!-- 사원 상세 정보 태그 -->
	<div class="w3-col" id="content">
	<!-- 
		<h3 class="w3-center w3-blue w3-padding w3-margin-bottom" id="title"></h3>
		<div class="w3-col w3-card w3-padding">
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">사원번호 : </h4>
				<h4 class="w3-rest pd-Left-20" id="eno"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">사원이름 : </h4>
				<h4 class="w3-rest pd-Left-20" id="ename"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">상사번호 : </h4>
				<h4 class="w3-rest pd-Left-20" id="mgr"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">입사일   : </h4>
				<h4 class="w3-rest pd-Left-20" id="hdate"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">급   여  : </h4>
				<h4 class="w3-rest pd-Left-20" id="sal"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">급여등급 : </h4>
				<h4 class="w3-rest pd-Left-20" id="grade"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">커미션   : </h4>
				<h4 class="w3-rest pd-Left-20" id="comm"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">부서번호 : </h4>
				<h4 class="w3-rest pd-Left-20" id="dno"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">부서이름 : </h4>
				<h4 class="w3-rest pd-Left-20" id="dname"> </h4>
			</div>
			<div class="w3-row">
				<h4 class="w3-col w-150 w3-right-olign">부서위치 : </h4>
				<h4 class="w3-rest pd-Left-20" id="loc"></h4>
			</div>
		</div>
		 -->
	</div>
</div>
</body>
</html>