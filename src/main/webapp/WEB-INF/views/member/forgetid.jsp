<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJSS FORGET ID </title>
     <link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/forgetid.css"/>

<style>
      body{
          font-family: 'Montserrat', sans-serif;
          margin: 0;
          padding: 0;   
      }
    </style>
</head>
<body>
	

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
       <form id="forgetidpage" action="forgetId" method="post">
        <div id = "wrap">
            <div class ="title" >
                <h3>FIND ID</h3>
            </div>
            <div class="findidpass">
                <label class ="username">
                    <ul id="name">NAME*</ul>
                    
                    <input type ="text" id = "username" name="memName" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR REAL NAME">
                </label>
                <br>
                <label class = "email" >
                    <ul id="word">EMAIL*</ul>
                    
                    <input type ="text" id = "email" name="memEmail" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR EMAIL">
                </label> 

                <br>
                
            
                <br>
                <button class ="check-btn">CHECK!!</button>
                
                
               
                  

            </div>
    </div> 
    </form>
</div>
</body>
</html>