<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LJSS_SHOP</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/basic_frame.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/eventPage.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
        }
        * {
            margin: 0;
            padding: 0;
            background-color: black;
        }

        .card-background {
            height: 2000px;
            margin-bottom: 600px;
        }

        .card-box {
            position: sticky;
            top: 250px;
            /* 스크롤 하면서 상단에 고정됨 */
            /* 좌표값이랑 같이 적어줘야함(몇px에서 고정할것인지 지정) */
        }

        .card-box img {
            display: block;
            margin: 100px auto;
            max-width: 90%;
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
                    <li><a href="#">Outer</a></li>
                    <li><a href="#">Top</a></li>
                    <li><a href="#">Bottom</a></li>
                    <li><a href="#">Shoes</a></li>
                    <li><a href="#">Acc</a></li>
                </ul>
                <!-- 계정이 관리자일 경우에만 보이게 -->
                <ul class="adm_menu">
                    <li><a href="adminMember">회원관리</a></li>
                    <li><a href="">상품관리</a></li>
                    <li><a href="">결제관리</a></li>
                    <li><a href="adminEvent">이벤트관리</a></li>
                </ul>
            </div>

            <!-- 검색창 -->
            <input type="text" class="search_box" id="search">
            <button type="button"><img src="${ pageContext.servletContext.contextPath }/resources/img/main/search_icon2.png" style="width: 27px; height: 25px;"></button>

            <!-- 오른쪽위 메뉴 -->
            <div class="gnb">
                <ul>
                    <li><a href="">Login</a></li>
                    <li><a href="">Cart</a></li>
                    <li><a href="">Notice</a></li>
                    <li><a href="">Event</a></li>
                    <li><a href="">Contact</a></li>
                </ul>
            </div>
        </div>

        <div class="wrap">
            
            

            <div class="slide-container">
            	<c:forEach items="${ list }" var="e">
	                <div class="slide-box">
	                	<div class="e-title">${ e.eventName }</div>
	                	<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${ e.eventPhoto }">
	                	<div class="e-detail">${ e.eventDetail }</div>
	                </div>
            	</c:forEach>
                
            </div>
    
            <div class="btn-box">
                <button class="slide box1 active"></button>
                <button class="slide box2"></button>
                <button class="slide box3"></button>           
            </div>
            <button class="arrow-btn slide-prev">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/event/chevron_left_white_24dp.svg" style="width: 50px; height: 50px;">
            </button>
            <button class="arrow-btn slide-next">
                <img src="${ pageContext.servletContext.contextPath }/resources/img/event/chevron_right_white_24dp.svg" style="width: 50px; height: 50px;">
            </button>
        </div>

    </div>

    <!-- 자바스크립트 -->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.nav li').mouseenter(function(){
                const changeImage = $(this).attr('data-image'); //<--.nav li        
                $('.photo').css({
                    'background-image' : `url( ${changeImage} )`
                });
            });

            $('.nav li').mouseleave(function(){
                $('.photo').css({
                    'background-image' : ''
                });
            });

            $('.cate_btn').click(function(){
                $('.cate_box').toggle('slide', {
                direction: 'left'
                }, 400);
            });
            $('.box1').click(function(){
                $('.slide-container').css('transform' , 'translateX(0)');
                $(this).addClass('active');
                $(this).siblings().removeClass('active');
            });
            $('.box2').click(function(){
                $('.slide-container').css('transform' , 'translateX(-100vw)');
                $(this).addClass('active');
                $(this).siblings().removeClass('active');
            });
            $('.box3').click(function(){
                $('.slide-container').css('transform' , 'translateX(-200vw)');
                $(this).addClass('active');
                $(this).siblings().removeClass('active');
            });

            // arrow버튼 클릭하면 넘어가는 슬라이드 구현
            var click_num=0;
            $('.slide-next').click(function(){
                click_num++;
                //이미지의 개수는 0부터 계산한다.
                
                // 마지막 .slide-box 일떄마다 오른쪽 버튼 글릭씨 처음으로 돌아가야함 (조건걸어주기)
                if(click_num > 2){
                    click_num=0;
                };
                $('.slide-container').css('transform' , 'translateX(-'+ click_num +'00vw)');
            });

            $('.slide-prev').click(function(){
                // .slide-prev는 .slide-next버튼을 클릭했다는 전제하에 작업
                click_num--;

                if(click_num < 2){
                    click_num=0;
                };
                $('.slide-container').css('transform' , 'translateX(-'+ click_num +'00vw)' )
        
            });
            
            //자동반복 (타이머함수)
            function time(){
                auto=setInterval(function(){ //auto 
                    $('.slide-next').trigger('click');
                },5000);
            };

            //전역변수 호출 
            time(); 

            $('.slide-next').hover(function(){
                clearInterval(auto)
            },function(){
                //지역변수 호출
                time(); 
            });
        });//end
                    
                       
    </script>
</body>
</html>