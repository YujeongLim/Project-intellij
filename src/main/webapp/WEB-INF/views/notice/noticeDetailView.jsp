<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세</title>
<link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/basic.css"/>
<link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/noticeDetailView.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	body  { font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;}
    
   /*  #contentArea{width:100%}
	#contentArea *{margin:5px} */
   
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
        <div class="innerOuter">
            <h2>Notice Detail</h2>
            <br>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ n.noticeTitle }</td>
               
                    <th>등록일</th>
                    <td>${ n.createDate }</td>
                </tr>
              
                <tr>
                    <th>내용</th>
                    <td colspan="5"><p style="height:150px" "text-align=left">${ n.noticeContent }</p></td>
                </tr>
            </table>
            <br>
	
			<c:if test="${ sessionScope.loginUser.memId eq 'admin' }">
	            <div align="center">
	            
	                <button onclick="postFormSubmit(1);" style="position: right" "padding-right= 50px" "background-color = lightgray">수정하기</button>
	                <button onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	           
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="nno" value="${ n.noticeNo }">
					<%-- <input type="hidden" name="fileName" value="${ n.changeName }">  --%>
				</form>
				
				
				<script>
					function postFormSubmit(num){
						let postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateFormNotice");
						}else{
							postForm.attr("action", "deleteNotice");
						}
						postForm.submit();
					}
				</script>
				 
            </c:if>
            <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
            <br><br>

            
        </div>
        <br><br>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery-ui.min.js"></script>
     <script>
     
     
     
    </script>

 	
 </body>
</html>