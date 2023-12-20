<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 목록</title>
<link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/basic.css"/>
<link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/noticeListView.css"/>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	body  { font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;}
            
	#noticeList{text-align: center;}
    #noticeList>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
 
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
</style>
</head>
<body>
	 

    <div class="content">
    
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
        
        <br><br>
        
        <!-- 공지사항 -->
        <div class="notice_wrap">
            <div class="notice_title">
                <h2>Notice</h2>
            </div>
        </div>
          
        <!-- 공지사항 목록 -->
            <table id="noticeList" class="table table-hover" align="center" style= "width:100%;" "border:1px solid: #444444;">
                <thead>
                  <tr>
                    <th id="num">번호</th>
                    <th id="title">제목</th>
                    <th id="date">등록일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="n">
	                    <tr>
	                        <td id="num_list">${ n.noticeNo }</td>
	                        <td id="title_list">${ n.noticeTitle }</td>
	                        
	                       
	                        <td id="date_list">${ n.createDate }</td>
	                       <%--  <c:if test="${ !empty n.originName }">
	                        	<td>★</td>
	                        </c:if>
	                        <c:if test="${ empty n.originName }">
	                        	<td>&nbsp;</td>
	                        </c:if> --%>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination" style="font-color:black">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="listNotice?currentPage=${ pi.currentPage-1 }"> < </a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""> < </a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="listNotice?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="listNotice?currentPage=${ pi.currentPage+1 }"> > </a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="listNotice?currentPage=${ pi.currentPage+1 }"> > </a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           <c:if test="${ sessionScope.loginUser.memId eq 'admin' }">
               
                    <a id="add" class="btn btn-secondary" href="enrollFormNotice">공지사항 등록</a>
                </c:if>
    	 
	

           <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
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
        
        <br><br>
        
    
    
    <script>
    	$(function(){
    		$("#noticeList tbody tr").click(function(){
    			location.href="detailNotice?nno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>

</body>
</html>