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
<script>
<!-- 請求-->
</script>


<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />
    
        <!-- Breadcrumb Area Start Here -->
        <div class="breadcrumbs-area position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <div class="breadcrumb-content position-relative section-content">
                            <h3 class="title-3">OrderContent</h3>
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>OrderContent</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Area End Here -->
        <!-- Wishlist main wrapper start -->
        <div class="wishlist-main-wrapper mt-no-text mb-no-text">
            <div class="container container-default-2 custom-area">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Wishlist Table Area -->
                        <div class="wishlist-table table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
<!--                                     	<th>ID</th> -->
                                    	<th>訂單編號</th>
                                    	<th>產品名</th>
                                    	<th>數量</th>
                                    	<th>單價</th>
                                    	<th>小計</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="orderProduct" items="${allOrderProduct}">
                                    <tr>
<%--                                     	<td>${orderProduct.id}</td> --%>
                                    	<td>${orderProduct.orderID}</td>
                                    	<td>${orderProduct.productName}</td>
                                    	<td>${orderProduct.newSaleQty}</td>
                                    	<td>${orderProduct.price}</td>
                                    	<td>${orderProduct.newSaleQty * orderProduct.price}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />


</body>

</html>
