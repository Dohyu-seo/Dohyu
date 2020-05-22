<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Join Form </title>
	<link rel="stylesheet" href="../css/w3.css" />
	<script type="text/javascript" src="../js/jquery-3.5.0.min.js"></script>
	<style>
		form label {
			font-size: 12pt;
			color: gray;
			font-weight: bold;
		}

		.pright {
			padding-right: 5px;
		}

		.btn1 {
			height: 28px;
		}

		label {
			min-width: 140px;
		}

		.imgwin {
			display: inline-block;
			width: 140px;
			height: auto;
			overflow: hidden;
			margin-left: 5px;
			margin-bottom: 10px;
			margin-right: 5px;
		}

		.imgwin1 {
			display: inline-block;
			width: 190px;
			height: auto;
			overflow: hidden;
			margin-left: 0px;
			margin-top: 10px;

		}

		.dnone {
			display: none;
		}

		.imgwin2 {
			display: inline-block;
			width: 20px;
			height: auto;
			overflow: hidden;
			margin-left: 65px;
			margin-top: 10px;
			margin-right: 10px;

		}
		.imgwin3 {
			display: inline-block;
			width: 20px;
			height: auto;
			overflow: hidden;
			margin-left: 119px;
			margin-top: 10px;
			margin-right: 10px;

		}
		.imgwin4 {
			display: inline-block;
			width: 20px;
			height: auto;
			overflow: hidden;
			margin-left: 119px;
			margin-top: 10px;
			margin-right: 10px;

		}

		.bcolour {
			background-color: palevioletred;
		}
		.btn2 {
			margin-top: 10px;
			width: 100px;
			height: 40px;
			align-content: center;
			background-color: palevioletred
		}
		.imgsize{
			width: 150px;
			height: 150px;
		}
		.disnone{
			display: none;
		}
	</style>
<script type="text/javascript">
	$(document).ready(function() {
		/*
			비동기 통신
				==> 웹서비스에서의 원칙은 클라이언트가 요청을 하면,
				서버는 클라이언트가 요청한 문서를 응답(전송)해준다. 
				그 후, 서버는 클라이언트와의 연결을 끊는다. 
				이런 통신방식을 단절형 통신이라고 한다. 즉, 웹서버는 단절형 통신이다. 

				그리고 서버가 전달한 문서는 클라이언트가 전송받은 문서와 동일해야한다. 
				이것을 동기형 이라고 한다. 

				반대로, 서버가 전달해준 문서와 클라이언트가 받은 문서를 일부분만 교체한 경우를
				비동기형 이라고 한다. 

				결론적으로, 비동기처리란 서버가 보내준 문서의 일부분만 서버와 통신하여
				새로 받아 교체하여 일부분만 교체하는 처리를 비동기처리라 한다. 
				영어로는 Ajax 라고 한다. 

				그런데 이 비동기 처리는 jQuery 에서 함수로 정의가 되어있다. 
					형식]
						$.ajax({
							url: '주소',								==> 요청주소
							type: 'get' | 'port',					==> 데이터 전송방식
							dataType: 'text | html | xml | json',	==>
							data: {
								넘겨줄 데이터 나열... 
								'변수이름':'' 데이터',
								'변수이름': '데이터',
								....... 
							},
							success: function(data){		==> 통신에 성공할 경우 실행할 함수
								성공했을 때 처리내용... 
							}
							error: function(){					==> 통신에 실패할 경우 실행할 함수
								실패시 처리내용... 
							}
						});
		*/
		$('#idck').click(function() {
			//할일 
			//1. 입력태그에 입력된 아이디를 가져오기
			var sid = $('#id').val();
			if(sid){
				$.ajax({
					url: '/clsProj/member/id.ck',
					type: 'post',
					dataType: 'json',
					data: {
						'id': sid
					},
					success: function(data){
						var result = data.cnt;
						if(result == 0){
							//해당 아이디는 사용 가능한 경우
							$('#idmsg').text('***사용가능한  아이디입니다.***');
							$('#idmsg').css('color', 'green');
							$('#idmsg').css('display', '');
						} else {
							//해당 아이디는 사용 불가능한 경우
							$('#idmsg').text('###사용할 수 없는 아이디입니다.###');
							$('#idmsg').css('color', 'red');
							$('#idmsg').css('display', '');
							$('#id').val();
							$('#id').focus();
						}
					},
					error: function(){
						alert('###통신 실패###');
					}
				});
			}else {
				$('#id').focus();
				return;
			}
		});
		$('#Joinbtn').click(function(){
			// 데이터 무결성 검사하고
			
			$('#frm').submit();
		});
		// 프사 미리보기
		   $('#upload').change(function(e){
		      var img = URL.createObjectURL(e.target.files[0]);
		      $('#img1').css('display', '');
		      $('#img1').attr('src', img);
		      $('#noimage').css('display','none');
		   });
	});
</script>
</head>
<body>
	<!-- <form method="get" action="JOinOutput.html" target="_blank" id="frm">
	</form> -->
	<div class="w3-col l3 m3">
		<p></p>
	</div>
	<div class="w3-col l6 m6 s12">
		<form class="w3-col" method="POST" action="/clsProj/member/joinProc.cls" id="frm" encType="multipart/form-data">
			<div class="w3-col w3-center bcolour w3-card w3-margin-top">
				<h2>Increpas Join</h2>
			</div>
			<div class="w3-col w3-padding w3-border w3-card w3-margin-top">
				<div class="w3-row">
					<label class="w3-col l3 m3 w3-right-align w3-padding" for="name">회 원 이 름 : </label>
					<div class="w3-col l9 m12 w3-padding">
						<input class="w3-col" type="text" id="name" name="name">
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="id">회원 아이디 : </label>
					<div class="w3-col m9 w3-padding">
						<div class="w3-col m9 pright">
							<input class="w3-col" type="text" id="id" name="id">
						</div>
						<div class="w3-col m3 w3-red w3-hover-orange w3-button w3-small w3-card btn1" id="idck" >ID Check
						</div>
						<p class="w3-col w3-center" id="idmsg" style="display: none;"></p>
						<div class="w3-col w3-center" id="idCont" style="display: none;">
							<h4 class="w3-col m6">I D : </h4><h4 class="w3-col m6" id="getId"></h4>
							<h4 class="w3-col m6">NAME : </h4><h4 class="w3-col m6" id="getName"></h4>
							<h4 class="w3-col m6">TEL : </h4><h4 class="w3-col m6" id="getTel"></h4>
							<h4 class="w3-col m6">MAIL : </h4><h4 class="w3-col m6" id="getMail"></h4>
							<!-- 
								문제]
									아이디 체크버튼을 클릭하였을 때, 입력한 아이디가 존재하면 해당 아이디의 정보를 조회해서
									idCont 태그에 추가하고 보여주세요. 
							 -->
						</div>
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="pw">비 밀 번 호 : </label>
					<div class="w3-col m9 w3-padding">
						<input class="w3-col" type="password" id="pw" name="pw">
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="repw">비밀번호확인 : </label>
					<div class="w3-col m9 w3-padding">
						<input class="w3-col" type="password" id="repw" name="reipw">
					</div>
				</div>
				<div class="w3-row">
					<div class="w3-col w3-center">
						<span id="pwcheck"></span>
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="profile">프로필 사진 : </label>
					<div class="w3-col m9 w3-padding" id="imgfr">
						<input class="w3-col" type="file" id="upload" name="upload" onchange="checkFile(this)">
						<div id="preview">
						<img class="w3-col imgwin1" id="noimage" src="../img/noimage.jpg" alt="Image" >
						<img class="w3-col imgwin1" id="img1" src="" alt="Image" style="display: none;">
		<!--프사
            <div class="w3-row">
               <label class="w3-col m3 w3-right-align w3-padding" for="file">프사 :</label>
               <div class="w3-col m9 w3-padding">
                  <input class="w3-col m12" type="file" id="file" name="file"/>
               </div>
               <div class="w3-row w3-center" >
                  <img id="img" style="width: 100px; height: auto;" src="" />
               </div>
            </div> -->
						</div>
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="mail">회원 이메일 : </label>
					<div class="w3-col m9 w3-padding">
						<input class="w3-col" type="text" id="mail" name="mail">
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="tel">전 화 번 호 : </label>
					<div class="w3-col m9 w3-padding">
						<input class="w3-col" type="text" id="tel" name="tel">
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="gen">성 별 : </label>
					<div class="w3-col m9 w3-padding">
						<div class="w3-half">
							<input type="radio" id="mgen" name="gen" value="M"><label for="mgen"> 남 자</label></span>
						</div>
						<div class="w3-half">
							<input type="radio" id="wgen" name="gen" value="F"><label for="wgen"> 여 자</label>
						</div>
					</div>
				</div>
				<div class="w3-row" id="avtfr">
					<label class="w3-col m3 w3-right-align w3-padding" for="avt">아바타 선택 : </label>
					<div class="w3-col m9 w3-padding">
						<div class="w3-row" id="mavt">
							<div class="avatfr">
								<div class="w3-col dnone" id="img123">
									<img class="w3-third imgwin" name="img2" src="../img/img_avatar1.png" alt="Image">
									<img class="w3-third imgwin" id="img3" src="../img/img_avatar2.png" alt="Image">
									<img class="w3-third imgwin" id="img4" src="../img/img_avatar3.png" alt="Image">
								</div>
								<div class="w3-col dnone" id="img456">
									<img class="w3-col imgwin" id="img5" src="../img/img_avatar4.png" alt="Image">
									<img class="w3-col imgwin" id="img6" src="../img/img_avatar5.png" alt="Image">
									<img class="w3-col imgwin" id="img7" src="../img/img_avatar6.png" alt="Image">
								</div>
							</div>
							<input class="w3-col imgwin2" type="radio" id="avt" name="avt">
							<input class="w3-col imgwin3" type="radio" id="avt" name="avt">
							<input class="w3-col imgwin4" type="radio" id="avt" name="avt">
						</div>
					</div>
				</div>
				<div class="w3-row">
					<label class="w3-col m3 w3-right-align w3-padding" for="birth">생 년 월 일 : </label>
					<div class="w3-col m9 w3-padding">
						<input class="w3-col" type="date" id="birth" name="birth">
					</div>
				</div>
				<div class="w3-row">
					<div class="w3-col">
						<input class="w3-col m12 btn2" type="button" value="Join" id="Joinbtn">
						<input class="w3-col m12 btn2" type="button" value="HOME">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	// upload 파일 미리보기
	/*
	var upload = document.querySelector('#upload');
	upload.addEventListener('change',function(e){
		var get_file = e.target.files;
		console.log(get_file)
	});
	*/
	/*
		// 서버경로가 아닌 경로로 했을 때 에러난다.
	    var upload = document.querySelector('#upload');
    var preview = document.querySelector('#preview');
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
 
        image.src = get_file[0].name
 
        preview.appendChild(image)
    })
		[출처] Javascript : 업로드 하기전에 이미지 미리보기|작성자 Demnodey

	*/
	
	//경로 에러를 막기 위해선 FileReader객체를 사용해야한다
/*	var upload = document.querySelector('#upload');
	var preview = document.querySelector('#preview');
	upload.addEventListener('change',function(e){
		var get_file = e.target.files;
		// console.log(get_file)
		var image = document.createElement('img');
		image.className ="imgsize cnt";

		// FileReader 객체 생성 
		var reader = new FileReader();
		// reader 시작시 함수 구현
		reader.onload = (function(aImg){
			console.log(1);
			
			return function(e){
				console.log(3);
				// base64 인코딩 된 스트링 데이터
				aImg.src = e.target.result
			}
		})(image)
		
		if(get_file){
			*//*
				get_file[0]을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 onload에 설정했던 return으로 넘어간다.
				이와 함께 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
			*/
      /*reader.readAsDataURL(get_file[0]);
			console.log(2);
			$('#img1').css('display','none');
		}
	    preview.appendChild(image);
    })*/
	/*
	  FileReader 응용
	   var upload = document.querySelector('#upload');
	    var upload2 = document.querySelector('#upload2');
	 
	     // FileReader 객체 생성
	    var reader = new FileReader();
	 
	        // reader 시작시 함수 구현
	    reader.onload = (function () {
	 
	        this.image = document.createElement('img');
	        var vm = this;
	        
	        return function (e) {
	            // base64 인코딩 된 스트링 데이터 
	            vm.image.src = e.target.result
	        }
	    })()
	 
	    upload.addEventListener('change',function (e) {
	        var get_file = e.target.files;
	 
	        if(get_file){
	            reader.readAsDataURL(get_file[0]);
	        }
	 
	        preview.appendChild(image);
	    })
		[출처] Javascript : 업로드 하기전에 이미지 미리보기|작성자 Demnodey
	*/
		
	document.getElementById('upload').onchange = function (evt) {
		//   alert(evt);
		var file = this.files;


		/* // 문자열로 해결하는 방법
		var val1 = val.slice(val.indexOf(".")).toLowerCase();

		if (val1 != ".jpg" && val1 != ".jpeg" && val1 != ".png" && val1 != ".gif") {
			alert("썸네일 이미지는 파일( jpg,jpeg,png,gif)만 등록가능합니다");

			return;
		} */
		if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

		// 체크를 통과했다면 종료.
		else{
			return;
		} 


		// 정규표현식으로 해결하는 방법
		// 후방탐색으로 해결
		var reg = /^.+(?<=\.(jpg|jpeg|png|gif))$/i;
		var bool = reg.test(val);
		var el = document.getElementById('imgfr');
		if (bool) {
			var bool2 = el.classList.contains('dnone');
			if (bool2) {
				el.classList.remove('dnone');
			} else {
				el.classList.add('dnone');
			}
		} else {
			el.classList.add('dnone');
			this.value = '';
			return;
		}

		  alert(val);
		  location.href = 'Test01.html?upload=' + val;

		// 파일을 선택하는 경우 파일태그의 value 값은 거짓경로와 파일이름이 입력이되고
		// 파일의 내용은 URL객체에 해당파일을 선택하는 순간 저장이 된다.
		// 따라서 파일을 사용하려면 URL객체에서 꺼내서 사용해야 한다.

		/*
		   문제]
			  선택한 파일이 jpg, jpeg, png, gif 인 파일만 입력이 되게 처리하세요.
		 */


		// 파일 가져오고
		var vfile = URL.createObjectURL(evt.target.files[0]);
		// img 태그 src 속성 처리
		document.getElementById('img1').setAttribute('src', vfile);
		// 태그의 클래스 변경하고
		document.getElementById('imgfr').classList.remove('dnone');
	}


	document.getElementById('mgen').onclick = function () {
		if (mgen.checked) {
			document.getElementById('img123').classList.remove('dnone');
			document.getElementById('img456').classList.add('dnone');
		}

	}


	document.getElementById('wgen').onclick = function () {
		if (wgen.checked) {
			document.getElementById('img456').classList.remove('dnone');
			document.getElementById('img123').classList.add('dnone');
		}
	}
});
</script>

</html>