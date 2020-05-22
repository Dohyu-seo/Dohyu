<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 메인페이지</title>
<link rel="stylesheet" href="/clsProj/css/proj.css">
<link rel="stylesheet" href="/clsProj/css/w3.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>
asdf{
    overflow-y: none;
   -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}asdf::-webkit-scrollbar {
display: none; /*Chrome, Safari, Opera*/
}
</style>
<script>
$(function(){
	$('#lbtn').click(function(){
		$(location).attr('href','/clsProj/member/login.cls');
	})
	$('#lbtn2').click(function(){
		$(location).attr('href','/clsProj/member/login.cls');
	})
	$('#jbtn').click(function(){
		$(location).attr('href','/clsProj/member/join.cls');
	})
	$('#jbtn2').click(function(){
		$(location).attr('href','/clsProj/member/join.cls');
	})
	$('.dCJp8').click(function(){
		$('.rBNOH').remove();
	})
  $(document).scroll(function() {
    var maxHeight = $(document).height();
    var currentScroll = $(window).scrollTop() + $(window).height();
    
    if (maxHeight <= currentScroll + 100) {
    		$('#contents-wrap').append('<div class="w3-col"><article style="top:9px; border: 2px solid black; display: flex; width: 300px; height: 200px;"><span style="line-height:0px; font-size: 14px;"><button class="xqRnw dCJp8"><span aria-label="좋아요" class="insbak insheart" style="margin: 3px;"></span></button></span></article>');
    }
  })
})
</script>
</head>
<body>
	<div>
		<!-- 헤더부분 -->
		<div id="header-wrap">
			<div class="header">
				<div class="logobox">
					<!-- 로고 이미지 혹은 링크 들어갈 자리 class="div_logo" -->
					<div style="box-sizing: border-box; font-size: 30px; text-align: center;">PageTurner</div>
				</div>
				<div class="searchbox">
					<input class="searchinput" type="text" placeholder="search">
				</div>
				<div class="iconsbox">
					<!-- 상단 로그인, 가입하기 버튼 -->
					<a href="#" class="ft-log foot-box mg-whtie" id="lbtn">로그인</a>
					<a href="#" class="ft-join joinc0l0" style="padding-left:15px;" id="jbtn">가입하기</a>
					<!-- /상단 로그인, 가입하기 버튼 -->
				</div>
			</div>
		</div>
		<!-- 본문부분 -->
		<div id="contents-wrap">
			<div class="contents">
				<!-- 좌측 게시글 부분 -->
				<div class="posts_area" >
					게시글 부분 
				</div>
					
				<!-- 우측 정보 부분 : 고정페이지로 들어갈 것-->
				<div class="info_area">
					<article style="top:9px; position:absolute; border: 2px solid black; display: flex; width: 300px; height: 200px;">
						<span style="line-height:0px; font-size: 14px;">
							<button class="xqRnw dCJp8">
								<span aria-label="좋아요" class="insbak insheart" style="margin: 3px;"></span>
							</button>
						</span>
					</article>
				</div>
				<!-- 우측 정보 끝! -->
			</div>
		</div>
		<!-- 풋터부분 -->
		<div id="footer-wrap">
			<div class="footer" style="text-align: center;">footer</div>
		</div>
		<!-- Footer Link -->
		<div class="bgalss dCJb6 rBNOH Igw0E pmxbr HcJZg XfCBB IY_1 4EzTm" style="height:111.938px; bottom: 0px; position: fixed; z-index: 2;">
			<!-- close button -->
			<button class="xqRnw dCJp8">
				<!-- <span aria-label="닫기" style="text-align: center; margin: 0px auto;"><img src="https://img.icons8.com/plasticine/100/000000/close-window.png" style="width: 24px; height: 24px;"/></span> -->
				<span aria-label="닫기" class="insbak insgreyClose" style="margin: 3px;"></span>
			</button>
			<!-- /close button -->
			<!-- div area -->
			<div class="divflex" style="width: 903px; margin: 0px auto;">
				<!-- area in icon -->
				<div style="height: 56px; width: 56px; border: 1px solid white;" class="inblock posit bd-rad">
					<span aria-label="로그인" style="color: white; display: block; padding: 6px; padding-top: 15px;" class="XfCBB HcThg dCJb6 full0">LOGO</span>
				</div>
				<!-- /area in icon -->
				<!-- text body -->
				<div class="mg-left dblock rG18m">
					<!-- from Login -->
					<div class="mg-whtie">
						<div>PageTurner에 로그인</div>
					</div>
					<!-- /from Login -->
					<!-- body -->
					<div class="footbody">PageTurner에서 다른 사람들과 당신이 좋아하는 책에 대해 이야기해보세요<img style="width: 20px; hieght: 20px;"src="https://img.icons8.com/cotton/64/000000/apple--v2.png"/></div>
					<!-- /body -->
				</div>
				<!-- /text body -->
				<!-- Login, Join button -->
				<div class="ft-btn">
					<!-- Login -->
					<div class="mt-12">
						<a href="#" class="ft-log foot-box mg-whtie" id="lbtn2">로그인</a>
					</div>
					<!-- /Login -->
					<!-- Join -->
					<div style="text-align:center; margin-top: 12px; padding: 0px 30px;">
						<a href="#" class="ft-join joinc0l0" id="jbtn2">가입하기</a>
					</div>
					<!-- /Join -->
				</div>
				<!-- /Login, Join button -->
			</div>
			<!-- /div area -->
		</div>
		<!-- /Footer Link -->
				
				<!-- <div class="linkfoot" id="foot-link"><a href="#" >Form Join</a></div>-->
	</div>
</body>
</html>