<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>마이페이지</title>

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<style type="text/css">
.btn{
border-color: #BDBDBD;

}
.mywishket .content .content-inner .mywishket-project .table td .btn {
color: #5D5D5D;
}
</style>

</head>
<body class="logged-in client mywishket">

   <br />
   <div id="wrap">
      <div class="page">
         <div class="content">
            <div class="content-header">
               <h3 class="header-text">
                  마이페이지 <small class="small-text"></small>
               </h3>
            </div>
            <div class="content-inner">
               <div class="mywishket-project">
                  <h4 class="mywishket-project-heading">내 정보</h4>
                  <div class="submitted-project">
                        <form method="post" action="/pfinal/pfinal.do">
                     <h5 class="submitted-project-heading">
                        나의 경력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <button class="btn" name="command" value="m_career">추가</button>
                     </form>
                     </h5>
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th>희사명</th>
                              <th>부서</th>
                              <th>직위</th>
                              <th>입사기간</th>
                              <th>수정 및 삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="i" items="${d_day}">
                              <tr>
                                 <td>${i.cname}</td>
                                 <td>${i.part}</td>
                                 <td>${i.position}</td>
                  <td><c:if test="${i.year != 0 }">
                     ${i.year}년
                  </c:if> <c:if test="${i.month != 0 }">
                     ${i.month}월
                  </c:if> <c:if test="${i.day != 0 }">
                     ${i.day}일
                  </c:if></td>
                  <td>
                  <form method="post" action="/pfinal/pfinal.do">
                     <input type="hidden" name="command" value="career_up">
                     <input type="hidden" name="cname" value="${i.cname}">                  
                     <input type="hidden" name="part" value="${i.part}">                  
                     <input type="hidden" name="position" value="${i.position}">                  
                     <input type="hidden" name="resign" value="${i.resign}">                  
                     <input type="hidden" name="joins" value="${i.join}">                  
                     <input type="hidden" name="career_index" value="${i.career_index}">                  
                     <input type="submit" value="수정" class="btn" style="float: left;">
                  </form>
                  <form method="post" action="/pfinal/pfinal.do">
                     <input type="hidden" name="command" value="career_delete">                              
                     <input type="hidden" name="career_index" value="${i.career_index}">                  
                     <input type="submit" value="삭제" class="btn">
                  </form>
                                    
                  </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  <br />

                  <div class="proposal-project">
                        <form method="post" action="/pfinal/pfinal.do">
                     <h5 class="proposal-project-heading">
                        나의 보유기술&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <button class="btn" name="command" value="m_skill">추가</button>
            </form>
                     </h5>
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th>기술명</th>
                              <th>경험</th>
                              <th>숙련도</th>
                              <th>수정 및 삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="i" items="${skills1}">
                              <tr>
                                 <td>${i.skill}</td>
                                 <c:choose>
                                    <c:when test="${i.exp==1}">
                                       <td>1년미만</td>
                                    </c:when>
                                    <c:when test="${i.exp==2}">
                                       <td>1년 이상 3년 미만</td>
                                    </c:when>
                                    <c:when test="${i.exp==3}">
                                       <td>3년 이상 5년 미만</td>
                                    </c:when>
                                    <c:when test="${i.exp==4}">
                                       <td>5년 이상 10년 미만</td>
                                    </c:when>
                                    <c:when test="${i.exp==5}">
                                       <td>10년 이상</td>
                                    </c:when>
                                 </c:choose>
                                 <c:choose>
                                    <c:when test="${i.mastery==1}">
                                       <td>관심있음</td>
                                    </c:when>
                                    <c:when test="${i.mastery==2}">
                                       <td>초급</td>
                                    </c:when>
                                    <c:when test="${i.mastery==3}">
                                       <td>중급</td>
                                    </c:when>
                                    <c:when test="${i.mastery==4}">
                                       <td>고급</td>
                                    </c:when>
                                    <c:when test="${i.mastery==5}">
                                       <td>특급</td>
                                    </c:when>
                                 </c:choose>
                              <td>
                              <form method="post" action="/pfinal/pfinal.do">
                                 <input type="hidden" name="command" value="skill_up">
                                 <input type="hidden" name="mastery" value="${i.mastery}">                  
                                 <input type="hidden" name="exp" value="${i.exp}">                  
                                 <input type="hidden" name="skill" value="${i.skill}">                                                
                                 <input type="hidden" name="skill_index" value="${i.skill_index}">                  
                                 <input type="submit" value="수정" class="btn" style="float: left;">
                              </form>
                              <form method="post" action="/pfinal/pfinal.do">
                                 <input type="hidden" name="command" value="skill_delete">                                                                              
                                 <input type="hidden" name="skill_index" value="${i.skill_index}">                  
                                 <input type="submit" value="삭제" class="btn">
                              </form>               
                              </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  <br />

                  <div class="contract-project">
                        <form method="post" action="/pfinal/pfinal.do">
                     <h5 class="contract-project-heading">
                        나의 자격증&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <button class="btn" name="command" value="m_quali">추가</button>
               </form>
                     </h5>
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th>자격증명</th>
                              <th>발행기관</th>
                              <th>일련번호</th>
                              <th>발행일</th>
                              <th>수정 및 삭제</th>
                              
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="i" items="${qv}">
                              <tr>
                                 <td>${i.q_name}</td>
                                 <td>${i.q_house}</td>
                                 <td>${i.q_num}</td>
                                 <td>${i.q_date}</td>
                                 <td>
                                 <form method="post" action="/pfinal/pfinal.do">
                                    <input type="hidden" name="command" value="quali_up">
                                    <input type="hidden" name="q_name" value="${i.q_name}">                  
                                    <input type="hidden" name="q_house" value="${i.q_house}">                  
                                    <input type="hidden" name="q_num" value="${i.q_num}">                                                
                                    <input type="hidden" name="q_date" value="${i.q_date}">                  
                                    <input type="hidden" name="quali_index" value="${i.quali_index}">                  
                                    <input type="submit" value="수정" class="btn" style="float: left;">
                                 </form>                                 
                                 <form method="post" action="/pfinal/pfinal.do">
                                    <input type="hidden" name="command" value="quali_delete">                                                   
                                    <input type="hidden" name="quali_index" value="${i.quali_index}">                  
                                    <input type="submit" value="삭제" class="btn">
                                 </form>               
                                 </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  <br />

                  <div class="contract-project">
                        <form method="post" action="/pfinal/pfinal.do">
                     <h5 class="contract-project-heading">
                        나의 학교&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <button class="btn" name="command" value="schoolsearch">추가</button>
            </form>
                     </h5>

                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th>학교명</th>
                              <th>전공</th>
                              <th>상태</th>
                              <th>수정 및 삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="dto" items="${mySchoolList}">
                              <tr>
                                 <td>${dto.schoolname}</td>
                                 <td>${dto.schoolmajor}</td>
                                 <td>${dto.schoolstate}</td>
                                 <td>
                    
                                 
                                 <form method="post" action="/pfinal/pfinal.do">
                                    <input type="hidden" name="command" value="myschoolupdatesearch">
                                    <input type="hidden" name="schoolid"
                                       value="${dto.schoolid }"> <input type="submit"
                                       value="수정" class="btn" style="float: left;">
                                 </form>
                                 
                                 <form method="post" action="/pfinal/pfinal.do">
                                    <input type="hidden" name="command" value="myschooldelete">
                                      <input type="hidden" name="myschool_index" value="${dto.myschool_index }">
                                    <input type="hidden" name="schoolid"
                                       value="${dto.schoolid }"> <input type="submit"
                                       value="삭제" class="btn">
                                 </form></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  <br />

                  <div class="contract-project">
                        <form method="post" action="/pfinal/pfinal.do">
                     <h5 class="contract-project-heading">
                        나의 프로젝트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <button class="btn" name="command" value="project">추가</button>
         </form>
                     </h5>
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th>내용</th>
                              <th>참여일자</th>
                              <th>Category</th>
                              <th>Category_Detail</th>
                           </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${vector}" var="pDto">
                           <tr>
                              <td>${pDto.contents }</td>
                              <td>${pDto.start } - ${pDto.end }</td>
                              <c:if test="${pDto.category == 1 }">
                                <td>디자인</td>
                                </c:if>
                                <c:if test="${pDto.category == 2 }">
                                <td>개발</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  1}">
                                <td>웹</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  2}">
                                <td>애플리케이션</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  3}">
                                <td>워드프레스</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  4}">
                                <td>퍼블리싱</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  5}">
                                <td>커머스, 쇼핑몰</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  6}">
                                <td>일반 소프트웨어</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  7}">
                                <td>임베디드</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  8}">
                                <td>기타</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  9}">
                                <td>웹</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  10}">
                                <td>애플리케이션</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  11}">
                                <td>제품</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  12}">
                                <td>프레젠테이션</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  13}">
                                <td>인쇄물</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  14}">
                                <td>커머스, 쇼핑몰</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  15}">
                                <td>로고</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  16}">
                                <td>영상</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  17}">
                                <td>그래픽</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  18}">
                                <td>기타</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  19}">
                                <td>게임</td>
                                </c:if>
                                <c:if test="${pDto.category_sub ==  20}">
                                <td>게임</td>
                                </c:if>
                           </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>


                        <form method="post" action="/pfinal/pfinal.do">
                  <div class="contract-project">
                     <h5 class="contract-project-heading">
                        나의 소개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:if test="${sogae==null }">
               <button class="btn" name="command" value="m_sogae">추가</button>
               </c:if>
               <c:if test="${sogae!=null }">
               <button class="btn" name="command" value="m_sogaeUpdate">수정</button>
               <button class="btn" name="command" value="m_sogaeDelete">삭제</button>
               </c:if>
         </form>
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th>내용</th>
                              
                           </tr>
                        </thead>
                        <tbody>
                           
                              <tr>
                                 <th>
                                 <c:if test="${sogae!=null }">
                                       ${sogae }
                                 </c:if>
                                 </th>
                                 
                                 
                              </tr>
                        
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>

         <div class="sidebar">
            <div class="inner">
               <div class="user-name-tag">
                     <form method="post" action="/pfinal/pfinal.do">
                  <h3 class="user-name-tag-heading"><%=session.getAttribute("id")%>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;
               <button class="btn" name="command" value="free_index">홈으로</button>
               </form>
                  </h3>
                  <div class="user-name-tag-body">
                     <img alt="kstar9312 사진" class="img-circle user-img"
                        src="/static/img/default_avatar.jpg" />
                     <h4 class="username"><%=session.getAttribute("name")%>님의
                        마이페이지
                     </h4>
                     <br />
                     <br />
                     <br />
                     
                  </div>
               </div>
               <div class="project-add-suggestion">
                  <h5 class="suggestion-text">
                      친구를 등록해 보세요.
                  </h5>
                  <form method="post" action="/pfinal/pfinal.do">
               <button class="btn btn-client btn-lg btn-project-add" name="command" value="friendlist">나의 친구</button>
         </form>
               </div>

               <div class="activity">
                  <h3 class="activity-heading">정보 입력</h3>
                  <div id="activity-body">
                     <ul class="activity-unit-list">
                     <li class="empty-activity activity-unit"><a
                           href="/pfinal/pfinal.do?command=m_sogae">나의 소개</a></li>
                        <li class="empty-activity activity-unit"><a
                           href="/pfinal/pfinal.do?command=m_inter">관심기술</a></li>
                        <li class="empty-activity activity-unit"><a
                           href="/pfinal/pfinal.do?command=prolist">지원 프로젝트 목록 임시</a></li>
                           
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>

