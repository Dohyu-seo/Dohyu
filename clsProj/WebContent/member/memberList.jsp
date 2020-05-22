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
	$(function(){
		$('.btn').click(function(){
			var sno = $(this).attr('id');
			
			$.ajax({
				url: "/clsProj/member/getInfo.ck";
				type: 'post',
				dataType: 'json',
				data: {
					'mno': sno
				},
				success: function(obj){
					var id = obj.id;
					var mno = obj.mno;
					$('#tid').html(id);
					
					$('#frm').css('display', '');
				},
				error: function(){
					alert('error');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw">
		<c:forEach var="data" items="${LIST}">
		<div class="w3-button w3-blue w-150 btn" id="${data.mno}">${data.id}</div>
		</c:forEach>
	</div>
	<div style="display: none;">
	
		<div id="tid">hong</div>
	</div>
	
</body>
</html>