<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                                        <a href="#">
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
                                                <a href="/showAllShopProductInfo">
                                                    <span class="menu-text">店家</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul id="shop_ul">
<%--                                                         <c:forEach var="shopBeanList" items="${shopBeanList}"> --%>
<%--                                                             <li><a href="<c:url value='/findSingleShop/${ shopBeanList.shopID}'/>">${ shopBeanList.shopName}</a></li> --%>
<%--                                                          </c:forEach> --%>
<!--                                                             <li><span class="mega-menu-text">Location</span></li> -->
<!--                                                             <li><a href="#">店家A</a></li> -->
<!--                                                             <li><a href="#">店家B</a></li> -->
<!--                                                             <li><a href="#">店家C</a></li> -->
<!--                                                             <li><a href="#">店家D</a></li> -->
<!--                                                             <li><a href="#">店家E</a></li> -->
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
                                                        <ul>
                                                           <c:forEach var="productTypeList" items="${productTypeList}">
                                                               <li><a href="${productTypeList.productTypeID}">${productTypeList.productTypeName}</a></li>
                                                           </c:forEach> 
<!--                                                           <li><a href="#">水果</a></li> -->
<!--                                                           <li><a href="#">肉品</a></li> -->                                                             
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>                                           
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">會員專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="/modifyMemberInfo">更改會員資料</a></li>
                                                            <li><a href="/memberArtical">我的發文</a></li>
                                                            <li><a href="/orderSelect">訂單查詢</a></li>
                                                            <li><a href="/shoppingCart">購物車</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">廠商合作專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="/addShopForm">商家銷售合作</a></li>
                                                            <li><a href="<c:url value='/showProductCooperateForm' />">商品銷售合作</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">論壇</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="#">主題A</a></li>
                                                            <li><a href="#">主題B</a></li>
                                                            <li><a href="#">主題C</a></li>
                                                            <li><a href="#">主題D</a></li>
                                                            <li><a href="#">主題E</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
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
                                                <span>您好,${LoginOK.shopKeeper}</span>   
                                                <span  onclick="return confirm('請問是否要登出?');"><a href="<c:url value='/logOut' />">登出</a></span>
                                                <!--<span><a href="/login.jsp">登入</a></span>  -->
                                                <!--<span><a href="/register.jsp">註冊</a></span>  -->
                                            </li>
                                            <li class="minicart-wrap">
                                                <a href="#" class="minicart-btn toolbar-btn">
                                                    <i class="ion-bag"></i>
                                                    <span class="cart-item_count"></span>
                                                </a>
                                                <!--購物車-->
                                                <!-- <div class="cart-item-wrapper dropdown-sidemenu dropdown-hover-2">
                                        <div class="single-cart-item">
                                            <div class="cart-img">
                                                <a href="cart.html"><img src="assets/images/cart/1.jpg" alt=""></a>
                                            </div>
                                            <div class="cart-text">
                                                <h5 class="title"><a href="cart.html">11. Product with video - navy</a></h5>
                                                <div class="cart-text-btn">
                                                    <div class="cart-qty">
                                                        <span>1×</span>
                                                        <span class="cart-price">$98.00</span>
                                                    </div>
                                                    <button type="button"><i class="ion-trash-b"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single-cart-item">
                                            <div class="cart-img">
                                                <a href="cart.html"><img src="assets/images/cart/2.jpg" alt=""></a>
                                            </div>
                                            <div class="cart-text">
                                                <h5 class="title"><a href="cart.html" title="10. This is the large title for testing large title and there is an image for testing - white">10. This is the large title for testing...</a></h5>
                                                <div class="cart-text-btn">
                                                    <div class="cart-qty">
                                                        <span>1×</span>
                                                        <span class="cart-price">$98.00</span>
                                                    </div>
                                                    <button type="button"><i class="ion-trash-b"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single-cart-item">
                                            <div class="cart-img">
                                                <a href="cart.html"><img src="assets/images/cart/3.jpg" alt=""></a>
                                            </div>
                                            <div class="cart-text">
                                                <h5 class="title"><a href="cart.html">1. New and sale badge product - s / red</a></h5>
                                                <div class="cart-text-btn">
                                                    <div class="cart-qty">
                                                        <span>1×</span>
                                                        <span class="cart-price">$98.00</span>
                                                    </div>
                                                    <button type="button"><i class="ion-trash-b"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cart-price-total d-flex justify-content-between">
                                            <h5>Total :</h5>
                                            <h5>$166.00</h5>
                                        </div>
                                        <div class="cart-links d-flex justify-content-center">
                                            <a class="obrien-button white-btn" href="cart.html">View cart</a>
                                            <a class="obrien-button white-btn" href="checkout.html">Checkout</a>
                                        </div>
                                    </div> -->
                                            </li>
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
                                       <a href="#">
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
                                                <a href="/showAllShopProductInfo">
                                                    <span class="menu-text">店家</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul id="shop_ul_2">
<%--                                                         <c:forEach var="shopBeanList" items="${shopBeanList}"> --%>
<%--                                                             <li><a href="<c:url value='/findSingleShop/${ shopBeanList.shopID}'/>">${ shopBeanList.shopName}</a></li> --%>
<%--                                                          </c:forEach> --%>
<!--                                                             <li><span class="mega-menu-text">Location</span></li> -->
<!--                                                             <li><a href="#">店家A</a></li> -->
<!--                                                             <li><a href="#">店家B</a></li> -->
<!--                                                             <li><a href="#">店家C</a></li> -->
<!--                                                             <li><a href="#">店家D</a></li> -->
<!--                                                             <li><a href="#">店家E</a></li> -->
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
                                                        <ul>
                                                           <c:forEach var="productTypeList" items="${productTypeList}">
                                                               <li><a href="${productTypeList.productTypeID}">${productTypeList.productTypeName}</a></li>
                                                           </c:forEach> 
<!--                                                           <li><a href="#">水果</a></li> -->
<!--                                                           <li><a href="#">肉品</a></li> -->                                                             
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>                                           
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">會員專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="/modifyMemberInfo">更改會員資料</a></li>
                                                            <li><a href="/memberArtical">我的發文</a></li>
                                                            <li><a href="/orderSelect">訂單查詢</a></li>
                                                            <li><a href="/shoppingCart">購物車</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">廠商合作專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="/addShopForm">商家銷售合作</a></li>
                                                            <li><a href="<c:url value='/showProductCooperateForm' />">商品銷售合作</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">論壇</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="#">主題A</a></li>
                                                            <li><a href="#">主題B</a></li>
                                                            <li><a href="#">主題C</a></li>
                                                            <li><a href="#">主題D</a></li>
                                                            <li><a href="#">主題E</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
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
                                                <span>您好,${LoginOK.shopKeeper}</span>
                                                <span  onclick="return confirm('請問是否要登出?');"><a href="LogoutServlet">登出</a></span>
                                                <!--<span><a href="/login.jsp">登入</a></span>  -->
                                                <!--<span><a href="/register.jsp">註冊</a></span>  -->
                                            </li>
                                            <li class="minicart-wrap">
                                                <a href="#" class="minicart-btn toolbar-btn">
                                                    <i class="ion-bag"></i>
                                                    <span class="cart-item_count"></span>
                                                </a>
                                                <!--購物車-->
                                                <!-- <div class="cart-item-wrapper dropdown-sidemenu dropdown-hover-2">
                                        <div class="single-cart-item">
                                            <div class="cart-img">
                                                <a href="cart.html"><img src="assets/images/cart/1.jpg" alt=""></a>
                                            </div>
                                            <div class="cart-text">
                                                <h5 class="title"><a href="cart.html">11. Product with video - navy</a></h5>
                                                <div class="cart-text-btn">
                                                    <div class="cart-qty">
                                                        <span>1×</span>
                                                        <span class="cart-price">$98.00</span>
                                                    </div>
                                                    <button type="button"><i class="ion-trash-b"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single-cart-item">
                                            <div class="cart-img">
                                                <a href="cart.html"><img src="assets/images/cart/2.jpg" alt=""></a>
                                            </div>
                                            <div class="cart-text">
                                                <h5 class="title"><a href="cart.html" title="10. This is the large title for testing large title and there is an image for testing - white">10. This is the large title for testing...</a></h5>
                                                <div class="cart-text-btn">
                                                    <div class="cart-qty">
                                                        <span>1×</span>
                                                        <span class="cart-price">$98.00</span>
                                                    </div>
                                                    <button type="button"><i class="ion-trash-b"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single-cart-item">
                                            <div class="cart-img">
                                                <a href="cart.html"><img src="assets/images/cart/3.jpg" alt=""></a>
                                            </div>
                                            <div class="cart-text">
                                                <h5 class="title"><a href="cart.html">1. New and sale badge product - s / red</a></h5>
                                                <div class="cart-text-btn">
                                                    <div class="cart-qty">
                                                        <span>1×</span>
                                                        <span class="cart-price">$98.00</span>
                                                    </div>
                                                    <button type="button"><i class="ion-trash-b"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cart-price-total d-flex justify-content-between">
                                            <h5>Total :</h5>
                                            <h5>$166.00</h5>
                                        </div>
                                        <div class="cart-links d-flex justify-content-center">
                                            <a class="obrien-button white-btn" href="cart.html">View cart</a>
                                            <a class="obrien-button white-btn" href="checkout.html">Checkout</a>
                                        </div>
                                    </div> -->
                                            </li>
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
<Script> 
var xhr0 = new XMLHttpRequest();               
var shopList = [];
xhr0.open("GET","<c:url value='/findAllShop.json' />",true);
xhr0.send();
xhr0.onreadystatechange = function(){
    if(xhr0.readyState == 4 && xhr0.status == 200){
    	var shops = JSON.parse(xhr0.responseText);//將回應的JSON字串轉為javaScript物件
    	var context = "";
//     	var shopList0 = ["所有分類",0];
//     	productTypeList.push(productType0);
            for (var i = 0; i < shops.length; i++) {          	
            	context += "<li><a href=\"<c:url value='/findSingleShop/"
            	        + shops[i].shopID
            	        + "'/>\">"
            	        + shops[i].shopName
            	        + "</a></li>"
        	}                  		
    		var divs1 = document.getElementById("shop_ul");
    		var divs2= document.getElementById("shop_ul_2"); 
//     		var divs = document.querySelectorAll("#shop_ul, #shop_ul_2");
       		divs1.innerHTML = context;
       		divs2.innerHTML = context;
            	                   	                    	                 	        
// 	            var product = [shops[i].productTypeName, shops[i].shopID];
//                 productTypeList.push(productType);
//            	}
            
//         for (var i = 0; i < productTypeList.length; i++) {
//            	var option = new Option(productTypeList[i][0], productTypeList[i][1]);
//          	selectElement.options[selectElement.options.length] = option;
//         }          	
//     }

    }
}

</Script>