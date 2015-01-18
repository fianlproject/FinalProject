<%@ page contentType="text/html; charset=euc-kr"%>
<!DOCTYPE html>
<html class="no-js">
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style.css">

</head>
<body>

<div class="page-container">
<h1>Login</h1>
   <form method="post" action="/pfinal/pfinal.do">
   <input type="hidden" name="command" value="logintest" />
      <div style="border: 1px" >         
         <div>            
            <div><input type="text" name="id" class="username" placeholder="ID 입력"/></div>            
         </div>
         <div>            
            <div><input type="password" name="pw" class="password" placeholder="PassWord 입력"/></div>            
         </div>
     
            <div>               
               <button type="submit">Login!</button>              
            </div>               
      </div>
   </form>
</div>
		<script src="js/jquery-1.8.2.min.js"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
        <script src="js/supersized-init.js"></script>
        <script src="js/scripts.js"></script>
</body>
</html>