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
            <div class="container custom-area">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-custom">
                        <div class="login-register-wrapper">
                            <div class="section-content text-center mb-5">
                                <h2 class="title-4 mb-2">商品銷售合作</h2>
                                <p class="desc-content">請輸入銷售資訊</p>
                             </div>
                            <form method="POST" action="addNewProduct" role="form" enctype="multipart/form-data" class="needs-validation" novalidate>                    
                                <div class="col-md-4 single-input-item mb-3" style="display:none">
                                    <label>ShopID</label><input type="text" name="shopID" id="shopID" />
                                </div>                                
                                <div class="col-md-4 single-input-item mb-3">
                                    <label>上架時間</label><input  type="text" name="saleDate" id="saleDate" readonly/>
                                </div>                                
                                <div class="col-md-4 single-input-item mb-3">
                                    <label>商品名稱</label><input class="form-control" type="text" name="productName" required/>
	                                   <div class="invalid-feedback">
										 名稱不可空白
									   </div>
                                </div>                                                               
                                <!--Ajax 帶出商品分類-->
                                <div class="checkout-form-list create-acc" id="productTypeIDList">
                                </div>                                
                                <input class="newType" type="text" name="" />
                                <a class="btn obrien-button-2 treansparent-color pt-0 pb-0 addNewType" >新增商品分類</a>

                                <div class="single-input-item mb-3">
                                    <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                        <div class="remember-meta mb-3">
                                        </div>
                                    </div>
                                </div>
                                                                                               
                                <div class="col-md-4 single-input-item mb-3">
                                    <label>可供數量</label><input class="form-control" type="text" name="quantity" required/>
	                                  <div class="invalid-feedback">
										 數量不可空白
									  </div>
                                </div>
                                <div class="col-md-4 single-input-item mb-3">
                                    <label>價格</label><input class="form-control" type="text" name="price" required/>
	                                  <div class="invalid-feedback">
										 價格不可空白
									  </div>
                                </div>
                                <div class="col-md-4 single-input-item mb-3">
                                    <label>規格</label><input  type="text" name="standard" />
                                </div>
                                <div class="col-md-4 single-input-item mb-3">
                                    <label>重量/容量</label><input  type="text" name="capacity" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>產地</label><input  type="text" name="place" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>保存方式</label><input  type="text" name="preserve" />
                                </div>
                                <div class="col-md-4 single-input-item mb-3">
                                    <label>商品特色</label><textarea class="form-control" name="productDescribe" required></textarea>
                                      <div class="invalid-feedback">
									  </div>
                                </div>
                                <div class="single-input-item mb-3">
                                    <label>商品圖片</label><input class="form-control" type="file" name="producImage" required/>
                                      <div class="invalid-feedback">
                                         圖片不可空白
									  </div>
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
        window.onload= function() {
        	(function () {
      		  'use strict'
	
      		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
      		  var forms = document.querySelectorAll('.needs-validation')

      		  // Loop over them and prevent submission
      		  Array.prototype.slice.call(forms)
      		    .forEach(function (form) {
      		      form.addEventListener('submit', function (event) {
      		    	  confirm('是否完成申請?')
      		        if (!form.checkValidity()) {
      		          event.preventDefault()
      		          event.stopPropagation()
      		        }

      		        form.classList.add('was-validated')
      		      }, false)
      		    })
      		})()
        	
           var ShopID =  document.getElementById("shopID");
           shopID.value = ${LoginOK.shopID};
        
            var NowDate =new Date();　
            var saleDate = document.getElementById("saleDate");
            saleDate.value = NowDate.getFullYear()+"/"+(NowDate.getMonth()+1)+"/"+NowDate.getDate()+" "+NowDate.getHours()+":"+NowDate.getMinutes();
//           +":"+NowDate.getSeconds();

//         顯示商品分類                      
            var xhr = new XMLHttpRequest();
            var productTypeList = [];
            xhr.open("GET","<c:url value='/getAllProductTypeList.json' />",true);
            xhr.send();
            xhr.onreadystatechange = function(){
            	if(xhr.readyState == 4 && xhr.status == 200){
            		var productTypes = JSON.parse(xhr.responseText);//將回應的JSON字串轉為javaScript物件            		
            		showProductTypeList(productTypes);
                }
             }
        }
        
//          新增商品分類
            $(".addNewType").click(function(){
	        	var newType = $(this).siblings(".newType").val();
	        	console.log(newType);
	        	
	        	var xhr = new XMLHttpRequest();
	        	xhr.open("POST","<c:url value='/addNewProductType.json' />",true);
	        	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        	xhr.send("productTypeName="+newType);
	        	xhr.onreadystatechange = function(){
	        		if(xhr.readyState == 4 && xhr.status == 200){
	        		    var productTypes = JSON.parse(xhr.responseText);//將回應的JSON字串轉為javaScript物件
	        		    showProductTypeList(productTypes);
	        		    $(".newType").val("");
	        		}
	        	}	
              })       
        
//              將商品類別列表 放進checkbox( <input type="checkbox" ...> )
		        function showProductTypeList(productTypes){
                    var selectElement = document.getElementById('productTypeIDList');
			        var context = "<label>商品分類</label><br>";
			        for (var i = 0; i < productTypes.length; i++) {
						context += "<input class='form-control' id='" + productTypes[i].productTypeID
						        + "' type='checkbox' name='productTypeIDList' value='"
						        + productTypes[i].productTypeID
						        + "'>"
						        + "<label for='"
						        + productTypes[i].productTypeID
						        + "'>"
						        + productTypes[i].productTypeName
						        + "</label>&nbsp;&nbsp;"          			       
					}
			        context +="<div><br></div>";
					selectElement.innerHTML = context; 
		         }
        
         </script>
       <!-- 商品銷售註冊欄 End Here -->
             
 <!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />

</body>

</html>
