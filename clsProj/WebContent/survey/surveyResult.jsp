<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문결과 페이지</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/clsProj/js/survey.js"></script>
<style>
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="w3-content mxw">
		<!-- header -->
		<h2
			class="w3-card w3-center w3-padding w3-pink w3-margin-top w3-margin-bottiom">설문결과</h2>
		<!-- /header -->
		<!-- title -->
		<div class="w3-col w3-border w3-card w3-margin-bottom">
			<h4 class="w3-center ">${TITLE}</h4>
		</div>
		<!-- /title -->
		<!-- answer -->
		<div class="w3-col w3-border w3-card w3-margin-bottom"
			Style="padding-top: 50px; , padding-bottom: 50px;">
			
			<div>
			<input type="hidden" name="sino" value="${SINO}">
				<c:forEach var="data" items="${LIST}" varStatus="st">
				<input type="hidden" name="sno" value="${data.sno}">
					<h6 class="pd-Left-20 w3-margin-top w3-margin-bottom">
					${st.count}. ${data.sq}
					</h6>
					<!-- 설문 결과 -->
					<div class="w3-row"  style="margin:0px auto;">
						<span style="text-align: center; display: inline-block; margin:0px auto;">
						</span>
						<!-- <span>보기 1</span><br> -->	
							<b><small>${String.format("%.2f",data.sack1 * 100/ data.saTotal)}%</small></b>
						<div class="w3-rest">
						<div Style="padding-left: 80px;" ></div>
						<h5 class="pd-Left-10">1) ${data.sa1}</h5>
						<div class="w3-col pd-Left-10">
								<div style="background-color: skyblue; width: ${data.sack1 * 100 / data.saTotal}%; height: 30px; color: white;"><small>${String.format("%.2f",data.sack1 * 100/ data.saTotal)}%</small></div>
							</div>
						</div>
					</div>
					<div class="w3-row">
							<!-- <div class="w3-col w-100 w3-center">
						 <span>보기 2</span><br>
								<b><small>${String.format("%.2f",data.sack2 * 100/ data.saTotal)}%</small></b>
						</div>-->
						<div class="w3-rest">
						<div Style="padding-left: 80px;" ></div>
							<h5 class="pd-Left-10">2) ${data.sa2}</h5>
							<div class="w3-col pd-Left-10">
								<div style="background-color: skyblue; width: ${data.sack2 * 100 / data.saTotal}%; height: 30px; color: white;"><small>${String.format("%.2f",data.sack2 * 100/ data.saTotal)}%</small></div>
							</div>
						</div>
					</div>
					<div class="w3-row">
						<!-- 	<div class="w3-col w-100 w3-center">
							<span>보기 3</span><br>
								<b><small>${String.format("%.2f",data.sack3 * 100/ data.saTotal)}%</small></b>
						</div>-->
						<div class="w3-rest">
						<div Style="padding-left: 80px;" ></div>
							<h5 class="pd-Left-10">3) ${data.sa3}</h5>
							<div class="w3-col pd-Left-10">
								<div style="background-color: skyblue; width: ${data.sack3 * 100 / data.saTotal}%; height: 30px; color: white;"><small>${String.format("%.2f",data.sack3 * 100/ data.saTotal)}%</small></div>
							</div>
						</div>
					</div>
					<div class="w3-row">
							<!-- <div class="w3-col w-100 w3-center">
							<span>보기 4</span><br>
								<b><small>${String.format("%.2f",data.sack4 * 100/ data.saTotal)}%</small></b>
						</div>-->
						<div class="w3-rest">
						<div Style="padding-left: 80px;" ></div>
							<h5 class="pd-Left-10">4) ${data.sa4}</h5>
							<div class="w3-col pd-Left-10">
								<div style="background-color: skyblue; width: ${data.sack4 * 100 / data.saTotal}%; height: 30px; color: white;"><small>${String.format("%.2f",data.sack4 * 100/ data.saTotal)}%</small></div>
							</div>
						</div>
					</div>
					<!-- /설문결과 -->
				</c:forEach>
			</div>
		</div>
		<!-- answer -->
		<div class="w3-col w3-center">
			<div class="w-auto w3-button w3-red" id="cbtn">main으로</div>
		</div>
	</div>
</body>
</html>