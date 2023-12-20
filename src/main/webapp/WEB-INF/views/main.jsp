<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LJSS_SHOP</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/basic.css"/>
    <link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/main_css.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
        }
        .photo {
		    position: absolute;
		    width: 100%;
		    height: 100%;
		    top: 0;
		    left: 0;
		    background-image: url(${ pageContext.servletContext.contextPath }/resources/img/main/image00.jpg);
		    background-repeat: no-repeat;
		    background-position: center center;
		    background-size: cover;
		    transition: 0.5s;
		}
    </style>
</head>
<body>
  				
    <div id="container">
        <!-- 헤더 -->
        <div id="header">
	   	 	<!-- 로고 -->
	        <h1 class="logo"><a href="${ pageContext.servletContext.contextPath }">LJSS</a></h1>
            <!-- 햄버거 메뉴 -->
            <div class="cate_btn">
                <input type="checkbox" id="hamburger" disabled="disabled"/>
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
                    

                    <li><a href="selectEvent">Event</a></li>
                    <li><a href="enrollFormQna">Contact</a></li>
                </ul>
            </div>
        </div>

        <!-- 정가운데 메뉴 -->
        <ul class="nav">
            <li class="about">
                <a href="productListpage" data-text="About">About</a>
            </li>
            <li class="clothes">
                <a href="topListpage" data-text="Clothes">Clothes</a>
            </li>
            <li class="shoes">
                <a href="shoesListpage" data-text="Shoes">Shoes</a>
            </li>
            <li class="acc">
                <a href="accListpage" data-text="Acc">Acc</a>
            </li>
        </ul>
        <!-- 전체이미지 -->
        <div class="photo"></div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <!--<script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-ui.min.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(document).ready(function(){
        	$('.about').mouseenter(function(){      
                $('.photo').css({
                    'background-image' : `url( ${ pageContext.servletContext.contextPath }/resources/img/main/image01.jpg )`
                });
            });
        	
        	$('.clothes').mouseenter(function(){    
                $('.photo').css({
                    'background-image' : `url( ${ pageContext.servletContext.contextPath }/resources/img/main/image02.jpg )`
                });
            });
        	
        	$('.shoes').mouseenter(function(){      
                $('.photo').css({
                    'background-image' : `url( ${ pageContext.servletContext.contextPath }/resources/img/main/image03.jpg )`
                });
            });
        	
            $('.acc').mouseenter(function(){       
                $('.photo').css({
                    'background-image' : `url( ${ pageContext.servletContext.contextPath }/resources/img/main/image04.jpg )`
                });
            });
            
            $('.nav li').mouseleave(function(){
                $('.photo').css({
                    'background-image' : ''
                });
            });

            $('.cate_btn').click(function(){
            	console.log("CLICKED");
                $('.cate_box').toggle('slide', {
                direction: 'left'
                }, 400);
            });

        });//end
    </script>
</body>
</html>