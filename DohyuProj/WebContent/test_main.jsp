<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 메인페이지</title>
<link rel="stylesheet" href="/BookNet/css/proj.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<script type="text/javascript" src="/BookNet/js/jquery-3.5.0.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(document).ready(
		function() {
			$('#more_butt').click(function() { //modal에서 알림페이지로 이동 
				$(location).attr('href', '/BookNet/fixed/activity.cls');
			});

			$('#aBtn').click(function() { //modal 열기
				$('#actModal').css('display', 'block');
			});

			$('#close_butt').click(function() { //modal 닫기버튼 
				$('#actModal').css('display', 'none');
			});
			
			$('#likebtn').click(function(){ //like 버튼 클릭시 빨강하트로 변경 
				$(this).css('background-position', '-208px -370px');
			});

			
			// footerUp
			var hei = $('#footer-wrap').css("height");
			 $("#footer-wrap").mouseenter(function(){
					if($('#footer-wrap').css("height") == "100px"){
						$('#footer-wrap').css("transition","all 0.6s");
						$('#footer-wrap').css("background-color","black");
						$('#footer-wrap').css("color","white");
						$('#footer-wrap').css("height","200px");
						
					} else if($('#footer-wrap').css("height") == hei){
						$('#footer-wrap').css("transition","all 0.6s");
						$('#footer-wrap').css("background-color","black");
						$('#footer-wrap').css("color","white");
						$('#footer-wrap').css("height","200px");
					}
			 	$("#footer-wrap").mouseleave(function(){
			 		if($('#footer-wrap').css("height") == "200px"){
			 			$('#footer-wrap').css("height", "100px");
						$('#footer-wrap').css("background-color","#fff");
						$('#footer-wrap').css("color","#000");
						$('#footer-wrap').css("transition","all 0.6s");
						$('#footer-wrap').css("overflow","hidden");
			 		}
				});
			});
			
			 //foot bar
			/*  var wid = $('footer').css("width");
			 var target2 = wid.split("px"); // -string-
			 target2[0] *= 1; // -toNumber-
			 //alert(typeof(target2[0]));
			 var footbar = target2[0]/3;
			 $('#comp').css("margin-left",footbar);
			 $('#team').css("margin-left",footbar);
			 $('#maker').css("margin-left",footbar);*/
			 
}); 
</script>
</head>
<body>
	<div>
		<!-- 본문부분 -->
		<div id="contents-wrap">
			<div class="contents">
				<!-- 좌측 게시글 부분 -->
				<div class="posts_area">
					<article class="eachPost" id="이곳은게시물번호가들어갈자리">
						<!-- 작성자 정보 & 버튼 :: 아이디 불러와야함  -->
						<div class="wrtInfo"> 
						
							<div class="wrtProf">
								<img src="">
							</div>
							<div class="wrter" id="">
								<b>작성자아이디</b>
							</div>
							<div class="like-butt" id="">
								<span style="font-size: 12px; line-height: 0px;" class="comt-img"></span>
							</div>
							<div class="like-butt" id="" style="display: flex;'">
								<span style="font-size: 12px; line-height: 0px;" class="like-img" id="likebtn"></span>
							</div>
						</div>
						<!-- 게시글의 본문부분::도서사진,도서이름,본문 -->
						<div class="postCont" style="text-align: center; font-size: 16px;">
							<!-- 도서사진, 도서이름, 게시글본문 -->
							<div class="book-pic">
								<!-- 도서 사진 들어갈 부분 -->
							</div>
							<div class="book-name">
								<!-- 도서명 들어갈 부분 -->
							</div>
							<div class="post-body">
								<!-- 게시글 부분 -->
							</div>
						</div>
						<div class="etcdiv" style="text-align: center; font-size: 16px;">
							태그<!-- 게시글 해시태그 부분 -->
						</div>
					</article>
				</div>
				<!-- 우측 정보 부분 : 고정페이지로 들어갈 것-->
				<div class="info_area">
					<div style="width: 100%; height: 200px; margin-top: 15px; border: solid 1px white;">
						<a>김이슬!</a>
					</div>
					<div style="width: 100%; height: 200px; margin-top: 15px; border: solid 1px white;">
						<a></a>
					</div>
				</div>
				<!-- 우측 정보 끝! -->
			</div>
		</div>
		<!-- 헤더부분 -->
		<div id="header-wrap">
			<div class="header">
				<div class="logobox">
					<div
						style="box-sizing: border-box; font-size: 30px; text-align: center;">
						<!-- 로고 이미지 혹은 링크 들어갈 자리 class="div_logo" -->
						<a href="/BookNet/main/mem_main.cls">PageTurner</a>
					</div>
				</div>
				<div class="searchbox">
					<input class="searchinput" type="text" placeholder="search">
				</div>
				<div class="iconsbox">
					<!-- 알람표시아이콘 -->
					<div class="span_icons">
						<button type="button" class="butt" id="aBtn">
							<img class="iconimg" id="" src="/BookNet/img/iconmonstr-bell-7-240.png">
						</button>
						<!-- The Modal -->
						<div id="actModal" class="modal" role="none">
							<!-- Modal Content -->
							<div style="width: 900px; height: auto; margin: 0 auto;">
								<div id="modal-content" class="modal-content">
									<!-- <span class="close" id="close_butt">x</span> -->
									<input type="button" value="x" class="close" id="close_butt" />
									<!-- onclick="document.getElementById('actModal').style.display='none'" -->
									<p>Some Text....</p>
									<div
										style="width: 100%; height: 30px; line-height: 30px; background-color: rgba{0, 0, 0, 4">
										<!-- <input type="button" value="MORE" id="more_butt" style="width: 100%; box-sizing: border-box;"/> -->
										<div style="width: 100%; text-align: center" id="more_butt">MORE</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<span class="span_icons"> 
						<img class="iconimg" id="" src="/BookNet/img/iconmonstr-compass-4-240.png">
					</span> <span class="span_icons" id=> <img class="iconimg" id=""
						src="/BookNet/img/iconmonstr-pen-15-240.png">
					</span> <span class=span_icons> <img class="iconimg" id=""
						src="/BookNet/img/iconmonstr-user-19-240.png">
					</span>
				</div>
			</div>
		</div>
		<!-- 풋터부분 -->
		<footer id="footer-wrap" style="padding:10px; height: 100px;">		
					<h3 style="position:absolute; top:0px; left: 350px; display: flex;">Company</h3><br><h4 style="position:absolute;  top:25px; left: 352px; display: flex; font-size: 10pt;">Increpas</h4><br><h4 style="position:absolute; top:45px; left: 352px; display: flex; font-size:10pt;">서울특별시 관악구 신림동 시흥대로 552</h4>
					<h3 style="position:absolute; top:0px; left: 800px; display: flex;">Project_Team</h3><br><h4 style="position:absolute; top:25px; left: 802px; display: flex; font-size: 10pt;">BookNet KOR</h4><br><h4 style="position:absolute; top:45px; left: 802px; display: flex; font-size:10pt;">PageTurner</h4>
					<h3 style="position:absolute; top:0px; left: 1200px; display: flex;">만든이</h3><br><h4 style="position:absolute; top:25px; left: 1202px; display: flex; font-size: 10pt;">박 기윤 | 김 이슬 | 이 명환</h4><br><h4 style="position:absolute; top:45px; left: 1202px; display: flex; font-size:10pt;">서 동혁 | 우 현우 |</h4>
			    <small>
			    <p style="position:absolute; top:120px; left: 800px; display: flex;">Copyright © 2018 tcpschool.co.,Ltd. All rights reserved.</p>
			    <address style="position:absolute; top:140px; left: 800px; display: flex;">Contact webmaster for more information. 070-1234-5678</address>
			    </small>
			    <img src="https://img.icons8.com/cotton/64/000000/apple--v1.png" style="position:absolute; top:50px; left: 1600px; display: flex; width:128px; height: 128px;"/>
		</footer>
	</div>
</body>
</html>