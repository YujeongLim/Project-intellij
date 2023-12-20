<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJSS_PRODUCT</title>
<link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/topList.css"/>
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
     <div class="signbox"></div>
       <ul class="title">LJSS &nbsp;&nbsp;&nbsp;SHOP</ul>
      
      <div class="product_list" id="topList">
      <c:forEach items="${topList}" var="p" varStatus="status">
        <c:set var="index" value="${status.index}" />

        <c:if test="${index % 4 == 0}">
            <div class="pcols">
        </c:if>

        <div class="product1">
            <img class="p1img" src="${pageContext.servletContext.contextPath}/resources/upload_files/${p.proImg1}" />
            <div>
                <span class="hidden">${p.proCode }</span>
                <span>${p.proName}</span>
                 <br>
                <span>${p.proPrice}원</span>
            </div>
        </div>

        <c:if test="${(index + 1) % 4 == 0 || status.last}">
            </div>
        </c:if>
    </c:forEach>
      </div>
		   <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="productListpage?currentPage=${ pi.currentPage-1 }">PREVIOUS</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">PREVIOUS</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="productListpage?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="productListpage?currentPage=${ pi.currentPage+1 }">GONEXT</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="productListpage?currentPage=${ pi.currentPage+1 }">GONEXT</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
		    

		<script>
		
			$(document).ready(function(){
				  $("#topList .product1").click(function(){
				    proCode = $(this).find('span').eq(0).text();
				    location.href = "detailProduct?proCode=" + proCode;
				  });
				});
		</script> <!-- 是这个问题！！终于出来了！！！我去
		1111111 -->
 
</body>
</html>