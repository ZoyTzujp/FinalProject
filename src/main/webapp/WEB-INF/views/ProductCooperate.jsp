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
        <!-- 商品銷售註冊欄 Start Here -->
        <div class="login-register-area mt-no-text mb-no-text">
            <div class="container container-default-2 custom-area">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-custom">
                        <div class="login-register-wrapper">
                            <div class="section-content text-center mb-5">
                                <h2 class="title-4 mb-2">商品銷售合作</h2>
                                <p class="desc-content">請輸入銷售資訊</p>
                            </div>
                            <form method="POST" action="addnewproduct" enctype="multipart/form-data">
                                <div class="single-input-item mb-3">
                                    <label>ShopID</label><input  type="text" name="shopID" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品名稱</label><input  type="text" name="productName" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品分類</label><select name="productTypeIDList" id="productTypeIDList" multiple></select>
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>上架日期</label><input  type="text" name="saleDate" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>可供數量</label><input  type="text" name="quantity" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>價格</label><input  type="text" name="price" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品描述</label><textarea name="productDescribe"></textarea>
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品圖片</label><input type="file" name="producImage" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                        <div class="remember-meta mb-3">
                                        </div>
                                    </div>
                                </div>
                                <div class="single-input-item mb-3">
                                    <button class="btn obrien-button-2 primary-color" type="submit">新增</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var selectElement = document.getElementById('productTypeIDList');          
            var xhr = new XMLHttpRequest();
            var productTypeList = [];
            xhr.open("GET","<c:url value='/getAllProductTypeList' />",true);
            xhr.send();
            xhr.onreadystatechange = function(){
            	if(xhr.readyState == 4 && xhr.status == 200){
            		var productTypes = JSON.parse(xhr.responseText);//將回應的JSON字串轉為javaScript物件
            		for (var i = 0; i < productTypes.length; i++) {
            			var productType = [ productTypes[i].productTypeName, productTypes[i].productTypeID];
            			productTypeList.push(productType);
            		}
            		for (var i = 0; i < productTypeList.length; i++) {
    					var option = new Option(productTypeList[i][0], productTypeList[i][1]);
    					selectElement.options[selectElement.options.length] = option;
            	    }           	
                }
             }	                                      
         </script>
        <!-- 商品銷售註冊欄 End Here -->        
 <!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />

</body>

</html>
