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
                                <h2 class="title-4 mb-2">編輯商品銷售資訊</h2>
                                <p class="desc-content">請輸入銷售資訊</p>
                            </div> 
                            <form method="POST" action="<c:url value='/editproduct' />" enctype="multipart/form-data">                    
                                <div class="single-input-item mb-3" style="display:none">
                                    <label>ShopID</label><input  type="text" name="shopID" id="shopID"/>
                                </div>
                                <div class="single-input-item mb-3" style="display:none">
                                    <label>ProductID</label><input  type="text" name="productID" id="productID" value="${product.productID}"/>
                                </div>
                                <div class="single-input-item mb-3" style="display:none">
                                    <label>上架時間</label><input  type="text" name="saleDate" id="saleDate" value="${product.saleDate}"/>
                                </div>
                                <div class="single-input-item mb-3" style="display:none">
                                    <label>saleQty</label><input  type="text" name="saleQty" id="saleQty" value="${product.saleQty}"/>
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品名稱</label><input  type="text" name="productName" value="${product.productName}"/>
                                </div>
                                <div class="checkout-form-list create-acc" id="productTypeIDList">
<!--                                <label>商品分類</label>  Ajax取得  -->
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>可供數量</label><input  type="text" name="quantity" value="${product.quantity}"/>
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>價格</label><input  type="text" name="price" value="${product.price}" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>規格</label><input  type="text" name="standard" value="${product.standard}" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>重量/容量</label><input  type="text" name="capacity" value="${product.capacity}" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>產地</label><input  type="text" name="place" value="${product.place}" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>保存方式</label><input  type="text" name="preserve" value="${product.preserve}" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品特色</label><textarea name="productDescribe" >${product.productDescribe}</textarea>
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品圖片</label><br><img width="50%" src="<c:url value='/getProductImage' />?id=${product.productID}" alt="" >
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>修改商品圖片</label><input type="file" name="producImage" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                        <div class="remember-meta mb-3">
                                        </div>
                                    </div>
                                </div>
                                <div class="single-input-item mb-3">
                                    <button class="btn obrien-button-2 primary-color" type="submit" onclick="return confirm('確認要修改銷售內容?');">修改</button>
                                    <button class="btn obrien-button-2 primary-color" type="submit" onclick="return confirm('確認要刪除銷售內容?');">刪除</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
           var shopID =  document.getElementById("shopID");
           shopID.value = ${LoginOK.shopID};    
            
            var selectElement = document.getElementById('productTypeIDList');          
            var xhr = new XMLHttpRequest();
            var productTypeList = [];
            xhr.open("GET","<c:url value='/getAllProductTypeList.json' />",true);  //取出資料庫所有商品類型
            xhr.send();
            xhr.onreadystatechange = function(){
            	if(xhr.readyState == 4 && xhr.status == 200){
            		var allProductTypes = JSON.parse(xhr.responseText);//將回應的JSON字串轉為javaScript物件 
            		
            		var xhr1 = new XMLHttpRequest();
            		var url = "<c:url value='/getProductTypeListByProductID.json/'/>"+${product.productID}  //取出指定productID的所有商品類型
            		xhr1.open("GET",url,true);
            		xhr1.send();
            		xhr1.onreadystatechange = function(){
            			if(xhr.readyState == 4 && xhr.status == 200){
            				var getProductTypeListByProductID = JSON.parse(xhr1.responseText);//將回應的JSON字串轉為javaScript物件
            				
            				//將商品類別列表 放進checkbox( <input type="checkbox" ...> )		
            				var context = "<label>商品分類</label><br>";
            				for (var i = 0; i < allProductTypes.length; i++){
            			      var floag = "false";
            			      for (var j = 0; j < getProductTypeListByProductID.length; j++){
            				      if(allProductTypes[i].productTypeID==getProductTypeListByProductID[j].productTypeID){
            				    	  floag = "true"            			      
            				      }
            			      }
            			      if(floag=="true"){
            			    	   context += "<input checked id='"
            			       }else{
            			    	   context += "<input id='"                     			        	   
            			       }
            			      context += allProductTypes[i].productTypeID
            			               + "' type='checkbox' name='productTypeIDList' value='"
              			               + allProductTypes[i].productTypeID
              			               + "'>"
            				           + "<label for='"
              			               + allProductTypes[i].productTypeID
              			               + "'>"
              			               + allProductTypes[i].productTypeName
              			               + "</label>"
            				  }           			     
            				}
            				context +="<div><br></div>";
                     		selectElement.innerHTML = context;           				  
            		 }
            	 }           		            		
               }
         </script>
        <!-- 商品銷售註冊欄 End Here -->        
 <!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />

</body>

</html>
