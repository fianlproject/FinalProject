<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.util.List"%>
<%@ page import="org.xml.sax.InputSource"%>
<%@ page import="org.jdom.Document" %>
<%@ page import="org.jdom.Element" %>
<%@ page import="org.jdom.input.SAXBuilder" %>
<%
    List list = null;
 
    try{
        SAXBuilder parser = new SAXBuilder();
        parser.setValidation(false);
        parser.setIgnoringElementContentWhitespace(true);
        //URL url = new URL("http://jsp.picomax.net/rss/sample.xml");
        //URL url = new URL("http://rss.hankooki.com/news/hk00_list.xml");
        //URL url = new URL("http://rss.etnews.com/Section901.xml");
        String rss = (String)session.getAttribute("rss");       
        URL url = new URL(rss);
        InputSource is = new InputSource(url.openStream());
        Document doc = parser.build(is);
 
        Element root = doc.getRootElement();
        Element channel = root.getChild("channel");
        list = channel.getChildren("item");
    }catch(Exception e){
        e.getStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agency - Start Bootstrap Theme</title>
	<!-- 달력!!! -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<!-- FullCalendar(jQuery API) -->
<link href='/pfinal/fullcalendar/fullcalendar.css' rel='stylesheet' />
<script src='/pfinal/fullcalendar/fullcalendar.js'></script>
<script>
	// FullCalnedar
	$(document).ready(function() {
<<<<<<< HEAD
		
			
=======
>>>>>>> branch 'master' of https://github.com/fianlproject/FinalProject.git
		
		$('#calendar').fullCalendar({
			height: 400,
			editable: true,
			events: "json-events.jsp",
			eventDrop: function(event, delta) {
				alert(event.title + ' was moved ' + delta + ' days\n' +
					'(should probably update your database)');
					},
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
			
		}).dblclick(function(){
			var popUrl = "/pfinal/schedule/calendaradd.jsp";	//팝업창에 출력될 페이지 URL
			var popOption = "width=350, height=300, resizable=no, scrollbars=no, status=no, top=250, left=900;";    //팝업창 옵션(optoin)
				window.open(popUrl,"",popOption);
		});
	// DatePicker
		$( ".datepicker" ).datepicker({
			dateFormat: 'yy-mm-dd' 
		});		
<<<<<<< HEAD
	});	
=======
	});
>>>>>>> branch 'master' of https://github.com/fianlproject/FinalProject.git
</script>
<script>
function fnCal() {
	window.open("schedule/Calendar.cl", "",
			"width=670, height=500");  
}
function fnMedia() {
	window.open("/pfinal/pfinal.do?command=m_media", "",
			"width=570, height=370");
}	
</script>
<style type="text/css">
#wrap{margin: 0 auto; padding: 20px;}
.calendar_body{width: 600px; float: left; margin-right: 20px;}

</style>
	<!-- 달력끝 -->
	
	
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
	#newMsg{
		height: 20px;
		width: 40px;
		margin-right: 10px;
		padding: 5px;
		border-radius: 50px;
		background-color: red;
		color: white;
		font-weight: bold;
	}
	#color1{
		color: black;		
	}
</style>
</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Start Project</a>
                <a class="navbar-brand page-scroll" href="#page-top"><%=session.getAttribute("name")%>님 환영합니다.</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">서비스</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">포트폴리오 관리</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#news">오늘의 뉴스</a> 
                    </li> 
                    <li>
                        <a class="page-scroll" href="http://localhost:8080/sa_board/login.do">커뮤니티로</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                
                <div class="intro-heading">방문을 환영합니다.</div>
                <form method="post" action="/pfinal/pfinal.do">
                	<button class="btn btn-xl" name="command" value="list">프로젝트 찾기</button>
                </form>
            </div>
        </div>
    </header>

    <!-- Services Section -->
    
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Services</h2>
                    
                </div>
            </div>
            <div class="row text-center">
            	<!-- 쪽지함 -->	
               <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-send fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">쪽지함</h4>
                    <form method="post" action="/pfinal/pfinal.do">
                   	 <button class="btn btn-link pl text-muted" name="command" value="message" >보관함</button>
                   	 <c:if test="${msg != 0 }" >
                   	 <span id="newMsg" >${msg }</span>
                   	 </c:if>
                    </form>
                </div>
                <!-- 쪽지함 -->	
                
                <!-- 관심 -->	
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">관심프로젝트</h4>
					<form method="post" action="/pfinal/pfinal.do">
						<button class="btn btn-link pl text-muted" name="command" value="inter">수정</button>
					</form>
				</div>
				<!-- 관심 -->	
				
				<!-- 마이페이지 -->	
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">마이페이지</h4>
					<form method="post" action="/pfinal/pfinal.do">
						<button class="btn btn-link pl text-muted" name="command" value="mylist">수정</button>						
					</form>
					
				</div>
				<!-- 마이페이지 -->	
				
				<!-- 스케줄 -->				
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-lock fa-stack-1x fa-calendar"></i>
                    </span>
                    <h4 class="service-heading">스케줄</h4>
                    <button class="btn btn-link pl text-muted" onclick="fnCal()">보기1</button>
					<!-- <form method="post" action="schedule/Calendar.cl">
						<button class="btn btn-link pl text-muted" id="popup">보기1</button>						
					</form> -->
				</div>				
				<!-- 스케줄 -->
				
            </div>
        </div>
    </section>
    

    <!-- Portfolio Grid Section -->
    <section id="portfolio" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">등록한 포트폴리오</h2>                    
                </div>
            </div>
            <div class="row">
        	<!-- 없으면  -->
            <c:if test="${requestScope.flag==false}" >
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="/pfinal/pfinal.do?command=mypage" class="portfolio-link" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                      	<img src="img/portfolio/no_content.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>등록하기</h4>
                        <p class="text-muted">　</p>
                    </div>
                </div>
                </c:if>
                <!-- 없으면 -->
                <!-- 있으면 -->
                <c:if test="${requestScope.flag==true}" >
                <c:forEach items="${vector}" var="pDto">
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href=".${pDto.title }" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <div class="crop">
                        <img src="upload/${pDto.main_image }" alt="${pDto.contents }">
                        </div>
                    </a>
                    <div class="portfolio-caption">
                        <h4>${pDto.title}</h4>
                        <p class="text-muted">
                        <c:if test="${pDto.category == 2 }" var="category">개발</c:if>
                        <c:if test="${pDto.category == 1 }" var="category">디자인</c:if>
                        </p>
                    </div>
                </div>
                </c:forEach>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="/pfinal/pfinal.do?command=mypage" class="portfolio-link" >
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                      	<img src="img/portfolio/no_content.png" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>등록하기</h4>
                        <p class="text-muted">　</p>
                    </div>
                </div>
                </c:if>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="news">
        <div class="container">
            <div class="row">
            	
                <div class="col-lg-12 text-left" >

                	 <h2 class="section-heading">오늘의 뉴스(${media_name})</h2>
                	 <button class="btn btn-link pl text-muted" onclick="fnMedia()">신문사 변경</button>
                <ul>                	
					<%
					    if(list!=null){
					        for(int i=0; i<list.size(); i++){
					            Element el = (Element) list.get(i);
					%>
						<li class="timeline-inverted"><a class="text-mute" href='<%=el.getChildText("link")%>' target=_news> <%=el.getChildText("title")%></a></li>
							<% 
					        }
					    }else{
					%>
							<li>잠시 후 다시 접속하여 주십시오.</li>
							<%
					    }
					%>
					</ul>
                </div>
            </div>           
        </div>
    </section>

    

    <!-- Portfolio Modals -->
    <!-- Use the modals below to showcase details about your portfolio projects! -->

    <c:forEach items="${vector}" var="pDto">
    <div class="portfolio-modal modal fade ${pDto.title }"  tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>${pDto.title }</h2>
                            <img class="img-responsive" src="upload/${pDto.main_image }" alt="" align="center">
                            <div>
                            	${pDto.contents }
                            </div>
                            <br/>
                            <ul class="list-inline">
                                <li>${pDto.start } - ${pDto.end }</li>
                                <c:if test="${pDto.category == 1 }">
                                <li>Category: 디자인</li>
                                </c:if>
                                <c:if test="${pDto.category == 2 }">
                                <li>Category: 개발</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  1}">
                                <li>Category_Detail: 웹</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  2}">
                                <li>Category_Detail: 애플리케이션</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  3}">
                                <li>Category_Detail: 워드프레스</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  4}">
                                <li>Category_Detail: 퍼블리싱</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  5}">
                                <li>Category_Detail: 커머스, 쇼핑몰</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  6}">
                                <li>Category_Detail: 일반 소프트웨어</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  7}">
                                <li>Category_Detail: 임베디드</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  8}">
                                <li>Category_Detail: 기타</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  9}">
                                <li>Category_Detail: 웹</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  10}">
                                <li>Category_Detail: 애플리케이션</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  11}">
                                <li>Category_Detail: 제품</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  12}">
                                <li>Category_Detail: 프레젠테이션</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  13}">
                                <li>Category_Detail: 인쇄물</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  14}">
                                <li>Category_Detail: 커머스, 쇼핑몰</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  15}">
                                <li>Category_Detail: 로고</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  16}">
                                <li>Category_Detail: 영상</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  17}">
                                <li>Category_Detail: 그래픽</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  18}">
                                <li>Category_Detail: 기타</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  19}">
                                <li>Category_Detail: 게임</li>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  20}">
                                <li>Category_Detail: 게임</li>
                                </c:if>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>

</body>

</html>
