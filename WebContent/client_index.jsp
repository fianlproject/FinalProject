<%@page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<html lang="ko">

<head>
<script>
function fnMedia() {
	window.open("/pfinal/pfinal.do?command=m_media", "",
			"width=600, height=300 , scrollbars=no,  resizable=no");
}	
</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agency - Start Bootstrap Theme</title>

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

</head>

<body id="page-top" class="index">


    <!-- Navigation -->
<form method="post" action="/pfinal/pfinal.do">
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
                <a class="navbar-brand page-scroll" href="#page-top">클라이언트 메인</a>               
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav navbar-right">
	                    <li class="hidden">
	                        <a href="#page-top"></a>
	                    </li>
	                    <li>
	                        <button class="btn btn-link pl" name="command" value="cl_prolist_test" >임시 프로젝트</button>
	                    </li>
	                    <li>
	                        <button class="btn btn-link pl" name="command" value="prwrite" >프로젝트 등록</button>
	                    </li>
	                    <li>
	                        <button class="btn btn-link pl" name="command" value="list" >프로젝트 리스트</button>
	                    </li>
	                    <li>
	                        <a class="page-scroll btn btn-link pl" href="#news">오늘의 뉴스</a>					
	                    </li>
	                    <li>
	                        <a class="page-scroll" href="#contact">임시3</a>
	                    </li>
	                </ul>
	            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</form>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                
                <img src="/pfinal/img/intro_logo.png"/>
                
            </div>
        </div>
    </header>

 <body class="project-list">

 <!-- About Section -->
    <section id="news1" >
        <div class="container">
            <div class="row">
				<c:if test="${!empty prolist }">
				<table class="table">
						<thead>
						<thead>
							<tr>
								<td colspan="6" align="center" style="font-size: large; background-color: green">협상중 프로젝트 목록</td>
							</tr>
							<tr>
								<th>지원자</th>
								<th>프로젝트</th>
								<th>희망금액</th>
								<th>희망기간</th>
								<th>지원내용</th>
								<th>지출금액</th>
								<th>예상기간</th>
								<th>상태</th>							
								<th>확인</th> 							
							</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${prolist}">
									<c:if test="${i.cl_del == 0 }">
										<tr>
											<c:if test="${i.f_del == 0}">
												<td>
													<button type="submit" class="btn">${i.app_id}</button>
												</td>
											</c:if>
											<c:if test="${i.f_del == 1 }">
												<td>${i.app_id}</td>												
											</c:if>
												<td>${i.pr_subject}</td>
												<td><fmt:formatNumber value="${i.hprice}" type="currency" /></td>
												<td>${i.hday}일</td>
												<td>${i.app_con}</td>
												<td><fmt:formatNumber value="${i.nprice}" type="currency" /></td>
												<td>${i.nday}일</td>
												<c:if test="${i.check==0 }">
												<td>지원요청</td>
												</c:if> 
												<c:if test="${i.check==0 }">
												<td>협상중</td>
												</c:if> 
												<c:if test="${i.check==2 }">
												<td>거절</td>
												</c:if> 
												<c:if test="${i.check==3 and i.fcheck == 0 }">
												<td>프리랜서 승인 대기중</td>
												</c:if> 
												<c:if test="${i.check==3 and i.fcheck == 1}">
												<td>승인</td>
												</c:if> 
												<c:if test="${i.check==4}">
												<td>협상 거절</td>
												</c:if>
												<c:if test="${i.f_del == 1 and i.check != 4}">
												<td>지원자가 지원을 취소한 상태 입니다.</td>
											</c:if>
										</tr>									
									</c:if>
								</c:forEach>
							</tbody>
						</table>
				</c:if>
				<c:if test="${empty prolist}">
					<table class="table">
						<thead>
						<thead>
							<tr>
								<td colspan="6" align="center" style="font-size: x-large;">협상중 프로젝트 목록</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6" align="center" style="font-size: large;">협상중인 프로젝트가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</c:if>
				<br/><br/><br/>
				<c:if test="${!empty dtoList1 }">
				<table class="table">
						<thead>
						<thead>
							<tr>
								<td colspan="6" align="center" style="font-size: x-large; background-color: #3ebaac;">진행 프로젝트 목록</td>
							</tr>
							<tr>
								<th>제목</th>
								<th>금액</th>
								<th>지원</th>
								<th>등록일</th>
								<th>계약기간</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dtoList1}" var="dto" varStatus="status">
							<tr>
								<td>${dto.pr_subject }</td>
								<td><fmt:formatNumber value="${dto.total_price}" type="currency" /></td> 
								<td>${dto.fr_ids }명</td>
								<td>${dto.start_day}</td>
								<td>${dto.total_day}일</td>
							</tr>
						</c:forEach> 	
						</tbody>
				</table>
				</c:if>
				<c:if test="${empty dtoList1}">
					<table class="table table-hover">
						<thead>
						<thead>
							<tr>
								<td colspan="6" align="center" style="font-size: x-large;">진행중 프로젝트 목록</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6" align="center" style="font-size: large;">진행중인 프로젝트가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</c:if>
				<br/><br/><br/>
				<c:if test="${!empty dtoList2 }">
					<table class="table">
						<thead>
						<thead>
							<tr>
								<td colspan="6" align="center" style="font-size: x-large; background-color: #ff0000; color: white;">완료 프로젝트 목록</td>
							</tr>
							<tr>
								<th>제목</th>
								<th>금액</th>
								<th>지원</th>
								<th>계약기간</th>
								<th>등록일</th>
								<th>마감일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dtoList2}" var="dto" varStatus="status">
							<tr>
							 	<td>${dto.pr_subject }</td>
								<td><fmt:formatNumber value="${dto.total_price}" type="currency" /></td>
								<td>${dto.fr_ids }명</td>
								<td>${dto.total_day}일</td>
								<td>${dto.start_day}</td>
								<td>${dto.end_day}</td>
							</tr>
							<input type="hidden" name="count" value="${status.count }"	/>
							<input type="hidden" name="pr_id" id="pr_id" value="${dto.pr_id}" />
							<input type="hidden" name="pr_subject" id="pr_subject" value="${dto.pr_subject }" />
						</c:forEach> 
						</tbody>
					</table>
				</c:if>
				<c:if test="${empty dtoList2}">
					<table class="table table-hover">
						<thead>
						<thead>
							<tr>
								<td colspan="6" align="center" style="font-size: x-large;">완료된 프로젝트 목록</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6" align="center" style="font-size: x-large;">완료된 프로젝트가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</c:if>
				<form action="/pfinal/pfinal.do?command=evaluate" method="post">
					<input type="submit" value="내프로젝트" />
				</form>
			</div>
		</div>
	</section>
	
	   <!-- About Section -->
    <section id="news" class="bg-darkest-gray">
        <div class="container">
            <div class="row">
            	
                <div class="col-lg-12 text-left" >

                	 <h2 class="section-heading btn-xl2">오늘의 뉴스(${media_name}) <button class="btn btn-xl3" onclick="fnMedia()">신문사 변경</button></h2>
                	
                <table class="table">                	
					<%	
						int size = list.size(); 
						if(list.size()>50){ 
							size = 50;							
						}
					    if(list!=null){
					    	
					        for(int i=0; i<size; i++){
					            Element el = (Element) list.get(i);
					%>
					<tr>
					<td><b class="text-mute"><%= i+1 %></b></td>
						<td class="timeline-inverted"><a class="text-mute" href='<%=el.getChildText("link")%>' target=_news> <%=el.getChildText("title")%></a></td>
						</tr>
							<%
					        }
					    }else{
					%>
					<tr>
							<td>잠시 후 다시 접속하여 주십시오.</td>
							</tr>
							<%
					    }
					%>
					</table>
                </div>
            </div>           
        </div>
    </section>
				

</body>
 
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

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>

</body>

</html>
