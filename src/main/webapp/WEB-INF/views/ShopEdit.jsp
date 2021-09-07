<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!doctype html>
<html class="no-js" lang="en">

<head>


    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Obrien</title>
	
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    

</head>

<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />

        <!-- 商品銷售註冊欄 Start Here -->
         <div class="login-register-area mt-no-text mb-no-text"> 
              <div class="container  custom-area"> 
                <div class="row"> 
                    <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-custom">
                        <div class="login-register-wrapper">
                            <div class="section-content text-center mb-5">
                                <h2 class="title-4 mb-2">修改會員資料</h2>
                                <div id='resultMsg' style="height:18px; font-weight: bold;"></div>
                            </div>
                            <form method="POST" action="<c:url value='/updateShop' />" enctype="multipart/form-data">
                            	<div class="single-input-item mb-3">                            	
						             <input type="hidden" id="shopID"name="shopID"   >
						        </div>
								
								<div class="single-input-item mb-3">                       
						             <label>店家名稱</label>      	
						                  <input type="text" id="shopName" name="shopName"   >
<!-- 						            <div id='result0c' style="height: 10px;"></div><br> -->
<!-- 									<div id='result0s' style="height: 10px;"></div> -->
						        </div>
						      
                                
<!--                                  <div class="col-md-4 single-input-item mb-3">  -->
									<div class="single-input-item  mb-3">   
						              <label>聯絡人姓名</label>
						                   <input type="text"  id="shopKeeper"name="shopKeeper"  /> 
						          </div> 
               
                                <div class="single-input-item  mb-3">
						             <label>電子郵件</label>
						                	<input type="text"  id="Email" name="Email" readonly/>
						        </div>
								
<!-- 								<div class="single-input-item mb-3">                            	 -->
<!-- 						             <input type="hidden" id="password" name="password"   /> -->
<!-- 						        </div> -->
								
								<div class="single-input-item  mb-3">
									<label>手機號碼</label> <input type="text" id="mobile" name="mobile" />
								</div>
								
								<div class="single-input-item  mb-3">
									<label>商店電話</label> <input type="text" id="shopPhone" name="shopPhone" />
								</div>
								
								<div class="single-input-item  mb-3">
						              <label>連結網址</label><input type="text" id="webLink" name="webLink" />
						          </div>
						        
						        <div class="single-input-item mb-3">
                                    <label>店家圖片</label><br><img  src="<c:url value='/getShopImage' />?id=${LoginOK.shopID}" width="400" height="300" alt="" >
                                </div>
                                
                                <div class="single-input-item mb-3">
                                    <label>修改店家圖片</label><input type="file" name="shopImage" />
                                </div>
						                                
						          <div class="single-input-item  mb-3">
						              <label>商店介紹</label><br>
						         	<textarea id="introduce" name="introduce" cols="72" rows="5" ></textarea>
						          </div>
						          
						          
                        
                             	  <div class="single-input-item mb-3"> 
                                     <div class="login-reg-form-meta d-flex align-items-center justify-content-between"> 
                                         <div class="remember-meta mb-3"> 
                                        </div>
                                    </div>
                                </div>
                                <div align="center"	>
									<button  class="btn obrien-button-2 primary-color" id='updateData' onclick="return confirm('確認要修改店家內容?');">送出</button>
									<input type="button"  class="btn obrien-button-2 primary-color" value="取消" onClick='history.go(-1)'> 
								</div>
							</form>	
<script>
    var hasError = false;

    window.onload = function() {
   	var divResult 	= document.getElementById('resultMsg');
   	let shopID 		= document.getElementById("shopID");
    	let shopName 	= document.getElementById("shopName");
    	let shopKeeper 	= document.getElementById("shopKeeper");
    	let Email 		= document.getElementById("Email");
    	let mobile 		= document.getElementById("mobile");
    	let introduce 	= document.getElementById("introduce");
    	let shopPhone 	= document.getElementById("shopPhone");
    	let webLink 	= document.getElementById("webLink");
		let shopImage   = document.getElementById("shopImage");
    	let xhr = new XMLHttpRequest();

    	xhr.open("GET", "<c:url value='/editShop' />" ,true);
//     	xhr.setRequestHeader("Content-Type","application/json");
    	xhr.send();
    	xhr.onreadystatechange = function(){
    		if (xhr.readyState == 4 && xhr.status == 200){
   			
    		let member 			= JSON.parse(xhr.responseText);
    		console.log(member);
    		shopID.value		= member.shopID;
    		shopName.value 		= member.shopName;
    		shopKeeper.value	= member.shopKeeper;
    		Email.value 		= member.email;
    		mobile.value 		= member.mobile;
    		introduce.value 	= member.introduce;
    		shopPhone.value 	= member.shopPhone;
    		webLink.value 		= member.webLink;
    		
    		}
    	}
   	

   }
	</script> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 商品銷售註冊欄 End Here -->
	
</body>

</html>