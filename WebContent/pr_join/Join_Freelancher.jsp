<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>개인회원가입</title>
<link href="/pfinal/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="/pfinal/bootstrap/css/bootstrap-responsive.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<label class="brand">개인회원 가입하기</label>
		</div>
	</div>
	<form id="f1" method="post" action="/pfinal/pfinal.do"
		class="form-horizontal">
		<input type="hidden" name="command" value="join_client" /> <input
			type="hidden" name="cpcheck" value="0" />
		<div class="form-group">
			<label class="control-label">ID</label>
			<div class="icon"></div>
			<div class="controls">
				<input type="text" name="id" id="id" class="form-control"
					required="required" /> <input type="button" name="id_check" id="id_check"
					value="중복체크" class="form-control btn btn-warning" />
				<div id="idmessage" class="input">영문, 숫자, 언더바(_), 하이픈(-) 포함 3~16 문자</div>
			</div>
		</div>
		<br />
		<div class="form-group">
			<label class="control-label">PASSWORD</label>
			<div class="controls">
				<input type="password" name="pw" id="pw" class="form-control"
					required="required" />
			</div>
		</div>
		<br />
		<div class="form-group">
			<label class="control-label">PASSWORD CONFIRM</label>
			<div class="controls">
				<input type="password" name="pwConfirm" id="pwConfirm"
					class="form-control" required="required" />
			</div>
			<div id="confirmchk"></div>
		</div>
		<br />
		<div class="form-group">
			<label class="control-label">NAME</label>
			<div class="controls">
				<input type="text" name="name" id="name" class="form-control"
					required="required" />
			</div>
		</div>
		<br />
		<div class="form-group">
			<label class="control-label">EMAIL</label>
			<div class="controls">
				<input type="email" name="email" id="email" class="form-control"
					required="required" />
			</div>
		</div>
		<br />
		<div class="form-group">
			<label class="control-label">AGE</label>
			<div class="controls">
				<input type="text" name="age" id="age" class="form-control"
					required="required" />
			</div>
		</div>
		<br />
		<div class="form-group">
			<label class="control-label">TEL</label>
			<div class="controls">
				<input type="tel" name="tel" id="tel" class="form-control"
					required="required" />
			</div>
		</div>
		<br />
		<div class="form-group">
			<label class="control-label">GENDER</label>
			<div class="controls">
				<input type="radio" name="gender" value="0" checked="checked" />남자 <input
					type="radio" name="gender" value="1" />여자
			</div>
		</div>
		<hr />
		<div class="form-group">
			<div class="controls">
				<input type="submit" value="가입하기" class="btn" onclick="check()"/>
				<input type="button" value="취소" class="btn" />
			</div>
		</div>
	</form>
	<script>
	$(document).ready(function() {    
		var re_id = /^[A-Za-z0-9_-]{3,16}$/;
	    var re_pw = /^[A-Za-z0-9_-]{6,18}$/;
	    var re_name = /^[가-힝]{2,}$/;
	    var $form = $("#f1"), $id = $("[name=id]"), $pw = $("[name=pw]"), 
	    			$pw1 = $("[name=pwConfirm]"), $name = $("[name=name]");
	    var id_duplicate=true;
	    
	    
	    $("#id_check").click(function() { //중복체크아이디 클릭이벤트 
	    	jQuery.ajaxSetup({cache:false});
	        $.ajax({
	         url: "/pfinal/pr_join/idcheck.jsp",//아이디중복체크할페이지 지정
	         data : ({
	         userid: $("input[name=id]").val() //파라메터로 userid 이름으로 값은 사용자가 입력한 사용자아이디를 지정
	         }),
	         success: function (data){ //중복확인후의 값은 data로 들어온다.
	              
	        	if(re_id.test($id.val()) != true){
		        	   $('#idmessage').html("<font color=red>유효한 ID를 입력해주세요.</font>");
		        } 
	        	else if (jQuery.trim(data)=='YES'){ 
	               id_duplicate=false;
	               $('#idmessage').html("<font color=red>사용 가능합니다.</font>");
	               $('#idmessage').show();
	            }
	          
	           else{
	            $('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
	            $('#idmessage').show(); 
	 			 }
	        	$id.focus();
	           }});
	    }); // click 끝
	    
	    $form.submit( function() {
	    	//alert("test2");
	    	
			if (re_id.test($id.val()) != true) { // 아이디 검사
				alert('ID 입력 오류');
				$id.focus();
				return false;
			}  // if 끝
			else if(id_duplicate){		// 중복되는 아이디를 submit 할 때
				alert('ID 중복검사를 해주세요.');
				$id.focus();
				return false;
			}
			else if(re_name.test($name.val()) != true){
				alert('이름을 다시 입력해주세요.');
				$name.focus();
				return false;
			}
			else if(re_pw.test($pw.val()) != true) { // 비밀번호 유효성 검사
				alert('유효한 비밀번호를 입력해주세요.');
				$pw.focus();
				return false;
			}
			else if($pw.val()!=$pw1.val()){	 // 비밀번호 불일치	
				alert('패스워드가 일치하지 않습니다.');
				$pw.focus();
				return false;
			}
			else{
				var exit=false;
				$(".nullchk").each(function(index) {
				     if($(this).val() =="")
				     {
				      alert("비어있는 항목이 있습니다.");
				      $(".nullchk").eq(index).focus();
				      exit=true;
				      return false;
				     }
				});
				if(exit){
					return false;
				}
				alert("입력 완료");
				window.close();
			}	
	    });  // submit 끝
	  });	// ready 끝
	</script>
</body>
</html>