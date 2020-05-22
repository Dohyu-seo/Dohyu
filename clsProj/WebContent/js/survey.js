$(function(){
	$('#sbtn').click(function(){
		$('#frm1').submit();
	});
	
	$('#cbtn').click(function(){
		$(location).attr('href', '/clsProj/main.cls');
	});
	
	// 설문정보 등록 버튼 
	$('#addIbtn').click(function(){
		 // 데이터 유효성 검사
		var stitle = $('#title').val();
		var sstart = $('#start').val();
		var send = document.getElementById('end').value;
		if(!stitle || !sstart || !send){
			alert('akdgoTEK');
			return;
		}

		$.ajax({
			url: "/clsProj/survey/surveyInfoProc.ck",
			type:"POST",
			dataType: "json",
			data: {
				"title": stitle,
				"start": sstart,
				"end": send
			},
			success: function(obj){
				var cnt = obj.cnt;
				var sino = obj.sino;
				$('#sino').val(sino);
				if(cnt == 1){
					$('.frm1').css('display','none');
					$('.frm2').css('display','');
				}
			},
			error: function(){
				alert('@&#통신에러#&@');
			}
		});
	});
	
	$('#daaQA').click(function(){
		var sino = $('#sino').val();
		var sq = $('#sq').val();
		var sa1 = $('#sa1').val();
		var sa2 = $('#sa2').val();
		var sa3 = $('#sa3').val();
		var sa4 = $('#sa4').val();
		if(!sino || !sq || !sa1 || !sa2 || !sa3 ||!sa4){return;}
		
		$ajax({
			url: "/clsProj/survey/surveyQAProc.ck",
			type: 'POST',
			dateType: 'json',
			data: {
				"sino" : sino,
				"sq" : sq,
				"sa1" : sa1,
				"sa2" : sa2,
				"sa3" : sa3,
				"sa4" : sa4
			},
			success: function(obj){
				var cnt = obj.cnt;
				if(cnt == 1 ){
					$('#sq').val('');
					$('#sa1').val('');
					$('#sa2').val('');
					$('#sa3').val('');
					$('#sa4').val('');
				}
			},
			error: function(){
				alert('통신에러###');
			}
		});
	});
});