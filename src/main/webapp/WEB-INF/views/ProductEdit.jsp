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
                                    <option selected value="0">所有分類</option>
                                    <c:forEach var="productTypeList" items="${productTypeList}">
                                        <option value="${productTypeList.productTypeID}">${productTypeList.productTypeName}</option>
                                    </c:forEach> 
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
             selectElement.onchange = function(){
            	 var productTypeID = selectElement.options[ selectElement.selectedIndex ].value;
            	 if(productTypeID==0){
            		 location.href ="<c:url value='/getAllProductInfo' />"
            	 }else{
            	     location.href ="<c:url value='/productListSortByTypeID/' />"+productTypeID;
            	 }
              }
	/*              var selectElement = document.getElementById('productTypeIDList');  
                    
                    var xhr0 = new XMLHttpRequest();               
                    var productTypeList = [];
                    xhr0.open("GET","<c:url value='/getAllProductTypeList' />",true);
                    xhr0.send();
                    xhr0.onreadystatechange = function(){
            	        if(xhr0.readyState == 4 && xhr0.status == 200){
            	        	var productTypes = JSON.parse(xhr0.responseText);//將回應的JSON字串轉為javaScript物件
            	        	var productType0 = ["所有分類",0];
            	        	productTypeList.push(productType0);
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
            			}             */
                </script> 
                <!--商品銷售欄 上方分類欄 end-->
                <!-- 商品銷售欄 商品欄 Start -->
                <div class="row shop_wrapper grid_3" id="single-product">  
                <c:forEach var="productList" items="${productList}">
                    <div class="col-md-6 col-sm-6 col-lg-4 col-custom product-area" >
                        <div class="single-product position-relative">
                            <div class="product-image" id="img">
                                <a class="d-block" href="product-details.html">                        
                                    <img src="<c:url value='/getProductImage' />?id=${productList.productID}" alt="" class="product-image-1 w-100">
                                </a>
                            </div>
                            <div class="product-content" id="product_name_price">
                                <div class="product-title">
                                    <h4 class="title-2"> <a href="product-details.html">${productList.productName}</a></h4>                                                                      
                                </div>                          
                                <div class="product-title">                                   
                                    <h4 class="title-2"><span class="regular-price " >$${productList.price}</span></h4> 
                                      <div style="text-align:right">
                                        <h6 class="title-2">                                  
                                            <a href="<c:url value='/singleProductEditForm/${productList.productID}' />" title="edit" ><i class="fa fa-edit mr-2"></i></a>
                                            <a href="#" title="remove"><i class="ion-trash-b"></i></a>
                                        </h6>
                                      </div>                                   
                                </div>
                            </div>
                        </div>
                     </div> 
                   </c:forEach>                                     
                </div>           
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
                        <!-- 商品銷售欄 左方分類欄 商品分類 Start -->
   <!--                     <div class="widget-list widget-mb-1">
                            <h3 class="widget-title">商品分類</h3>                                                     
                            <nav>
                                <ul class="mobile-menu p-0 m-0">
                                    <li class="menu-item-has-children"><a href="#">商品分類</a>
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
                        </div>                -->
                        <!-- 商品銷售欄 左方分類欄 商品分類 End -->
                        <div class="widget-list widget-mb-1">
                            <h3 class="widget-title">商品分類</h3>
                            <div class="sidebar-body">
                                <ul class="sidebar-list">
                                    <c:forEach var="productTypeList" items="${productTypeList}">
                                        <li><a href="<c:url value='/getProductListByTypeID/${productTypeList.productTypeID}' />">${productTypeList.productTypeName}</a></li>
                                    </c:forEach>
<!--                                     <li><a href="#">All Product</a></li> -->
<!--                                     <li><a href="#">Best Seller (5)</a></li> -->
<!--                                     <li><a href="#">Featured (4)</a></li> -->
<!--                                     <li><a href="#">New Products (6)</a></li> -->
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
                <!-- 商品銷售欄 左方分類欄 End -->
            </div>
        </div>
    </div>
</div>
<!-- 商品銷售欄 End Here -->

<!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />
      
</body>

</html>
