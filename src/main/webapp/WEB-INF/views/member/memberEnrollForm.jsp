


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LJSS JOIN PAGE</title>
     <link rel ="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/memberEnrollForm.css"/>

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

        <div id = "wrap">
            <div class ="title" >
                <h3>JOIN</h3>
            </div>
            <form id="enrollForm" action="insertMember" method="post">
            <div class="login_form">
                <label for="memId" class ="username">
                    <ul id="id">ID*</ul></label>
                    
                    <input type ="text" id = "username" name="memId" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR ID" required>
                    
                
                <div id="checkResult" style="display:none; font-size:13px;"></div>
                
                <ul id="notice">(영어 소문자 및 숫자사용,4~16자)</ul>
                <br>
                <label class = "password" >
                    <ul id="word">PASSWORD*</ul>
                    
                    <input type ="password" id = "password" name="memPwd" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR PASSWORD" required>
                </label> 
                <ul id="notice1">(영문 대소문자/숫자/특수문자 중2가지 이상 조합,8자~16자)</ul>
                <br>
                <label class = "confirmpassword" >
                    <ul id="confirm">COMFIRM PASSWORD*</ul>
                    
                    <input type ="password" id = "confirmpassword"placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR PASSWORD AGAIN" required oninput="checkPassword()">
                    
                </label> 
                <div id="checkResult1" style=" font-size:13px;"></div>
                <script>
	             // 비번 일치하는지 확인
	                function checkPassword() {
	                  
	                  const password = $("#password").val();
	                  const confirmPassword = $("#confirmpassword").val();
	
	             
	                  if (password == confirmPassword) {
	                  
	                    $("#checkResult1").css("color","green").text("Passwords matched!");
	                  } else {
	               
	                    $("#checkResult1").css("color","red").text("Passwords do not match!");
	                  }
	                }
	
	               
			    </script>

                
                <ul id="personal">PERSONAL INFORMATION</ul>
                <div id="line"></div>
                
               <label class = "name" >
                    <ul id="name">NAME*</ul>
                    
                    <input type ="text" id = "memName" name="memName" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR NAME" required>
                </label> 
                	
                 <ul id="birth">BIRTH*</ul>
                <tb>
                <select id="yearSelect" name="memBirth"></select>
                <input id = birth1 name="memBirth" placeholder="&nbsp;&nbsp;BIRTH MONTH">
                <input id = birth2 name="memBirth"placeholder="&nbsp;&nbsp;BIRTH DATE">
                </tb>


                <script>
                    
                    var currentYear = new Date().getFullYear();
                
                    
                    var selectElement = document.getElementById("yearSelect");
                
                    
                    for (var year = 1970; year <= currentYear; year++) {
                        var option = document.createElement("option");
                        option.value = year;
                        option.text = year;
                        selectElement.appendChild(option);
                    }
                </script>
                    <div class="gendersize">
                    <ul class="gender"> GENDER*</ul>
                    <input type="radio" name="gender" id="male" value="M">
                    <label for="Male" class="male">MALE</label> 
                    <input type="radio" name="gender" id="female" value="F">
                    <label for="Female"class="female">FEMALE</label><br> 
                    </div>
            
                <ul id="phone">PHONE*</ul>
                <tb>
                    <select class = "phone" name="memPhone">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>

                     </select> 
                     
                     <input id="phone1" name="memPhone">
                     <input id="phone2" name="memPhone">
                </tb>
                <label class = "email" >
                    <ul id="email">EMAIL*</ul>
                    
                    <input type ="text" id = "emailcontext" name="memEmail" placeholder="&nbsp;&nbsp;&nbsp;PLEASE ENTER YOUR EMAIL">
                </label> 
                <ul id="address">ADDRESS*</ADdress></ul>
                
                <input id="postcode" name="post" readonly>
                <a href="#none" onclick id="postbn">
                       <img src="${ pageContext.servletContext.contextPath }/resources/img/enrollform/postpic.gif" class="postbutton"/>
                </a>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
               
                <input id="address1" name="address1" placeholder=" &nbsp;&nbsp;&nbsp;YOUR ADDRESS " readonly>
                <input id="address2" name="address2" placeholder=" &nbsp;&nbsp;&nbsp;DETAIL ADDRESS.">
                <script>
                    const $searchZipCode = document.getElementById("postbn");
                   
                    
                    $searchZipCode.onclick = function() {
                    
                        //다음 우편번호 검색 창을 오픈하면서 동작할 콜백 메소드를 포함한 객체를 매개변수로 전달한다.
                        new daum.Postcode({
                            oncomplete: function(data){
                                //팝업에서 검색결과 항목을 클릭했을 시 실행할 코드를 작성하는 부분
                                document.getElementById("postcode").value = data.zonecode;
                                document.getElementById("address1").value = data.address;
                                document.getElementById("address2").focus();
                            }
                        }).open();
                    }
                    
                    $goMain.onclick = function() {
                        location.href = "${ pageContext.servletContext.contextPath }";
                    }
                </script>
                
                
                <div id="line1"></div>
                
                <ul class="agreeasignment">AGREE ASIGNMENT</ul>
                <label class="checkbox">
                    <input type="checkbox" name="checkall" onclick="checkAll(this.checked)"required>&nbsp;&nbsp;&nbsp;이용약관 및 개인정보수집 및 이용에 모두 동의합니다.
                </label>

                <div class="line2"></div>
                
                <div class="asignment1">
                <ul class="context1">[필수]이용약관 동의 </ul>
                <button class="buttoncontext1" id="button1">이용약관</button>
                </div>
                <div class="popup" id="popup">
                    <div class="popup-content">
                      <span class="close" id="closePopup">&times;</span>
                      <ul class="title">LJSS 이용약</ul>
                    
                    <p>제1조(목적)<br>이 약관은 키르시(전자상거래 사업자)가 운영하는 키르시 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.<br>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p>
                    <p>제2조(정의)<br>① “몰”이란 키르시 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</p>
                    <p>제3조 (약관 등의 명시와 설명 및 개정) <br>① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 키르시 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br>⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</p>
                    <p>제4조(서비스의 제공 및 변경) <br>① “몰”은 다음과 같은 업무를 수행합니다.<br>&nbsp; 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>&nbsp; 2. 구매계약이 체결된 재화 또는 용역의 배송<br>&nbsp; 3. 기타 “몰”이 정하는 업무<br>② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p>
                    <p>제5조(서비스의 중단) <br>① “몰”은 컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</p>
                    
                
                    </div>
                </div>
                <script src="${ pageContext.servletContext.contextPath }/resources/js/popup.js"></script>

                
                
                <label class="checkbox1">
                    <input type="checkbox" name="chk" required>&nbsp;&nbsp;&nbsp;이용약관에 동의 합니다.
                </label>

                 <!-- 팝창????????????? -->
                 <div class="assignment2">
                 <ul class="context2">[필수]개인정보 동의</ul>
                <button class="buttoncontext2" id="button2">개인정보약관</button>
                <div class="popup" id="popup1">
                    <div class="popup-content">
                      <span class="close" id="closePopup1">&times;</span>
                      <ul class="title">LJSS 개인정보 수집 동의 약관</ul>
                    <p>■ 수집하는 개인정보 항목<br>
                        회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p><p>
                        
                        ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록<br>
                        ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식</p><p>
                        
                        ■ 개인정보의 수집 및 이용목적</p><p>
                        
                        회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p><p>
                        
                        ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송<br>
                        ο 회원 관리<br>
                        회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용<br>
                        접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p><p>
                        
                        ■ 개인정보의 보유 및 이용기간</p><p>
                        
                        회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
                        </p></p>
                    </div>
                </div>
                <script src="${ pageContext.servletContext.contextPath }/resources/js/popup.js"></script>



                
               </div>
                
                
                
                <label class="checkbox2">
                    <input type="checkbox" name="chk"required>&nbsp;&nbsp;&nbsp;개인정보 수집 및 이용 동의 합니다.
                </label>
                <script src="${ pageContext.servletContext.contextPath }/resources/js/checkall.js"></script>
                
                <button type = "submit" id="enrollBtn" class ="login-btn" disabled>SIGN UP</button>
                
                <script>
	// 아이디 중복체크 아직 안하는 경우 : 메세지 보여지지 않고 버튼 비활성화
	// 아이디 중복체크 후 사용불가능한 아이디일 경우 : 메세지로 "중복아이디 존재 사용불가능" 띄워주고 버튼 비활성화
	// 아이디 중복체크 후 사용가능한 아이디일 경우 : 메세지로 "사용 가능한 아이디" 띄워주고 버튼 활성화
  	// 중복체크 나중에 

    	function idCheckValidate(num){ 
    		
    		if(num == 0){ // 아직 중복체크를 하지 않는 경우 (아이디 적어도 5글자 이상은 되어야만 본격적으로 중복체크할 꺼임)
    			$("#checkResult").hide();
    			$("#enrollBtn").attr("disabled", true);
    			
    		}else if(num == 1){ // 중복된 아이디가 존재할 경우 
    			$("#checkResult").css("color", "red").text("중복된 아이디가 존재합니다. 사용이 불가능합니다.");
    			$("#checkResult").show();
    			$("#enrollBtn").attr("disabled", true);
    			
    		}else if(num == 2){ // 중복된 아이디가 존재하지 않을 경우 ->사용 가능
    			$("#checkResult").css("color", "green").text("사용 가능한 아이디입니다. ");
    			$("#checkResult").show();
    			$("#enrollBtn").removeAttr("disabled");
    			
    		}
    		
    	}
		$(function(){
    		
			let $idInput = $("#enrollForm input[name=memId]"); // 아이디 입력하는 input 요소
    		
    		$idInput.keyup(function(){
    			
    			// 아이디는 최소 5글자 ~ 
    			if($idInput.val().length >= 4){ // 5글자 이상되었을 때 본격적으로 중복체크
    				
   					$.ajax({
   						url:"idCheck",  //idCheck는 mapper에서 정확하게 고침!!
   						data:{memId:$idInput.val()},
   						type:"post",
   						success:function(result){
   							if(result > 0){ //   중복된 아이디 존재
   								idCheckValidate(1);
   							}else{
   								idCheckValidate(2);
   							}
   						},error:function(){ 
   							console.log("아이디 중복체크용 ajax 통신 실패");
   						}
   					});
   					
    			}else{
    				idCheckValidate(0);
    			}
    			
    		});
    	});
    
    </script>
     			
                
                
                
                

              </div>
             </form>
            </div>

</body>

</html>