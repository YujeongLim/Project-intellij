<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LJSS_SHOP</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/adminMember.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/memDetail.css">
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
                    <li><a href="#">상품관리</a></li>
                    <li><a href="#">결제관리</a></li>
                    <li><a href="adminEvent">이벤트관리</a></li>
                </ul>
            </div>

            <!-- 검색창 -->
            <input type="text" class="search_box" id="search">
            <button type="button"><img src="${ pageContext.servletContext.contextPath }/resources/img/main/search_icon.png"></button>

            <!-- 오른쪽위 메뉴 -->
            <div class="gnb">
                <ul>
                    <li><a href="loginMember">Login</a></li>
                    <li><a href="">Cart</a></li>
                    <li><a href="">Notice</a></li>
                    <li><a href="selectEvent">Event</a></li>
                    <li><a href="">Contact</a></li>
                </ul>
            </div>
        </div>
        

        <div id="wrap">
            <div class="contents">
                <h2>이벤트관리 > 이벤트추가</h2>

                <!-- 회원검색 -->
                <div class="mem_src">
                    <input type="text"/>
                    <button class="src_btn">검색</button>
                    <input type="reset" class="rs_btn" value="검색초기화">
                </div>

<form action="insertEvent" method="post" id="eventInsertForm" enctype="multipart/form-data">
                
                <table style="text-align:center; width: 97%; margin: 0 auto;">
                    <thead>
                    <tr>
                        <th style="width:10%;">이벤트코드</th>
                        <th style="width:15%;">이벤트명</th>
                        <th style="width:25%;">이벤트상세</th>
                        <th style="width:10%;">등록일</th>
                        <th style="width:20%;">사진</th>
                    </tr>
                </thead>
                    <tbody>
                <tr>
                    <td><input type="text" name="eventCode" style="width:100%; text-align:center;"></td>
                    <td><input type="text" name="eventName" style="width:100%;" required></td>
                    <td><textarea name="eventDetail" style="width:100%; padding:10px; resize:none;"></textarea></td>
                    <td><input type="date" name="eventAddDate" style="width:100%; text-align:center;"></td>
                    <td><input type="file" name="uploadFile" style="width:100%; text-align:center;" multiple="multiple"></td>
                </tr>
       		 	</tbody>
                </table>
                
                <div class="back_btn" onclick="history.back()">◀ 뒤로가기</div>
                 <div class="fr">
                    <button type="submit" class="btn_box">등록하기</button>
                    <button type="reset" class="btn_box">취소하기</button>
                </div>
</form>                
                
            </div>
        </div>
    </div>

    <!-- 자바스크립트 -->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    
 // url 에서 parameter 추출

    function getParam(sname) {

        var params = location.search.substr(location.search.indexOf("?") + 1);

        var sval = "";

        params = params.split("&");

        for (var i = 0; i < params.length; i++) {

            temp = params[i].split("=");

            if ([temp[0]] == sname) { sval = temp[1]; }

        }

        return sval;

    }
 
        $(document).ready(function(){
        	let message = getParam("message");
        	if(message == "update_success")
        		alert("성공적으로 등록했습니다.");
        	
            $('.cate_btn').click(function(){
                $('.cate_box').toggle('slide', {
                direction: 'left'
                }, 400);
            });
        });//end

    </script>
</body>
</html>