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
                <h2>회원관리 > 회원수정,삭제</h2>

                <!-- 회원검색 -->
                <div class="mem_src">
                    <span>회원검색</span>
                    <input type="text"/>
                    <button class="src_btn">검색</button>
                    <input type="reset" class="rs_btn" value="검색초기화">
                </div>

<form action="updateMember2" method="post">
                <table>
                    <thead>
                    <tr>
                        <th>회원코드</th>
                        <th>관리자코드</th>
                        <th>회원명</th>
                        <th>생년월일</th>
                        <th>성별</th>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>전화번호</th>
                        <th>주소</th>
                        <th>이메일</th>
                        <th>가입일</th>
                        <th>탈퇴여부</th>
                    </tr>
                </thead>
                    <tbody>
                <tr>
                    <td><input type="text" name="memCode" value="${ m.memCode }" readonly style="width: 32px; border: none; text-align:center;"></td>
                    <td><input type="text" name="memAdmin" value="${ m.memAdmin }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memName" value="${ m.memName }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memBirth" value="${ m.memBirth }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="gender" value="${ m.gender }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memId" value="${ m.memId }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memPwd" value="${ m.memPwd }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memPhone" value="${ m.memPhone }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memAdrr" value="${ m.memAdrr }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memEmail" value="${ m.memEmail }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memAccdate" value="${ m.memAccdate }" style="width: 80px; text-align:center;"></td>
                    <td><input type="text" name="memOut" value="${ m.memOut }" style="width: 32px; text-align:center;"></td>
                </tr>
       		 	</tbody>
                </table>
                
                <div class="back_btn" onclick="history.back()">◀ 뒤로가기</div>
                 <div class="fr">
                    <input type="submit" class="btn_box" value="수정하기">
                    <button class="btn_box" onclick="location.href='deleteMember2?mno=${ m.memCode }'">삭제하기</button>
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
        		alert("성공적으로 수정했습니다.");
        	
            $('.cate_btn').click(function(){
                $('.cate_box').toggle('slide', {
                direction: 'left'
                }, 400);
            });
        });//end

    </script>
</body>
</html>