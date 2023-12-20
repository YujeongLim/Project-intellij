<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJSS DETAIL PRODUCT</title>
<link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/productDetail.css"/>
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
                    <li><a href="#">Outer</a></li>
                    <li><a href="#">Top</a></li>
                    <li><a href="#">Bottom</a></li>
                    <li><a href="#">Shoes</a></li>
                    <li><a href="#">Acc</a></li>
                </ul>
                <!-- 계정이 관리자일 경우에만 보이게 -->
                <ul class="adm_menu">
                    <li><a href="">회원관리</a></li>
                    <li><a href="">상품등록</a></li>
                    <li><a href="">결제관리</a></li>
                    <li><a href="">이벤트관리</a></li>
                </ul>
            </div>

            <!-- 검색창 -->
            <input type="text" class="search_box" id="search">
            <button type="button"><img src="${ pageContext.servletContext.contextPath }/resources/img/main/search_icon.png"/></button>

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

     <div class="signbox"></div>
     
     <div class="signbox"></div>

        <div class="pdetail">
            <div class="pcontent">
                <div class="pname">${p.proName }</div>      
                    <div class="line1"></div>
                    <div class="pprice">${p.proPrice }원</div>
                    <div class="line2"></div>
                    <div class="psize">SIZE: ${p.proSize }</div>
                    <div class="line3"></div>
                    <div class="totalPrice">
                        <span>총 상품금액</span><span class="total"><strong>${p.proPrice }원</strong> </span>
                    </div>
                    <button class="addcart">
                        <ul class="cart">ADD TO CART</ul>
                    </button>
                    <button class="buy">
                        <ul class="buybutton">BUY!!!</ul>
                    </button>

                  

            </div>
            <div class="img">
                <img class="pimg" src="${pageContext.servletContext.contextPath}/resources/upload_files/${p.proImg1}">
            </div>
            
            <div class="dimg">
                <img class="pimgdetail" src="${pageContext.servletContext.contextPath}/resources/upload_files/${p.proImg2}">
            </div>
            
        </div>
    <c:if test="${ sessionScope.loginUser.memId eq 'admin' }">

     <div align="center">
        <button class="btn btn-primary" onclick="postFormSubmit(1);">UPDATE</button>
        <button class="btn btn-danger" onclick="postFormSubmit(2);">DELETE</button>
    </div>
    </c:if>
    <form id="postForm" action="" method="post">
		<input type="hidden" name="proCode" value="${ p.proCode }">
	</form>
     <script>
        function postFormSubmit(num){
            let postForm = $("#postForm");
            
            if(num == 1){
                postForm.attr("action", "updateProductPage");
            }else{
                postForm.attr("action", "deleteProduct");
            }
            postForm.submit();
        }
    </script>
	
</body>
</html>