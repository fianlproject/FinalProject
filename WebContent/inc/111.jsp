<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	
</style>
 <%@include file="css_and_js.jsp" %>

  <style>
  	body{margin-top:50px;margin-left: 200px}
  </style>


<body>
 <div class="container">
	<div class="row">
<form method="post" action="/semi/semi.do">
	<c:set var="i" value="${login}" /> 
	<c:set var="j" value="${loginNum}" /> 

	<nav class="navbar navbar-fixed-top navbar-inverse" style="color: black; background-color: white;">
		<div class="navbar-inner" style="color: black; background-color: white;">
			<div class="brand" style="color: black; background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;ERP</div>
<!-- 			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse" >
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a> -->

<!-- 				<div class="nav-collapse collapse" > -->
				<ul class="nav">
					<li class="divider-vertical" ></li>
					<c:if test="${i == 4 || (i==3 && j==10)}">					
						<li><button class="btn btn-link home" name="command" value="master" >home</button></li>
					</c:if>
					
					<c:if test="${i==1 || i==2 || i==3 }">
						<li><button class="btn btn-link home" name="command" value="user" >home</button></li>
					</c:if>
					<li><button class="btn btn-link jaego" name="command" value="jaego" >犁绊包府</button></li>		
					
					<c:if test="${i == 4 || (i==3 && j==10)}"> 
						<li><button class="btn btn-link insa" name="command" value="insa" >牢荤包府</button></li>
					</c:if>
				</ul>
	<!-- 		</div> -->

		</div>
	</nav>
</form>
</div>
</div>
</body>
<script>
$(document).ready(
		function(){
			$(".jaego").css("font-weight","bold").css("color","white").css("font-size","15px");
			$(".insa").css("font-weight","bold").css("color","white").css("font-size","15px");
			$(".home").css("font-weight","bold").css("color","white").css("font-size","15px");
		}		
	);
</script>

