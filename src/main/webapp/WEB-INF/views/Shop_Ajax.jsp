<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Obrien</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    

    <!-- CSS
	============================================ -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="assets/css/vendor/font.awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="assets/css/vendor/ionicons.min.css">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="assets/css/plugins/slick.min.css">
    <!-- Animation -->
    <link rel="stylesheet" href="assets/css/plugins/animate.min.css">
    <!-- jQuery Ui -->
    <link rel="stylesheet" href="assets/css/plugins/jquery-ui.min.css">
    <!-- Nice Select -->
    <link rel="stylesheet" href="assets/css/plugins/nice-select.min.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="assets/css/plugins/magnific-popup.css">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from the above) -->

    <!-- <link rel="stylesheet" href="assets/css/vendor/vendor.min.css">
    <link rel="stylesheet" href="assets/css/plugins/plugins.min.css"> -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- <link rel="stylesheet" href="assets/css/style.min.css"> -->
</head>

<body>
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
                                            <img class="img-full" src="assets/images/logo/logo.png" alt="Header Logo">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-xl-7 position-static d-none d-lg-block col-custom">
                                    <nav class="main-nav d-flex justify-content-center">
                                        <ul class="nav">
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text"> Home</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">店家</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="#">店家A</a></li>
                                                            <li><a href="#">店家B</a></li>
                                                            <li><a href="#">店家C</a></li>
                                                            <li><a href="#">店家D</a></li>
                                                            <li><a href="#">店家E</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">商品</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="">蔬菜</a></li>
                                                            <li><a href="">水果</a></li>
                                                            <li><a href="">肉品</a></li>
                                                            <li><a href="">海鮮</a></li>
                                                            <li><a href="">特色熟食</a></li>
                                                            <li><a href="">快速美食</a></li>
                                                            <li><a href="">蛋/米麵</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text"> 快配服務</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">會員專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="#">更改會員資料</a></li>
                                                            <li><a href="#">訂單查詢</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="ShopCooperate.jsp">
                                                    <span class="menu-text">廠商合作專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="ShopCooperate.jsp">商家銷售合作</a></li>
                                                            <li><a href="<c:url value='/ShopCooperate' />">商品銷售合作</a></li>
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
                                                <span>您好,${account}</span>
                                                <!--<span><a href="/login.jsp">登入</a></span>  -->
                                                <!--<span><a href="/register.jsp">註冊</a></span>  -->
                                            </li>
                                            <li class="minicart-wrap">
                                                <a href="#" class="minicart-btn toolbar-btn">
                                                    <i class="ion-bag"></i>
                                                    <span class="cart-item_count">3</span>
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
                                    <div class="header-logo">
                                        <a href="#">
                                            <img class="img-full" src="assets/images/logo/logo.png" alt="Header Logo">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-xl-7 position-static d-none d-lg-block col-custom">
                                    <nav class="main-nav d-flex justify-content-center">
                                        <ul class="nav">
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text"> Home</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">店家</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="#">店家A</a></li>
                                                            <li><a href="#">店家B</a></li>
                                                            <li><a href="#">店家C</a></li>
                                                            <li><a href="#">店家D</a></li>
                                                            <li><a href="#">店家E</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">商品</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="#">蔬菜</a></li>
                                                            <li><a href="#">水果</a></li>
                                                            <li><a href="#">肉品</a></li>
                                                            <li><a href="#">海鮮</a></li>
                                                            <li><a href="#">特色熟食</a></li>
                                                            <li><a href="#">快速美食</a></li>
                                                            <li><a href="#">蛋/米麵</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text"> 快配服務</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="menu-text">會員專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="#">更改會員資料</a></li>
                                                            <li><a href="#">訂單查詢</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="ShopCooperate.jsp">
                                                    <span class="menu-text">廠商合作專區</span>
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <div class="mega-menu dropdown-hover">
                                                    <div class="menu-colum">
                                                        <ul>
                                                            <li><a href="ShopCooperate.jsp">商家銷售合作</a></li>
                                                            <li><a href="ShopCooperate.jsp">商品銷售合作</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="">
                                                    <span class="menu-text">關於</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="">
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
                                                <span>您好,${account}</span>
                                                <!--<span><a href="/login.jsp">登入</a></span>  -->
                                                <!--<span><a href="/register.jsp">註冊</a></span>  -->
                                            </li>
                                            <li class="minicart-wrap">
                                                <a href="#" class="minicart-btn toolbar-btn">
                                                    <i class="ion-bag"></i>
                                                    <span class="cart-item_count">3</span>
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
 <!-- 商品銷售欄 Start Here -->
 <div class="shop-main-area">
    <div class="container container-default custom-area">
        <div class="row flex-row-reverse">
            <div class="col-lg-9 col-12 col-custom widget-mt">
                <!--商品銷售欄 上方分類欄start-->
                <div class="shop_toolbar_wrapper">
                    <div class="shop-select">
                        <form class="d-flex flex-column w-100" action="#">
                            <div class="form-group">
                                <select  class="form-control nice-select w-100"  name="productTypeIDList" id="productTypeIDList">
<!--                                 <select class="form-control nice-select w-100" > -->
<!--                                     <option selected value="1">Alphabetically, A-Z</option> -->
<!--                                     <option value="2">Sort by popularity</option> -->
<!--                                     <option value="3">Sort by newness</option> -->
<!--                                     <option value="4">Sort by price: low to high</option> -->
<!--                                     <option value="5">Sort by price: high to low</option> -->
<!--                                     <option value="6">Product Name: Z</option> -->
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
                <script>
                    var selectElement = document.getElementById('productTypeIDList');          
                    var xhr0 = new XMLHttpRequest();
                    var xhr0_2 = new XMLHttpRequest();
                    var productTypeList = [];
                    xhr0.open("GET","<c:url value='/getAllProductTypeList' />",true);
                    xhr0.send();
                    xhr0.onreadystatechange = function(){
            	        if(xhr0.readyState == 4 && xhr0.status == 200){
            	        	var productTypes = JSON.parse(xhr0.responseText);//將回應的JSON字串轉為javaScript物件
            	        	var perproductType = ["所有分類",0];
            	        	productTypeList.push(perproductType);
            		            for (var i = 0; i < productTypes.length; i++) {
            			            var productType = [productTypes[i].productTypeName, productTypes[i].productTypeID];
            		                productTypeList.push(productType);
            	               	}
            		
            		        for (var i = 0; i < productTypeList.length; i++) {
    				           	var option = new Option(productTypeList[i][0], productTypeList[i][1]);
    				         	selectElement.options[selectElement.options.length] = option;
            	            }          	
                        }
                    }
                    selectElement.onchange = function(){
                    	xhr0_2.onreadystatechange = function() {
            				if (xhr0_2.readyState == 4 && xhr0_2.status == 200) {
            					displayPageBooks(xhr0_2.responseText);
            				}
            			}
         </script>
                <!--商品銷售欄 上方分類欄 end-->
                <!-- 商品銷售欄 商品欄 Start -->
                <div class="row shop_wrapper grid_3" id="single-product">  
<!--            ------------------           -->
<!--                     <div class="col-md-6 col-sm-6 col-lg-4 col-custom product-area" > -->
<!--                         <div class="single-product position-relative"> -->
<!--                             <div class="product-image" id="img"> -->
<!--                                 <a class="d-block" href="product-details.html"> -->
<!--                                     <img src="assets/images/product/1.jpg" alt="" class="product-image-1 w-100"> -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                             <div class="product-content" id="product_name_price"> -->
<!--                                 <div class="product-title"> -->
<!--                                     <h4 class="title-2"> <a href="product-details.html">Product dummy name</a></h4> -->
<!--                                 </div> -->
<!--                                 <div class="price-box"> -->
<!--                                     <span class="regular-price ">$80.00</span> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="add-action d-flex position-absolute"> -->
<!--                                 <a href="cart.html" title="Add To cart"> -->
<!--                                     <i class="ion-bag"></i> -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                             <div class="product-content-listview" id="product_name_price_2"> -->
<!--                                 <div class="product-title"> -->
<!--                                     <h4 class="title-2"> <a href="product-details.html">Product dummy name</a></h4> -->
<!--                                 </div> -->
<!--                                 <div class="price-box"> -->
<!--                                     <span class="regular-price ">$80.00</span>                                -->
<!--                                 </div> -->
<!--                                 <div class="add-action-listview d-flex"> -->
<!--                                     <a href="cart.html" title="Add To cart"> -->
<!--                                         <i class="ion-bag"></i> -->
<!--                                     </a>                                    -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                      </div>    -->
<!--            ------------------           -->                      
                </div>
                <script>
                    var xhr = new XMLHttpRequest();
                    var imageURL = "<c:url value='/getProductImage' />"
                    xhr.open("GET","<c:url value='/getAllProduct' />",true);
                    xhr.send();
                    xhr.onreadystatechange = function(){
                    	if(xhr.readyState == 4 && xhr.status == 200){
                    		var productList = JSON.parse(xhr.responseText);
                    		var context = "";
                    		for(var i=0;i<productList.length;i++){                                            
                              context += "<div class='col-md-6 col-sm-6 col-lg-4 col-custom product-area' >"
                                       + "<div class='single-product position-relative'>"
                                       + "<div class='product-image' id='img'>"
                                       + "<a class='d-block' href='XXXXXXXXX'>"
                                       + "<img src='"+imageURL+"?id="+productList[i].productID
                                       + "' alt='' class='product-image-1 w-100'>"
                                       + "</a>"
                                       + "</div>"
                                       + "<div class='product-content' id='product_name_price'>"
                                       + "<div class='product-title'>"
                                       + "<h4 class='title-2'> <a href='XXXXXXXXX'>" + productList[i].productName + "</a></h4>"                                  
                                       + "</div>"
                                       + "<div class='price-box'>"
                                       + "<span class='regular-price '>$" + productList[i].price + "</span>"
                                       + "</div>"
                                       + "</div>"
                                       + "<div class='add-action d-flex position-absolute'>"
                                       + "<a href='cart.html' title='Add To cart'>"
                                       + "<i class='ion-bag'></i>"
                                       + "</a>"
                                       + "</div>"
                                       + "<div class='product-content-listview' id='product_name_price_2'>"
                                       + "<div class='product-title'>"
                                       + "<h4 class='title-2'> <a href='XXXXXXXXX'>" + productList[i].productName + "</a></h4>"
                                       + "</div>"
                                       + "<div class='price-box'>"
                                       + "<span class='regular-price '>$" + productList[i].price + "</span>"
                                       + "</div>"
                                       + "<div class='add-action-listview d-flex'>"
                                       + "<a href='cart.html' title='Add To cart'>"
                                       + "<i class='ion-bag'></i>"
                                       + "</a>"
                                       + "</div></div></div></div>"                          
                    		}                    		
                    		var divs = document.getElementById("single-product");
                       		divs.innerHTML = context;
                    	}
                    }
                </script> 
                <!-- 商品銷售欄 商品欄 End -->
                <!-- 商品銷售欄 下方分頁欄 Start -->
                <div class="row">
                    <div class="col-sm-12 col-custom">
                        <div class="toolbar-bottom mt-30">
                            <nav class="pagination pagination-wrap mb-10 mb-sm-0">
                                <ul class="pagination">
                                    <li class="disabled prev">
                                        <i class="ion-ios-arrow-thin-left"></i>
                                    </li>
                                    <li class="active"><a>1</a></li>
                                    <li>
                                        <a href="#">2</a>
                                    </li>
                                    <li class="next">
                                        <a href="#" title="Next >>"><i class="ion-ios-arrow-thin-right"></i></a>
                                    </li>
                                </ul>
                            </nav>
                            <p class="desc-content text-center text-sm-right">Showing 1 - 12 of 34 result</p>
                        </div>
                    </div>
                </div>
                <!-- 商品銷售欄 下方分頁欄 End -->
            </div>
            <div class="col-lg-3 col-12 col-custom">
                <!-- 商品銷售欄 右方分類欄 Start -->
                <aside class="sidebar_widget widget-mt">
                    <div class="widget_inner">
                        <div class="widget-list widget-mb-1">
                            <h3 class="widget-title">Search</h3>
                            <div class="search-box">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search Our Store" aria-label="Search Our Store">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="widget-list widget-mb-1">
                            <h3 class="widget-title">Menu Categories</h3>
                            <!-- 商品銷售欄 右方分類欄 商品分類 Start -->
                            <nav>
                                <ul class="mobile-menu p-0 m-0">
                                    <li class="menu-item-has-children"><a href="#">Breads</a>
                                        <ul class="dropdown">
                                            <li><a href="#">Skateboard (02)</a></li>
                                            <li><a href="#">Surfboard (4)</a></li>
                                            <li><a href="#">Accessories (3)</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children"><a href="#">Fruits</a>
                                        <ul class="dropdown">
                                            <li><a href="#">Samsome</a></li>
                                            <li><a href="#">GL Stylus (4)</a></li>
                                            <li><a href="#">Uawei (3)</a></li>
                                            <li><a href="#">Avocado (3)</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children"><a href="#">Vagetables</a>
                                        <ul class="dropdown">
                                            <li><a href="#">Power Bank</a></li>
                                            <li><a href="#">Data Cable (4)</a></li>
                                            <li><a href="#">Avocado (3)</a></li>
                                            <li><a href="#">Brocoly (3)</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children"><a href="#">Organic Food</a>
                                        <ul class="dropdown">
                                            <li><a href="#">Vagetables</a></li>
                                            <li><a href="#">Green Food (4)</a></li>
                                            <li><a href="#">Coconut (3)</a></li>
                                            <li><a href="#">Cabage (3)</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                            <!-- 商品銷售欄 右方分類欄 商品分類 End -->
                        </div>
                        <div class="widget-list widget-mb-1">
                            <h3 class="widget-title">Categories</h3>
                            <div class="sidebar-body">
                                <ul class="sidebar-list">
                                    <li><a href="#">All Product</a></li>
                                    <li><a href="#">Best Seller (5)</a></li>
                                    <li><a href="#">Featured (4)</a></li>
                                    <li><a href="#">New Products (6)</a></li>
                                </ul>
                            </div>
                        </div>                        
                        <div class="widget-list widget-mb-4">
                            <h3 class="widget-title">Recent Products</h3>
                            <div class="sidebar-body">
                                <div class="sidebar-product align-items-center">
                                    <a href="product-details.html" class="image">
                                        <img src="assets/images/product/small-product/1.jpg" alt="product">
                                    </a>
                                    <div class="product-content">
                                        <div class="product-title">
                                            <h4 class="title-2"> <a href="product-details.html">Product dummy name</a></h4>
                                        </div>
                                        <div class="price-box">
                                            <span class="regular-price ">$80.00</span>
                                            <span class="old-price"><del>$90.00</del></span>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="sidebar-product align-items-center">
                                    <a href="product-details.html" class="image">
                                        <img src="assets/images/product/small-product/2.jpg" alt="product">
                                    </a>
                                    <div class="product-content">
                                        <div class="product-title">
                                            <h4 class="title-2"> <a href="product-details.html">Product dummy title</a></h4>
                                        </div>
                                        <div class="price-box">
                                            <span class="regular-price ">$50.00</span>
                                            <span class="old-price"><del>$60.00</del></span>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="sidebar-product align-items-center">
                                    <a href="product-details.html" class="image">
                                        <img src="assets/images/product/small-product/3.jpg" alt="product">
                                    </a>
                                    <div class="product-content">
                                        <div class="product-title">
                                            <h4 class="title-2"> <a href="product-details.html">Product title here</a></h4>
                                        </div>
                                        <div class="price-box">
                                            <span class="regular-price ">$40.00</span>
                                            <span class="old-price"><del>$50.00</del></span>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
                <!-- 商品銷售欄 右方分類欄 End -->
            </div>
        </div>
    </div>
</div>
<!-- 商品銷售欄 End Here -->
        <!-- Footer Area Start Here -->
       <footer class="footer-area">
        <div class="footer-widget-area">
            <div class="container container-default custom-area">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-3 col-custom">
                        <div class="single-footer-widget m-0">
                            <div class="footer-logo">
                                <a href="index.html">
                                    <img src="assets/images/logo/footer.png" alt="Logo Image">
                                </a>
                            </div>
                            <!-- <p class="desc-content">Obrien is the best parts shop of your daily nutritions. What kind of
                                nutrition do you need you can get here soluta nobis</p> -->
                            <div class="social-links">
                                <ul class="d-flex">
                                    <li>
                                        <a class="border rounded-circle" href="#" title="Facebook">
                                            <i class="fa fa-facebook-f"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="border rounded-circle" href="#" title="Twitter">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="border rounded-circle" href="#" title="Linkedin">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="border rounded-circle" href="#" title="Youtube">
                                            <i class="fa fa-youtube"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="border rounded-circle" href="#" title="Vimeo">
                                            <i class="fa fa-vimeo"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="col-12 col-sm-6 col-md-6 col-lg-2 col-custom">
                        <div class="single-footer-widget">
                            <h2 class="widget-title">Information</h2>
                            <ul class="widget-list">
                                <li><a href="about-us.html">Our Company</a></li>
                                <li><a href="contact-us.html">Contact Us</a></li>
                                <li><a href="about-us.html">Our Services</a></li>
                                <li><a href="about-us.html">Why We?</a></li>
                                <li><a href="about-us.html">Careers</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-2 col-custom">
                        <div class="single-footer-widget">
                            <h2 class="widget-title">Quicklink</h2>
                            <ul class="widget-list">
                                <li><a href="about-us.html">About</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="cart.html">Cart</a></li>
                                <li><a href="contact-us.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-2 col-custom">
                        <div class="single-footer-widget">
                            <h2 class="widget-title">Support</h2>
                            <ul class="widget-list">
                                <li><a href="contact-us.html">Online Support</a></li>
                                <li><a href="contact-us.html">Shipping Policy</a></li>
                                <li><a href="contact-us.html">Return Policy</a></li>
                                <li><a href="contact-us.html">Privacy Policy</a></li>
                                <li><a href="contact-us.html">Terms of Service</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-custom">
                        <div class="single-footer-widget">
                            <h2 class="widget-title">See Information</h2>
                            <div class="widget-body">
                                <address>123, H2, Road #21, Main City, Your address goes here.<br>Phone: 01254 698 785,
                                    36598 254 987<br>Email: https://example.com</address>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>       
    </footer>
    <!-- Footer Area End Here -->
    <!-- JS
============================================ -->

    <!-- jQuery JS -->
    <script src="assets/js/vendor/jquery-3.5.1.min.js"></script>
    <!-- jQuery Migrate JS -->
    <script src="assets/js/vendor/jQuery-migrate-3.3.0.min.js"></script>
    <!-- Modernizer JS -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="assets/js/vendor/bootstrap.bundle.min.js"></script>
    <!-- Slick Slider JS -->
    <script src="assets/js/plugins/slick.min.js"></script>
    <!-- Countdown JS -->
    <script src="assets/js/plugins/jquery.countdown.min.js"></script>
    <!-- Ajax JS -->
    <script src="assets/js/plugins/jquery.ajaxchimp.min.js"></script>
    <!-- Jquery Nice Select JS -->
    <script src="assets/js/plugins/jquery.nice-select.min.js"></script>
    <!-- Jquery Ui JS -->
    <script src="assets/js/plugins/jquery-ui.min.js"></script>
    <!-- jquery magnific popup js -->
    <script src="assets/js/plugins/jquery.magnific-popup.min.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

</body>

</html>
