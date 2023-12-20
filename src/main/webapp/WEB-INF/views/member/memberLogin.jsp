
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LJSS_SHOP</title>
    <link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/memberLogin.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;   
        }
    </style>
	

</head>
<body>
        <c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	    </c:if>
	    
	    
	    <c:if test="${ !empty message }">
		<script>
			alert("${message}");
		</script>
		<c:remove var="message" scope="session"/>
	    </c:if>
	    
	    <c:if test="${ !empty message1 }">
		<script>
			alert("${message1}");
		</script>
		<c:remove var="message1" scope="session"/>
	    </c:if>
	    
		  
                
	
	    <div id="container">
        <!-- 헤더 -->
        <div id="header">
            <!-- 햄버거 메뉴 -->
            <div class="cate_btn">
                <input type="checkbox" id="hamburger"/>
                <label for="hamburger">
                  <span></span>
                  <span></span>
                  <span></span>
                </label>
            </div>
            <div class="cate_box">
                <p>Category</p>
                <ul class="cate_box2">
                    <li><a href="outerListpage">Outer</a></li>
                    <li><a href="topListpage">Top</a></li>
                    <li><a href="bottomListpage">Bottom</a></li>
                    <li><a href="shoesListpage">Shoes</a></li>
                    <li><a href="accListpage">Acc</a></li>
                </ul>
                <!-- 계정이 관리자일 경우에만 보이게 -->
               <c:if test="${ sessionScope.loginUser.memId eq 'admin' }">
                <ul class="adm_menu">

                    
                    <li><a href="insertProductpage">상품등록</a></li>

                    <li><a href="adminMember">회원관리</a></li>
                    

                   
                    <li><a href="adminEvent">이벤트관리</a></li>
                </ul>
                </c:if>
            </div>

            <!-- 검색창 -->
            <input type="text" class="search_box" id="search">
            <button type="button"><img src="${ pageContext.servletContext.contextPath }/resources/img/main/search_icon.png"/></button>

            <!-- 오른쪽위 메뉴 -->
             <div class="gnb">
                <ul>

               <c:if test="${ empty sessionScope.loginUser }">
               
                   <li><a href="loginMember">Login</a> </li>
                </c:if>
                
                <c:if test="${ !empty sessionScope.loginUser }">
                   <li><label>${ sessionScope.loginUser.memName }, WELCOME</label> &nbsp;&nbsp;</li>
                  
                   <li><a href="logout">Logout</a></li>
                </c:if>  
                   
                    <li><a href="listNotice">Notice</a></li>
                    <li><a href="productListpage">Shop</a></li>
                    

                    <li><a href="">Event</a></li>
                    <li><a href="enrollFormQna">Contact</a></li>
                </ul>
            </div>
        </div>
    
    <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-ui.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.cate_btn').click(function(){
                $('.cate_box').toggle('slide', {
                direction: 'left'
                }, 400);
            });
        });//end
    </script>
        <div id = "wrap">
            <div class ="title" >
                <h3>LOG IN</h3>
            </div>
            <form action="loginMember" method="post">
            <div class="login_form">
                <label class ="username">
                    <ul id="id">ID*</ul>
                    
                    <input type ="text" id = "username" name ="memId" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR ID">
                </label>
                <br>
                <label class = "password" >
                    <ul id="word">PASSWORD*</ul>
                    
                    <input type ="password" id = "password" name = "memPwd" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR PASSWORD">
                </label> 

                <br>
                <div class = "forget-links">
                   
                    <a class="forget-id" href="forgetidpage">FORGET ID</a>
                    <span class="separator"></span>
                    <a class ="forget-password" href="forgetpwdpage">FORGET PASSWORD</a>
                </div>
            
                <br>
                <button type="submit" class ="login-btn" >SING IN</button>
                
                
                <div class="singup" >
                <a class="signupbtn" href ="enrollForm">SING UP</a>
                </div>
                
               
               
                 
                
              
            </div>
            </form>
    </div> 
</div>
</body>
</html>



