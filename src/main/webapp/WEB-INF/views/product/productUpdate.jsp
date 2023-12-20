<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJSS UPDATE PAGE</title>
<link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/update.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
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
        
        
        <div id = "wrap">
            <div class ="title" >
                <h3>UPDATE YOUR PRODUCT HERE</h3>
            </div>
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="updateproduct" method="post" action="updateProduct" enctype="multipart/form-data">
                <input type="hidden" name="proCode" value="${ p.proCode }">
               <div class="insert_form">
                <label class ="productname">
                    <ul class="name">PRODUCT NAME*</ul>
                    
                    <input type="text" id="name" class="form-control" name="proName" value="${ p.proName }" required>               
                 </label>
                <br>
                <label class = "prodcutprice" >
                    <ul id="word">PRODUCT PRICE*</ul>
                    
                    <input type="text" id="price" class="form-control" name="proPrice" value="${ p.proPrice }"required>                
                </label> 

                <br>
                <label class = "productstock" >
                    <ul id="word1">PRODUCT STOCK*</ul>
                    
                    <input type="text" id="stock" class="form-control" name="proStock" value="${ p.proStock }"required>                
                </label> 

                <br>
                <label class = "catecode" >
                    <ul id="word2">CATE CODE*</ul>
                    
                    <input type="text" id="catecode" class="form-control" name="cateCode" value="${ p.cateCode }"required>                
                </label> 

                <br>
                <label class = "size" >
                    <ul id="word3">PRODUCT SIZE*</ul>
                   <input type="text" id="size" class="form-control" name="proSize" value="${ p.proSize }"required>                
               
                    </label> 
                 <br>
                 <label class="title-img-area" id="titleImgArea">
                    <ul class="word4" >INSERT YOUR FIRST PRODUCT PICTURE</ul>
                 <img id="titleImg" width="600" height="400"  src="${pageContext.servletContext.contextPath}/resources/upload_files/${p.proImg1}" >
                </label>
                <br>
                <br>
                <label class="detail-img-area" id="detailImgArea">
                    <ul class="word5" >INSERT YOUR DETAIL PRODUCT PICTURE</ul>

                    <img id="detailImg" width="600" height="1000"  src="${pageContext.servletContext.contextPath}/resources/upload_files/${p.proImg2}" >


                </label>
            
                <br>
               
                
               
                

            </div>
               <div class="thumbnail-file-area">
					<input type="file" id="thumbnailImg1" name="reProImgs" onchange="loadImg(this,1)">
                    <input type="file" id="thumbnailImg2" name="reProImgs" onchange="loadImg(this,2)">
                     <input type="hidden" name="proImg1" value="${p.proImg1}">
                     <input type="hidden" name="proImg2" value="${p.proImg2}">
                    
                    
                     
                </div>
                <button type="submit" class="btn btn-primary">UPDATE!!!</button>
                <button type="reset" class="btn btn-danger">RESET</button>
                

               
            </form>
        </div>
        <br><br>
       <script>
			
			const $titleImgArea = document.getElementById("titleImgArea");
			const $detailImgArea = document.getElementById("detailImgArea");
			
			$titleImgArea.onclick = function() { 
				document.getElementById("thumbnailImg1").click(); 
			}
			
			$detailImgArea.onclick = function() {
				document.getElementById("thumbnailImg2").click();
			}
			
			
			
			function loadImg(value, num) {
				if (value.files && value.files[0]) {
					const reader = new FileReader();
					reader.onload = function(e) {
						switch(num){
						case 1:
							document.getElementById("titleImg").src = e.target.result;
							break;
						case 2:
							document.getElementById("detailImg").src = e.target.result;
							break;
						
						}
					}
					reader.readAsDataURL(value.files[0]);
				}
			}
			
		</script>
    </div>

</body>
</html>