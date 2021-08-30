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
                            <form method="POST" action="addNewProduct" enctype="multipart/form-data">                    
                                <div class="single-input-item mb-3" style="display:none">
                                    <label>ShopID</label><input  type="text" name="shopID" id="shopID" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>上架時間</label><input  type="text" name="saleDate" id="saleDate"/>
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品名稱</label><input  type="text" name="productName" />
                                </div>
<!--                            <div class="single-input-item mb-3"> -->
<!--                                <label>商品分類</label><select name="productTypeIDList" id="productTypeIDList" multiple></select> -->
<!--                            </div> -->
                                <div class="checkout-form-list create-acc" id="productTypeIDList">
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>可供數量</label><input  type="text" name="quantity" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>價格</label><input  type="text" name="price" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>規格</label><input  type="text" name="standard" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>重量/容量</label><input  type="text" name="capacity" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>產地</label><input  type="text" name="place" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>保存方式</label><input  type="text" name="preserve" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品特色</label><textarea name="productDescribe"></textarea>
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
           var ShopID =  document.getElementById("shopID");
           shopID.value = ${LoginOK.shopID};
        
            var NowDate =new Date();　
            var saleDate = document.getElementById("saleDate");
            saleDate.value = NowDate.getFullYear()+"/"+(NowDate.getMonth()+1)+"/"+NowDate.getDate()+" "+NowDate.getHours()+":"+NowDate.getMinutes()+":"+NowDate.getSeconds();
            
            var selectElement = document.getElementById('productTypeIDList');          
            var xhr = new XMLHttpRequest();
            var productTypeList = [];
            xhr.open("GET","<c:url value='/getAllProductTypeList.json' />",true);
            xhr.send();
            xhr.onreadystatechange = function(){
            	if(xhr.readyState == 4 && xhr.status == 200){
            		var productTypes = JSON.parse(xhr.responseText);//將回應的JSON字串轉為javaScript物件
            		
            		//將商品類別列表 放進下拉式選單 (<select> <option>) 
//             		for (var i = 0; i < productTypes.length; i++) {
//             			var productType = [ productTypes[i].productTypeName, productTypes[i].productTypeID];
//             			productTypeList.push(productType);
//             		}
//             		for (var i = 0; i < productTypeList.length; i++) {
//     					var option = new Option(productTypeList[i][0], productTypeList[i][1]);
//     					selectElement.options[selectElement.options.length] = option;
//             	    } 

                    //將商品類別列表 放進checkbox( <input type="checkbox" ...> )
                    var context = "<label>商品分類</label><br>";
                    for (var i = 0; i < productTypes.length; i++) {
            			context += "<input id='"
            			        + productTypes[i].productTypeID
            			        + "' type='checkbox' name='productTypeIDList' value='"
            			        + productTypes[i].productTypeID
            			        + "'>"
            			        + "<label for='"
            			        + productTypes[i].productTypeID
            			        + "'>"
            			        + productTypes[i].productTypeName
            			        + "</label>"            	
            		}
                    context +="<div><br></div>";
            		selectElement.innerHTML = context;
                }
             }

            <!--   <div class="col-md-12"> -->
//                     <div class="checkout-form-list create-acc">
//                        <input id='productTypes[i].productTypeID' type='checkbox' value='productTypes[i].productTypeID'>
//                        <label for='productTypes[i].productTypeID'>productTypes[i].productTypeName</label>
//                      </div>
            <!--   </div> -->
         </script>
        <!-- 商品銷售註冊欄 End Here -->        
 <!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />

</body>

</html>
