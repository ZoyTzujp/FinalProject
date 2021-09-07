<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <!-- CSS  ============================================ -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/css/vendor/bootstrap.min.css' />">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="<c:url value='/css/vendor/font.awesome.min.css' />">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<c:url value='/css/vendor/ionicons.min.css' />">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="<c:url value='/css/plugins/slick.min.css' />">
    <!-- Animation -->
    <link rel="stylesheet" href="<c:url value='/css/plugins/animate.min.css' />">
    <!-- jQuery Ui -->
    <link rel="stylesheet" href="<c:url value='/css/plugins/jquery-ui.min.css' />">
    <!-- Nice Select -->
    <link rel="stylesheet" href="<c:url value='/css/plugins/nice-select.min.css' />">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="<c:url value='/css/plugins/magnific-popup.css' />">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from the above) -->

    <!-- <link rel="stylesheet" href="assets//css/vendor/vendor.min.css">
         <link rel="stylesheet" href="assets//css/plugins/plugins.min.css"> -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <!-- <link rel="stylesheet" href="assets//css/style.min.css"> -->
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Merriweather:400,900,900i" rel="stylesheet">

<!-- JS  ============================================ -->
    <!-- jQuery JS -->
    <script src="<c:url value='/js/vendor/jquery-3.5.1.min.js' />"></script>
    <!-- jQuery Migrate JS -->
    <script src="<c:url value='/js/vendor/jQuery-migrate-3.3.0.min.js' />"></script>
    <!-- Modernizer JS -->
    <script src="<c:url value='/js/vendor/modernizr-2.8.3.min.js' />"></script>
    <!-- Bootstrap JS -->
    <script src="<c:url value='/js/vendor/bootstrap.bundle.min.js' />"></script>
    <!-- Slick Slider JS -->
    <script src="<c:url value='/js/plugins/slick.min.js' />"></script>
    <!-- Countdown JS -->
    <script src="<c:url value='/js/plugins/jquery.countdown.min.js' />"></script>
    <!-- Ajax JS -->
    <script src="<c:url value='/js/plugins/jquery.ajaxchimp.min.js' />"></script>
    <!-- Jquery Nice Select JS -->
    <script src="<c:url value='/js/plugins/jquery.nice-select.min.js' />"></script>
    <!-- Jquery Ui JS -->
    <script src="<c:url value='/js/plugins/jquery-ui.min.js' />"></script>
    <!-- jquery magnific popup js -->
    <script src="<c:url value='/js/plugins/jquery.magnific-popup.min.js' />"></script>

    <!-- Main JS -->
    <script src="<c:url value='/js/main.js' />"></script>
    
    <style>
	.scrolltotop { 
	   background-color: #E98C81; 
	   color: #ffffff; 
	   position: fixed; 
	   right: 50px; 
        /* 	   opacity: 0; */
	    /*    top: 0%;  */
		bottom:16px;
	   width: 50px; 
	   height: 50px; 
	   font-size: 16px; 
	   border-radius: 50%; 
		   -webkit-box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14); 
		           box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14); 
		   -webkit-transition: .9s; 
       /* 		outline:none; */
       /* 		cursor:pointer; */
     }
 
	 .scrolltotop:hover { 
	   background-color: #1B1B1C; 
      }
     </style>
     
     <Script>
		window.addEventListener("load", function(){
// 		window.onload = function() {	
			//上方購物車 
			if(${empty Cart}){
				var cartHTML = "<i class='ion-bag'></i> ";
				
				var divs = document.getElementById("cartItemCount");
				var divs2 = document.getElementById("cartItemCount_2");
				divs.innerHTML = cartHTML;
				divs2.innerHTML = cartHTML;
				
			}else{			
				var xhr2 = new XMLHttpRequest();
				xhr2.open("GET","<c:url value='/getCart.json' />",true);
				xhr2.send();
				xhr2.onreadystatechange = function(){
					if(xhr2.readyState == 4 && xhr2.status == 200){
						var cartItem = JSON.parse(xhr2.responseText);//將回應的JSON字串轉為javaScript物件
						getCart(cartItem);					
					}
				}	
			}
					
			//回到頁首
		    const scrollToTop = document.querySelector(".scrolltotop");	
			scrollToTop.addEventListener("click",function(){
		 		$("html, body").animate({scrollTop:0 }, "slow" );
			});	
			
			document.addEventListener("scroll",(e)=>{
				if(document.documentElement.scrollTop <= 150){
					scrollToTop.style.display="none";
				}else{
					scrollToTop.style.display="block";
				}
			})
				
			// 上方商店列表
			var xhr0 = new XMLHttpRequest();               
			var shopList = [];
			xhr0.open("GET","<c:url value='/findAllShop.json' />",true);
			xhr0.send();
			xhr0.onreadystatechange = function(){
			    if(xhr0.readyState == 4 && xhr0.status == 200){
			    	var shops = JSON.parse(xhr0.responseText);//將回應的JSON字串轉為javaScript物件
			    	var context = "";
			            for (var i = 0; i < shops.length; i++) {          	
			            	context += "<li><a href=\"<c:url value='/findSingleShop/"
			            	        + shops[i].shopID
			            	        + "'/>\">"
			            	        + shops[i].shopName
			            	        + "</a></li>"
			        	}                  		
			    		var divs1 = document.getElementById("shop_ul");
			    		var divs2 = document.getElementById("shop_ul_2"); 
			       		divs1.innerHTML = context;
			       		divs2.innerHTML = context;			       		
			    }
			}
			
			//上方商品類型列表
			var xhr1 = new XMLHttpRequest();               
			var productTypeList = [];
			xhr1.open("GET","<c:url value='/getAllProductTypeList.json' />",true);
			xhr1.send();
			xhr1.onreadystatechange = function(){
			    if(xhr1.readyState == 4 && xhr1.status == 200){
			    	var productTypeList = JSON.parse(xhr1.responseText);//將回應的JSON字串轉為javaScript物件
			    	var context = "";
			            for (var i = 0; i < productTypeList.length; i++) {          	
			            	context += "<li><a href=\"<c:url value='/getProductListByTypeID/"
			            	        + productTypeList[i].productTypeID
			            	        + "'/>\">"
			            	        + productTypeList[i].productTypeName
			            	        + "</a></li>"
			        	}                  		
			            var divs1 = document.getElementById("product_ul");
			    		var divs2 = document.getElementById("product_ul_2"); 
			       		divs1.innerHTML = context;
			       		divs2.innerHTML = context;
			       		
			    }
			}
																												
			//上方購物車,刪除項目
			$("#cart,#cart_2").on("click",".deleteItem",function(){
				
				console.log("-----clickAccept------>");				
				var productID = $(this).parent().siblings(".productID").val();
				console.log("-----productID------>"+productID);
				
				var xhr2 = new XMLHttpRequest();
				xhr2.open("POST","<c:url value='/removeProduct.json' />",true);
				xhr2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhr2.send("productID="+productID);
				xhr2.onreadystatechange = function(){
					if(xhr2.readyState == 4 && xhr2.status == 200){
						var cartItem = JSON.parse(xhr2.responseText);//將回應的JSON字串轉為javaScript物件
						getCart(cartItem);	
					}
				}
			 })	
		});
		
		//上方購物車項目寫入
		function getCart(cartItem){
            
            var productIDList = Object.values(cartItem.content).map(item => item.productID);
            var productNameList = Object.values(cartItem.content).map(item => item.productName);
            var newSaleQtyList = Object.values(cartItem.content).map(item => item.newSaleQty);
            var priceList = Object.values(cartItem.content).map(item => item.price);
            var length = productIDList.length;
            
            var context = ""; 
            var cartHTML = "<i class='ion-bag'></i> "
                         + "<span class='cart-item_count'>" + length + "</span>"
            var total = 0;          
                       
            for (var i = 0 ; i < length ; i++){
            	console.log("productID:"+productIDList[i]+",productName:"+productNameList[i]+",newSaleQty:"+newSaleQtyList[i]+",price:"+priceList[i]);
            	
            	context+="<div class='single-cart-item' >"
                        + "<div class='cart-img'>"
                        + "<a href=\""
                        + "<c:url value='/getproductDetailsByID/" + productIDList[i] + "' />  \">"
                        + "<img src='"
                        + "<c:url value='/getProductImage' />?id=" + productIDList[i] + "' alt=''></a>"
                        + "</div>"	
                        + "<div class='cart-text'>"
                        + "<h5 class='title'>" + productNameList[i] + "</h5>"
                        + "<div class='cart-text-btn'>"
                        + "<div class='cart-qty'>"
                        + "<span>"+ newSaleQtyList[i] + " x </span>"
                        + "<span class='cart-price'>" + priceList[i] + "</span>"
                        + "</div>"
                        + "<Input type='hidden' class='productID' value='" + productIDList[i] + "'>"			                        
                        + "<button type='button' ><i class='ion-trash-b deleteItem'></i></button></div></div></div>" 
                total += Number(newSaleQtyList[i]*priceList[i])    
            }
        				    												
		var divs3 = document.getElementById("cart");
		var divs4 = document.getElementById("cart_2");			    		
		var divs5 = document.getElementById("cartItemCount");
		var divs6 = document.getElementById("cartItemCount_2");
		var divs7 = document.getElementById("carTotal");
		var divs8 = document.getElementById("carTotal_2");
				    		
   		divs3.innerHTML = context;
   		divs4.innerHTML = context;		       		
   		divs5.innerHTML = cartHTML;
   		divs6.innerHTML = cartHTML;
   		divs7.innerHTML = total;
   		divs8.innerHTML = total;
}
    </Script>
    
<!-- TopBar Start Here -->
    <div class="home-wrapper home-1">
        <!-- Header Area Start Here -->
        <header class="main-header-area">
            <!-- 上方固定navbar Start -->
            <div class="main-header">
                <div class="container container-default custom-area">
                    <div class="row">
                        <div class="col-lg-12 col-custom">
                            <div class="row align-items-center">
                                <div class="col-lg-2 col-xl-2 col-sm-6 col-6 col-custom">
                                    <div class="header-logo d-flex align-items-center">
                                        <a href="<c:url value='/' />">
                                            <img class="img-full" src="<c:url value='/images/logo/logo.png' />" alt="Header Logo">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-xl-7 position-static d-none d-lg-block col-custom">
                                    <nav class="main-nav d-flex justify-content-center">
                                        <ul class="nav">
                                            <li>
                                                <a href="<c:url value='/' />">
                                                    <span class="menu-text"> 首頁</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/showAllShopNameInfo' />">
                                                    <span class="menu-text">店家</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul id="shop_ul">
<%--                                                         <c:forEach var="shopBeanList" items="${shopBeanList}"> --%>
<%--                                                             <li><a href="<c:url value='/findSingleShop/${ shopBeanList.shopID}'/>">${ shopBeanList.shopName}</a></li> --%>
<%--                                                          </c:forEach> --%>
                                                        </ul>
                                                    </div>
<!--                                                     <div class="menu-colum"> -->
<!--                                                         <ul> -->
<!--                                                             <li><span class="mega-menu-text">Location</span></li> -->
<!--                                                             <li><a href="#">店家A</a></li> -->
<!--                                                             <li><a href="#">店家B</a></li> -->
<!--                                                             <li><a href="#">店家C</a></li> -->
<!--                                                             <li><a href="#">店家D</a></li> -->
<!--                                                             <li><a href="#">店家E</a></li> -->
<!--                                                         </ul> -->
<!--                                                     </div> -->
                                                </div>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/getAllProductInfo' />">
                                                    <span class="menu-text">商品</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">                                                   
                                                        <ul id="product_ul">
<%--                                                            <c:forEach var="productTypeList" items="${productTypeList}"> --%>
<%--                                                                <li><a href="${productTypeList.productTypeID}">${productTypeList.productTypeName}</a></li> --%>
<%--                                                            </c:forEach>  --%>
<!--                                                           <li><a href="#">水果</a></li> -->
<!--                                                           <li><a href="#">肉品</a></li> -->                                                             
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <c:if test="${! empty Customer}">                                       
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">會員專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="${pageContext.request.contextPath}/customer/profile">會員資料</a></li>
                                                            <li><a href="/memberArtical">我的發文</a></li>
                                                            <li><a href="<c:url value='/getCustomersAllOrder' />">訂單查詢</a></li>
                                                            <li><a href="<c:url value='/showProductCart' />">購物車</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:if>                                           
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">廠商合作專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="<c:url value='/addShopForm' />">商家銷售合作</a></li>
                                                            <c:if test="${! empty LoginOK}">
                                                            <li><a href="<c:url value='/modifyMemberInfo' />">修改店家資料</a></li>  
                                                            <li><a href="<c:url value='/showProductCooperateForm' />">商品銷售合作</a></li>
                                                            <li><a href="<c:url value='/showProductEditFormByShopID/${LoginOK.shopID}' />">編輯銷售商品</a></li>
                                                            <li><a href="<c:url value='/getShopsAllOrder' />">查看訂單</a></li>
                                                            </c:if>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>                                           
                                            <li>
                                                <a href="<c:url value='/allartical' />">
                                                    <span class="menu-text">論壇</span>
                                                </a>
                                            </li> 
                                            <li>
                                                <a href="https://confident-montalcini-99dd99.netlify.app/">
                                                    <span class="menu-text">地圖</span>
                                                </a>
                                            </li>                                          
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">關於</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">常見問題</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="col-lg-2 col-xl-3 col-sm-6 col-6 col-custom">
                                    <div class="header-right-area main-nav">
                                        <ul class="nav">
                                            <li class="login-register-wrap d-none d-xl-flex">
                                             <c:if test="${! empty LoginOK}"> 
                                                <span>您好,${LoginOK.shopKeeper}</span>
                                                <span  onclick="return confirm('請問是否要登出?');"><a href="<c:url value='/logOut' />">登出</a></span>
                                             </c:if>
                                             <c:if test="${! empty Customer}"> 
                                                <span>歡迎,${Customer.name}</span>
                                                <span  onclick="return confirm('請問是否要登出?');"><a href="<c:url value='/customerLogout' />">登出</a></span>
                                             </c:if>
                                             <c:if test="${empty LoginOK && empty Customer}">                                     
                                                <span><a href="<c:url value='/customerLoginPage'/> ">登入</a></span>                                            
                                                <span><a href="${pageContext.request.contextPath}/customer/signUpPage">註冊</a></span>
                                             </c:if>                                                 
                                            </li>
                                          <!--購物車 Star-->
                                            <li class="minicart-wrap">
                                                <a href="<c:url value='/showProductCart' />" class="minicart-btn toolbar-btn" id="cartItemCount"></a>                                                
                                                <div class="cart-item-wrapper dropdown-sidemenu dropdown-hover-2">
	                                                <!--購物車Item Star-->
	                                                 <div id="cart"></div>
	                                                <!--購物車Item End-->                                                       
                                                     <div class="cart-price-total d-flex justify-content-between">
                                                       <h5>總計 :</h5>
                                                       <h5 id="carTotal"></h5>
                                                    </div>
                                                    <div class="cart-links d-flex justify-content-center">
                                                       <a class="obrien-button white-btn" href="<c:url value='/showProductCart' />">前往購物車</a>
                                                       <a class="obrien-button white-btn" href="<c:url value='/CartCheckout' />">生成訂單</a><!-- 原字段:結帳 -->
                                                    </div>
                                                 </div>
                                            </li>
                                           <!--購物車 End-->
                                            <li class="mobile-menu-btn d-lg-none">
                                                <a class="off-canvas-btn" href="#">
                                                    <i class="fa fa-bars"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 上方固定navbar Area End -->
            <!-- 浮動navbar Start Here-->
            <div class="main-header header-sticky">
                <div class="container container-default custom-area">
                    <div class="row">
                        <div class="col-lg-12 col-custom">
                            <div class="row align-items-center">
                                <div class="col-lg-2 col-xl-2 col-sm-6 col-6 col-custom">
                                    <div class="header-logo d-flex align-items-center">
                                       <a href="<c:url value='/' />">
                                            <img class="img-full" src="<c:url value='/images/logo/logo.png' />" alt="Header Logo">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-xl-7 position-static d-none d-lg-block col-custom">
                                    <nav class="main-nav d-flex justify-content-center">
                                        <ul class="nav">
                                            <li>
                                                <a href="<c:url value='/' />">
                                                    <span class="menu-text"> 首頁</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/showAllShopNameInfo' />">
                                                    <span class="menu-text">店家</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul id="shop_ul_2">
<%--                                                         <c:forEach var="shopBeanList" items="${shopBeanList}"> --%>
<%--                                                             <li><a href="<c:url value='/findSingleShop/${ shopBeanList.shopID}'/>">${ shopBeanList.shopName}</a></li> --%>
<%--                                                          </c:forEach> --%>
                                                        </ul>
                                                    </div>
<!--                                                     <div class="menu-colum"> -->
<!--                                                         <ul> -->
<!--                                                             <li><span class="mega-menu-text">Location</span></li> -->
<!--                                                             <li><a href="#">店家A</a></li> -->
<!--                                                             <li><a href="#">店家B</a></li> -->
<!--                                                             <li><a href="#">店家C</a></li> -->
<!--                                                             <li><a href="#">店家D</a></li> -->
<!--                                                             <li><a href="#">店家E</a></li> -->
<!--                                                         </ul> -->
<!--                                                     </div> -->
                                                </div>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/getAllProductInfo' />">
                                                    <span class="menu-text">商品</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">                                                   
                                                        <ul id="product_ul_2">
<%--                                                            <c:forEach var="productTypeList" items="${productTypeList}"> --%>
<%--                                                                <li><a href="${productTypeList.productTypeID}">${productTypeList.productTypeName}</a></li> --%>
<%--                                                            </c:forEach>  --%>
<!--                                                           <li><a href="#">水果</a></li> -->
<!--                                                           <li><a href="#">肉品</a></li> -->                                                             
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <c:if test="${! empty Customer}">                                       
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">會員專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>   
                                                            <li><a href="${pageContext.request.contextPath}/customer/profil">會員資料</a></li>
                                                            <li><a href="/memberArtical">我的發文</a></li>
                                                            <li><a href="<c:url value='/getCustomersAllOrder' />">訂單查詢</a></li>
                                                            <li><a href="<c:url value='/showProductCart' />">購物車</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:if>                                           
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">廠商合作專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="<c:url value='/addShopForm' />">商家銷售合作</a></li>
                                                            <c:if test="${! empty LoginOK}">
                                                            <li><a href="<c:url value='/modifyMemberInfo' />">修改店家資料</a></li>  
                                                            <li><a href="<c:url value='/showProductCooperateForm' />">商品銷售合作</a></li>
                                                            <li><a href="<c:url value='/showProductEditFormByShopID/${LoginOK.shopID}' />">編輯銷售商品</a></li>
                                                            <li><a href="<c:url value='/getShopsAllOrder' />">查看訂單</a></li>
                                                            </c:if>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/allartical' />">
                                                    <span class="menu-text">論壇</span>
                                                </a>
                                            </li>                                                                                      
                                            <li>
                                                <a href="https://confident-montalcini-99dd99.netlify.app/">
                                                    <span class="menu-text">地圖</span>
                                                </a>
                                            </li> 
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">關於</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">常見問題</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="col-lg-2 col-xl-3 col-sm-6 col-6 col-custom">
                                    <div class="header-right-area main-nav">
                                        <ul class="nav">
                                            <li class="login-register-wrap d-none d-xl-flex">
                                             <c:if test="${! empty LoginOK}"> 
                                                <span>您好,${LoginOK.shopKeeper}</span>
                                                <span  onclick="return confirm('請問是否要登出?');"><a href="<c:url value='/logOut' />">登出</a></span>
                                             </c:if>
                                             <c:if test="${! empty Customer}"> 
                                                <span>歡迎,${Customer.name}</span>
                                                <span  onclick="return confirm('請問是否要登出?');"><a href="<c:url value='/customerLogout' />">登出</a></span>
                                             </c:if>
                                             <c:if test="${empty LoginOK && empty Customer}">                                     
                                                <span><a href="<c:url value='/customerLoginPage'/> ">登入</a></span>                                            
                                                <span><a href="${pageContext.request.contextPath}/customer/signUpPage">註冊</a></span>
                                             </c:if>                                                 
                                            </li>
                                         <!--購物車 Star-->
                                            <li class="minicart-wrap">
                                                <a href="<c:url value='/showProductCart' />" class="minicart-btn toolbar-btn" id="cartItemCount_2"></a>                                                
                                                <div class="cart-item-wrapper dropdown-sidemenu dropdown-hover-2">
	                                                <!--購物車Item Star-->
	                                                 <div id="cart_2"></div>
	                                                <!--購物車Item End-->                                                       
                                                     <div class="cart-price-total d-flex justify-content-between">
                                                       <h5>總計 :</h5>
                                                       <h5 id="carTotal_2"></h5>
                                                    </div>
                                                    <div class="cart-links d-flex justify-content-center">
                                                       <a class="obrien-button white-btn" href="<c:url value='/showProductCart' />">前往購物車</a>
                                                       <a class="obrien-button white-btn" href="<c:url value='/CartCheckout' />">生成訂單</a><!-- 原字段:結帳 -->
                                                    </div>
                                                 </div>
                                            </li>
                                           <!--購物車 End-->        
                                             <li class="mobile-menu-btn d-lg-none">
                                                <a class="off-canvas-btn" href="#">
                                                   <i class="fa fa-bars"></i>
                                                </a>
                                             </li>
                                            </ul>
                                           </div>
                                        </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
            <!-- 浮動navbar End Here -->
        </header>
    </div>
<!-- TopBar End Here -->   
    <button class ="scrolltotop">
    	<i class="material-icons">arrow_upward</i>
    </button>
    
