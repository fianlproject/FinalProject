<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE HTML>
<html>
<head>
<title>프로젝트 등록</title>

<link href="/pfinal/bootstrap/css/bootstrap.css" rel="stylesheet"
	media="screen" />
<link href="/pfinal/bootstrap/css/bootstrap-responsive.css" />
<link href="/pfinal/css/bootstrap-responsive.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/pfinal/bootstrap/js/bootstrap.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">

<style type="text/css">
.form-control{
width: 30%;
}

</style>

</head>
<br/>
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 등록 <small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를
							만날 수 있습니다.</small>
					</h3>
				</div>

<form action="/pfinal/pfinal.do?command=projectupload" enctype="multipart/form-data" id="p5-fix-portfolio-form" method="POST">

<div class="content-inner">
	<input type="hidden" name="id" value="<%= session.getAttribute("id") %>" />
	<div class="content-header">
	<div class="form-group">
		<label class="control-label required" for="title"><span>*</span>제목</label>
		<div>
			<input required="required" id="p5-form-title" name="title" type="text" />
		</div>
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>카테고리</label>
		<div>
			<select required="required" id="p5-form-category" name="categoryId">
				<option selected="selected" value="">카테고리</option>
				<option value="2">개발</option>
				<option value="1">디자인</option>
			</select>
			<select required="required" id="p5-form-subcategory" name="subcategoryId">
				<option selected="selected" value="">세부 카테고리</option>
			</select>
		</div>
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>설명</label>
		<div>
			<textarea cols ="80" required="required" id="p5-form-description" name="description" rows="10"></textarea>
		</div>
		<span id="p5-form-description-information">한글 기준 5000자 미만</span>
	</div><br/>
	<div >
		<label class="control-label required" for="title"><span>*</span>참여
			시작일</label>
		<div >
			<select required="required" id="p5-form-begin-year" name="participationBeginYear" class="p5-date-select">
				<option selected="selected" value="" >연</option>
			</select>
			<select required="required" id="p5-form-begin-month" name="participationBeginMonth">
				<option selected="selected" value="">월</option>
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
		</div>
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>참여 종료일</label>
		<div>
			<select required="required" id="p5-form-end-year" name="participationEndYear" class="p5-date-select">
				<option selected="selected" value="">연</option>
			</select>
			<select required="required" id="p5-form-end-month" name="participationEndMonth" >
				<option selected="selected" value="">월</option>
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
		</div>
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>참여율</label>
		<div>
			<input data-slider-max="100" data-slider-min="1" data-slider-selection="before" data-slider-step="1"
				id="p5-form-participation-rate" name="participationRate" required=""
				type="text" value="" />
			<span>%</span>
		</div>
		<span id="p5-participation-rate-infomation">참여율은 1에서 100까지 정수로 입력할 수
			있습니다.</span>
	</div><br/>
	<div>
		포트폴리오 이미지는 가로 632px로 변환되어 보여집니다.<br /> 이미지 파일(.jpg, .jpeg, .png, .gif
		등)만 업로드할 수 있습니다.<br /> 파일 크기는 최대 5MB까지 업로드가 가능합니다.<br />
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>대표 이미지</label>
		<div>
			<div>
				<span id="p5-image-name-1" class="p5-img-name ">이미지를 등록해주세요.</span>
				<span>
				<button class="btn btn-lg btn-client">	이미지 변경</button> 
				<input accept="image/*" id="p5-file-btn-1" name="image1" type="file" />
					<button class="btn btn-lg btn-default" id="p5-img-del-btn">삭제</button></span>
			</div>
		</div>
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>한 줄 설명</label>
		<div>
			<input id="p5-img1-description" name="caption1" type="text" />
		</div>
		<span id="p5-caption1-infomation">한글 기준 120자 미만</span>
	</div><br/><br/>
	<div >
		<label class="control-label required" for="title"><span>*</span>이미지</label>
		<div>
			<div>
				<span id="p5-image-name-2" class="p5-img-name">이미지를 등록해주세요.</span>
				<span>
				<button class="btn btn-lg btn-client">	이미지 변경</button> 
					<input accept="image/*" id="p5-file-btn-2" name="image2" type="file" />
				<button class="btn btn-lg btn-default" id="p5-img-del-btn">삭제</button></span>
			</div>
		</div>
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>한 줄 설명</label>
		<div>
			<input id="p5-img2-description" name="caption2" type="text" />
		</div>
		<span id="p5-caption2-infomation">한글 기준 120자 미만</span>
	</div><br/><br/>
	<div>
		<label class="control-label required" for="title"><span>*</span>이미지</label>
		<div>
			<div>
				<span id="p5-image-name-3" class="p5-img-name">이미지를 등록해주세요.</span> 
				<span	>
				<button class="btn btn-lg btn-client">	이미지 변경</button> 
				<input accept="image/*" id="p5-file-btn-3" name="image3" type="file" />
					<button class="btn btn-lg btn-default" id="p5-img-del-btn">삭제</button></span>
			</div>
		</div>
	</div>
	<div>
		<label class="control-label required" for="title"><span>*</span>한 줄 설명</label>
		<div>
			<input id="p5-img3-description" name="caption3" type="text" />
		</div>
		<span id="p5-caption3-infomation">한글
			기준 120자 미만</span>
	</div><br/><br/>
	<div>
		<label class="control-label required" for="title"><span>*</span>태그</label>
		<div>
			<ul id="p5-tag-form-unit-group">
				<li><input id="p5-form-tag-input" name="tagList" type="text" /></li>
			</ul>
		</div>
		<span>다수의 관련 기술을 입력 할때에는
			쉼표(,)로 구분해 주세요. (최대 5개)<br />예) Photoshop, Android, HTML5, Python,
			Django
		</span>
	</div><br/>
	<span ><button class="btn btn-lg btn-client" id="p5-portfolio-cancel-btn">추가</button>
	</span>
	
</form><br/><br/>
<form method="post" action="/pfinal/pfinal.do">
			<button class="btn btn-lg btn-default js-disable-on-click" name="command" value="free_index">홈으로</button>
	</form>
</div>
</div>
</div>
</div>
</div>
<div id="push"></div>
<script>
    $(document).ready( function() {
	
    	var tagCnt=0;
    	
        var d = new Date();
        for(var i=0;i < 30; i++) {
            var temp = '<option value="'+(parseInt(d.getFullYear())-i)+'">'+
                            (parseInt(d.getFullYear())-i)+'년'+
                        '</option>';
            $('.p5-date-select').append(temp);
        }

        $('.content-inner').on('change','#p5-form-category', function() {
            getSubCategory(this);
        });


        //textarea 문자열 길이
        $('.content-inner').on('keyup','#p5-form-description', function(e) {
            if($(this).val().length > 5000) {
                $('#p5-form-description-information').css('color','#f33d12');
                setTimeout( function() {
                    $('#p5-form-description-information').css('color','#999');
                }, 600);
                $(this).val($(this).val().substr(0,5000));
            } else {
                $('#p5-form-description-information').css('color','#999');
            }
        });

        //tag text
        $('.content-inner').on('keyup', '#p5-form-tag-input', function(event) {


            if(event.which==188||event.which==32) {
                if($('#p5-tag-form-unit-group').children().length < 6) {
                    var valid = true;

                    //30자 넘어가는지 검사
                    if($(this).val().length > 30 ) {
                        valid = false;
                        $(this).val("");
                    }

                    //중복문자 검사
                    for(var i=0;i < $('#p5-tag-form-unit-group').children().length; i++) {
                        if($('#p5-tag-form-unit-val').eq(i).text().trim() === $(this).val().replace(',','').trim()) {
                           //중복된 태그 백그라운드 색 잠시 바꿈
                            var temp = $('#p5-tag-form-unit-val').eq(i).parent();
                            temp.css('background-color','#fffc9a');
                            setTimeout( function() {
                                temp.css('background-color','#fff');
                            }, 700);
                            valid = false;
                            break;
                        }
                    }

                    if(valid == true) {
                        var tag = '<li><div><span id="p5-tag-form-unit-val">'+$(this).val().replace(',','')+'</span><a href="#" id="p5-form-tag-delete-btn">x</a></div><input type="hidden" name="tagList" value="'+$(this).val().replace(',','')+'"></li>';
                        tag += '<li><input id="p5-form-tag-input" name="title" type="text"></li>';
                        tagCnt++;
                        $(this).parent().remove();
                        $('#p5-tag-form-unit-group').append(tag);

                        $('#p5-form-tag-input').focus();

                    }
                   
                }

            }
        });

        $('.content-inner').on('keydown', '#p5-form-tag-input', function(event) {
            if(event.which==8&&$(this).val()==""&&tagCnt!=0) {//backspace
                $('#p5-tag-form-unit-group li:nth-child('+tagCnt+')').remove();
                tagCnt--;
            }
        });

        //tag delete btn
        $('.content-inner').on('click','#p5-form-tag-delete-btn', function(e) {
            e.preventDefault();
            $(this).parent().parent().remove();
        });


        //img delete btn
        $('.content-inner').on('click','#p5-img-del-btn',function() {

            if($(this).siblings('input').attr('name')=='image1') {
                var imgAssignTag = '<button>이미지 변경</button>'+
                                   ' <input id="p5-file-btn-1" type="file" name="image1"  accept="image/*">'+
                                   '<button id="p5-img-del-btn">삭제</button>';
                                   
                $('#p5-img1-description').attr('disabled',true);
                $('#p5-img1-description').val('');
                $('#p5-image-name-1').html('이미지를 등록해주세요.');
                $('#p5-file-btn-1').parent().html(imgAssignTag);
            } else if ($(this).siblings('input').attr('name')=='image2') {
                var imgAssignTag = '<button>이미지 변경</button>'+
                                   ' <input id="p5-file-btn-2" type="file" name="image2"  accept="image/*">'+
                                   '<button id="p5-img-del-btn">삭제</button>';

                $('#p5-img2-description').attr('disabled',true);
                $('#p5-img2-description').val('');
                $('#p5-image-name-2').html('이미지를 등록해주세요.');
                $('#p5-file-btn-2').parent().html(imgAssignTag);
            } else if ($(this).siblings('input').attr('name')=='image3') {
                var imgAssignTag = '<button>이미지 변경</button>'+
                                   ' <input id="p5-file-btn-3" type="file" name="image3"  accept="image/*">'+
                                   '<button id="p5-img-del-btn">삭제</button>';
                $('#p5-img3-description').attr('disabled',true);
                $('#p5-img3-description').val('');
                $('#p5-image-name-3').html('이미지를 등록해주세요.');
                $('#p5-file-btn-3').parent().html(imgAssignTag);
            }

            $(this).siblings('input').val("");
            $(this).parent().siblings('.p5-img-name').html("이미지를 등록해주세요.");
        });

        //이미지 선택 버튼들
        $('.content-inner').on('change','#p5-file-btn-1', function() {
            if($('#p5-file-btn-1').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-1').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-1');
                $('#p5-img1-description').attr('disabled',false); //캡션 해제


            }
        });

        $('.content-inner').on('change','#p5-file-btn-2', function() {
             if($('#p5-file-btn-2').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-2').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-2');
                $('#p5-img2-description').attr('disabled',false); //캡션 해제

            }
        });

        $('.content-inner').on('change','#p5-file-btn-3', function() {
             if($('#p5-file-btn-3').val()==='') {
                //donothing
            } else {
                $('#p5-image-name-3').html($(this).val().split(/(\\|\/)/g).pop());
                image=document.getElementById('p5-file-btn-3');
                $('#p5-img3-description').attr('disabled',false); //캡션 해제

            }
        });
        //참여율 에러 체크
        $('.content-inner').on('keyup','#p5-form-participation-rate', function() {
            var temp = $('#p5-form-participation-rate').val();

            if(temp <= 100 && temp >= 1 && parseInt(temp) == temp) {
                $('#p5-participation-rate-infomation').css('color', '#555');
            } else {
                $('#p5-participation-rate-infomation').css('color', 'red');
            }
        });

        //이미지 캡션 에러 체크
        $('.content-inner').on('keyup','#p5-img1-description', function() {
            var temp = $('#p5-img1-description').val().length;

            if(temp <= 119) {
                $('#p5-caption1-infomation').css('color', '#555');
            } else {
                $('#p5-caption1-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption1-infomation').css('color','#999');
                }, 600);
                $('#p5-img1-description').val($('#p5-img1-description').val().substr(0,119));
            }
        });


        $('.content-inner').on('keyup','#p5-img2-description', function() {
            var temp = $('#p5-img2-description').val().length;

            if(temp <= 119) {
                $('#p5-caption2-infomation').css('color', '#555');
            } else {
                $('#p5-caption2-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption2-infomation').css('color','#999');
                }, 600);
                $('#p5-img2-description').val($('#p5-img2-description').val().substr(0,119));
            }
        });

        $('.content-inner').on('keyup','#p5-img3-description', function() {
            var temp = $('#p5-img3-description').val().length;

            if(temp <= 119) {
                $('#p5-caption3-infomation').css('color', '#555');
            } else {
                $('#p5-caption3-infomation').css('color', '#f33d12');
                setTimeout( function() {
                    $('#p5-caption3-infomation').css('color','#999');
                }, 600);
                $('#p5-img3-description').val($('#p5-img3-description').val().substr(0,119));
            }
        });


        $('.content-inner').on('click','#p5-submit-portfolio-btn', function(e) {
            e.preventDefault();
            var particiPationValid = $('#p5-form-participation-rate').val();
            var img1DescriptionValid = $('#p5-img1-description').val().length;
            var img2DescriptionValid = $('#p5-img1-description').val().length;
            var img3DescriptionValid = $('#p5-img1-description').val().length;
            var validation = true;

            //var fd = new FormData();
            var tagList= [];
            //tagList check
            if(notInValue('p5-form-title')) {
                validation = false;
            }
            if(notInValue('p5-form-category')) {
                validation = false;
            }
            if(notInValue('p5-form-subcategory')) {
                validation = false;
            }
            if(notInValue('p5-form-description')) {
                validation = false;
            }
            if(notInValue('p5-form-begin-year')) {
                validation = false;
            }
            if(notInValue('p5-form-begin-month')) {
                validation = false;
            }
            if(notInValue('p5-form-end-year')) {
                validation = false;
            }
            if(notInValue('p5-form-end-month')) {
                validation = false;
            }
            if(notInValue('p5-form-participation-rate')) {
                validation = false;
            }
            if(parseInt($('#p5-form-begin-year').val()) === parseInt($('#p5-form-end-year').val())){
                if(parseInt($('#p5-form-begin-month').val()) > parseInt($('#p5-form-end-month').val())){

                    $('#p5-form-begin-year').parent().addClass('has-error');
                    $('#p5-form-begin-month').parent().addClass('has-error');
                    $('#p5-form-end-year').parent().addClass('has-error');
                    $('#p5-form-end-month').parent().addClass('has-error');
                    validation = false;
                }
            }


            if(parseInt($('#p5-form-begin-year').val()) > parseInt($('#p5-form-end-year').val())) {

                $('#p5-form-begin-year').parent().addClass('has-error');
                $('#p5-form-begin-month').parent().addClass('has-error');
                $('#p5-form-end-year').parent().addClass('has-error');
                $('#p5-form-end-month').parent().addClass('has-error');
                validation = false;
            }

            if(particiPationValid > 100 || particiPationValid < 1 || parseInt(particiPationValid) != particiPationValid) {
                 validation = false;
            }

            if(img1DescriptionValid >= 120) {
                 validation = false;
            }

            if(img2DescriptionValid >= 120) {
                 validation = false;
            }

            if(img2DescriptionValid >= 120) {
                 validation = false;
            }

            if(validation == false) {
                return 0;
            }

//             $('input[name="slug"]').val(slug);
//             $('input[name="dataId"]').val(0);
//             $('input[name="isImage1Changed"]').val(1);
//             $('input[name="isImage2Changed"]').val(1);
//             $('input[name="isImage3Changed"]').val(1);
            $('#p5-form-tag-input').remove();

            document.forms["p5-fix-portfolio-form"].submit();

        });
    });

    function getSubCategory(dom) {
        var temp='';

        if($(dom).val()==2) { //개발
                temp = '<option selected="selected" value="">세부 카테고리</option>' +
                        '<option value="1">웹</option>'+
                        '<option value="2">애플리케이션</option>'+
                        '<option value="3">워드프레스</option>'+
                        '<option value="4">퍼블리싱</option>'+
                        '<option value="5">커머스, 쇼핑몰</option>'+
                        '<option value="6">일반 소프트웨어</option>'+
                        '<option value="7">임베디드</option>'+
                        '<option value="8">기타</option>'+
                        '<option value="19">게임</option>';
                $('#p5-form-subcategory').html(temp);
            } else if($(dom).val()==1) {//디자인
                temp = '<option selected="selected" value="">세부 카테고리</option>' +
                        '<option value="9">웹</option>'+
                        '<option value="10">애플리케이션</option>'+
                        '<option value="11">제품</option>'+
                        '<option value="12">프레젠테이션</option>'+
                        '<option value="13">인쇄물</option>'+
                        '<option value="14">커머스, 쇼핑몰</option>'+
                        '<option value="15">로고</option>'+
                        '<option value="17">그래픽</option>'+
                        '<option value="16">영상</option>'+
                        '<option value="20">게임</option>'+
                        '<option value="18">기타</option>';
                $('#p5-form-subcategory').html(temp);
            } else { //선택 제대로 안됐을 때
                temp = '<option selected="selected" value="">세부 카테고리</option>'
                $('#p5-form-subcategory').html(temp);
            }

    }

    function decodeSubCategory( subCategoryValue ) {
        if (subCategoryValue == 101) return 1; //웹
        if (subCategoryValue == 102) return 2; //애플리케이션
        if (subCategoryValue == 103) return 3; //워드프레스
        if (subCategoryValue == 104) return 4; //퍼블리싱
        if (subCategoryValue == 106) return 5; //커머스, 쇼핑몰
        if (subCategoryValue == 105) return 6; //일반 소프트웨어
        if (subCategoryValue == 108) return 7; //임베디드
        if (subCategoryValue == 109) return 8; //기타

        if (subCategoryValue == 201) return 9; //웹
        if (subCategoryValue == 202) return 10; //애플리케이션
        if (subCategoryValue == 203) return 11; //제품
        if (subCategoryValue == 204) return 12; //프레젠테이션
        if (subCategoryValue == 205) return 13; //인쇄물
        if (subCategoryValue == 206) return 14; //커머스, 쇼핑몰
        if (subCategoryValue == 207) return 15; //로고
        if (subCategoryValue == 209) return 16; //영상
        if (subCategoryValue == 208) return 17; //그래픽
        if (subCategoryValue == 211) return 18; //기타
        if (subCategoryValue == 107) return 19; //게임
        if (subCategoryValue == 210) return 20; //게임
    }

    function notInValue(formID) {
        if($('#'+formID).val()==""||$('#'+formID).val()==null||$('#'+formID).val()==undefined) {

            $('#'+formID).parent().addClass("has-error");
            //$('#'+formID).css('border-color', '#f33d12');
            $('#'+formID).addClass('error');
            $('#'+formID).parent().children('#form-error').remove();
            $('#'+formID).parent().append('<span id="form-error"><i class="fa fa-exclamation-circle"></i> 이 항목은 필수입니다.</span>');
            return true;
        } else {
            $('#'+formID).parent().removeClass("has-error");
            //$('#'+formID).css('border-color', '#f33d12');
            $('#'+formID).removeClass('error');
            $('#'+formID).parent().children('#form-error').remove();
            return false;
        }
    }
</script>
<script>

$( document ).ready(function($) {
    var p5TotalSubNavigationFlag = 0;


	if ( $( window ).width() >= 1200 ) {
		$( '.p5-side-nav-deactive' ).css( 'display', 'none' );
	} else  {
		$( '.p5-side-nav-active' ).css( 'display', 'none' );
		$( '.p5-side-nav-deactive' ).css( 'display', 'block');
	}

	$('.content-inner').on('click', '.p5-side-nav-active-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'none' );
		$('.p5-side-nav-deactive').css('display','block');
	});

	$('.content-inner').on('click', '.p5-side-nav-deactive-btn', function () {
		$('.p5-side-nav-active').css( 'display', 'block' );
		$('.p5-side-nav-deactive').css('display','none');
	});


    $( window ).scroll ( function () {
		if ( $(window).scrollTop() > 87 && p5TotalSubNavigationFlag === 0) {
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').removeClass('hide fadeOut');
				$('#p5-total-sub-navigation-wrapper').addClass('fadeInDown');
			}, 200 );
			flag = 1;


		} else if ( $(window).scrollTop() <= 87 ){
			p5TotalSubNavigationFlag = 0;
			$('#p5-total-sub-navigation-wrapper').removeClass('fadeInDown');
			$('#p5-total-sub-navigation-wrapper').addClass('fadeOut');
			setTimeout(function() {
				$('#p5-total-sub-navigation-wrapper').addClass('hide');
			}, 200 );
		}
	});
});

</script>
</body>
</html>