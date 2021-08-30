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
</head>

<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />

        <!-- Single Product Main Area Start -->
        <div class="single-product-main-area">
            <div class="container container-default custom-area">
                <div class="row">
                    <div class="col-lg-5 col-custom">
                        <div class="product-details-img horizontal-tab">
                            <div class="product-slider popup-gallery product-details_slider" data-slick-options='{
                        "slidesToShow": 1,
                        "arrows": false,
                        "fade": true,
                        "draggable": false,
                        "swipe": false,
                        "asNavFor": ".pd-slider-nav"
                        }'>
                                <div class="single-image border">
                                    <a href="<c:url value='/getProductImage' />?id=${product.productID}">
                                        <img src="<c:url value='/getProductImage' />?id=${product.productID}" alt="Product">
                                    </a>
                                </div>                               
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-custom">
                        <div class="product-summery position-relative">
                            <div class="product-head mb-3">
                                <h2 class="product-title">${product.productName}</h2>
                            </div>
                            <div class="price-box mb-2">
                                <span class="regular-price">$${product.price}</span>
                            </div>
                            <div class="sku mb-3">
                                <span>商品編號:${product.productID}</span>
                                <br>
                                <span>規格:${product.standard}</span>
                                <br>
                                <span>產地:${product.place}</span>
                                <br>
                                <span>庫存:${product.quantity-product.saleQty}</span>
                            </div>
                            <p class="desc-content mb-5"></p>
                            <FORM  action="<c:url value='/buyProduct' />" method="POST"> 
	                           <div class="quantity-with_btn mb-4">
	                               <div class="quantity">
	                                   <div class="cart-plus-minus">
	                                      <select name="newSaleQty">
	                                        <c:forEach var="i" begin="1" end="${product.quantity-product.saleQty}">
	                                           <option value="${i}">${i}</option>
	                                        </c:forEach>                                                        
	                                      </select>
	                                   </div>
	                               </div>                                  
	                               <Input type='hidden' name='productID' value='${product.productID}'>
	                               <div class="add-to_cart">
	                                   <Input class="btn obrien-button primary-btn" type="submit" value="加入購物車">
	                                   <a class="btn obrien-button-2 treansparent-color pt-0 pb-0" href="wishlist.html">收藏</a>
	                               </div>
	                           </div>
	                           <div class="buy-button mb-5">
	                               <a href="#" class="btn obrien-button-3 black-button">購買</a>
	                           </div>
                            </FORM>
                            <div class="social-share mb-4">
                                <span>分享:</span>
                                <a href="#"><i class="fa fa-facebook-square facebook-color"></i></a>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="row mt-no-text">
                    <div class="col-lg-12">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active text-uppercase" id="home-tab" data-toggle="tab" href="#connect-1" role="tab" aria-selected="true">商品特色</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-uppercase" id="profile-tab" data-toggle="tab" href="#connect-2" role="tab" aria-selected="false">商品規格</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-uppercase" id="contact-tab" data-toggle="tab" href="#connect-3" role="tab" aria-selected="false">購物說明</a>
                            </li>
                        </ul>
                        <div class="tab-content mb-text" id="myTabContent">
                            <div class="tab-pane fade show active" id="connect-1" role="tabpanel" aria-labelledby="home-tab">
                                <div class="desc-content">
                                    <p class="mb-3">${product.productDescribe}</p>                                  
                                </div>
                            </div>
                            <div class="tab-pane fade" id="connect-2" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="shipping-policy">
<!--                                     <h4 class="title-3 mb-4">下單前請確認商品規格重量!</h4> -->
                                    <ul class="policy-list mb-2">
                                        <li>品名:${product.productName}</li>
                                        <li>規格:${product.standard}</li>
                                        <li>重量/容量:${product.capacity}</li>
                                        <li>產地:${product.place}</li>
                                        <li>保存方式:${product.preserve}</li>
                                    </ul>
                                 </div>
                            </div>                                  
                            <div class="tab-pane fade" id="connect-3" role="tabpanel" aria-labelledby="contact-tab">
                                <div class="shipping-policy">
                                    <h4 class="title-3 mb-4">付款方式</h4>
                                      <br> 
                                      <img class="border" src="<c:url value='/images/payment/PayWay.PNG' />" alt="PayWay">
                                      <br>
                                      <p class="desc-content mb-2">接受付款方式有VISA、MASTERCARD、JCB、聯合信用卡。</p>                                  
                                    <h4 class="title-3 mb-4">退換貨須知</h4>
                                      <ul class="policy-list mb-2">
                                         <li>根據消保法規定，食品不在商品到貨七天猶豫期之範圍內；但若運送過程導致產品瑕疵煩請立即聯繫客服詢問。</li>
                                         <li>如您收到商品，請依正常程序儘速檢查商品內容是否有損壞之現象（如變質、異味、產品破損等），若有請拍照並立即聯繫客服詢問處理， 我們會立即派專員將商品取回，並將原商品價格全額退還或是更換新品給您。（使用信用卡付款，我們將採用退刷方式直接將款項退回您信用卡上。</li>                                     
                                      </ul>
                                      <p class="desc-content mb-2">【客服專線】若您有任何疑問，請於上班時間致電客服專線：02-2297-7000；服務時間：週一至週日 08：00-20：00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product Main Area End -->
              
 <!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />

</body>

</html>
