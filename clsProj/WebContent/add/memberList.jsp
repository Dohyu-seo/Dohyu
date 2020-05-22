<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.btn').click(function(){
			var sno = $(this).attr('id');
			$.ajax({
				url: "/clsProj/add/getInfo.ck",
				type: "post",
				dataType: 'json',
				data: {
					"mno": sno
				},
				success: function(obj){
					$('#frm').html('');
					$('#frm').append('id : ' + obj.id + '<br>');
					$('#frm').append('name : ' + obj.name + '<br>');
					$('#frm').append('mail : ' + obj.mail);
				},
				error: function(){
					alert('통신에러');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw">
		<h2 class="w3-blue w3-center w3-padding w3-margin-top w3-margin-bottom">회원리스트</h2>
		<div class="w3-col w3-margin-bottom">
			<c:forEach var="data" items="${LIST}">
				<div class="w3-button w3-margin w-150 w3-blue btn" id="${data.mno}">${data.name}</div>
			</c:forEach>
		</div>
		<div class="w3-col w3-border w3-center w3-padding w3-margin-top w3-card" id="frm"></div>
	</div>
</body>
</html>