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


</script>


<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />

        <!-- Breadcrumb Area Start Here -->
        <div class="breadcrumbs-area position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <div class="breadcrumb-content position-relative section-content">
                            <h3 class="title-3">OrderList</h3>
                            <ul>
                                <li><a href="<c:url value='/' />">Home</a></li>
                                <li>OrderList</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Area End Here -->
        <!-- Wishlist main wrapper start -->
        
<%--         <a href="<c:url value='/orderQueryController' />">test</a> --%>
        <div id="dataArea" class="wishlist-main-wrapper mt-no-text mb-no-text">
            <div class="container container-default-2 custom-area">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Wishlist Table Area -->
                        <div class="wishlist-table table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                    	<th>查看訂單</th>
                                    	<th>訂單ID</th>
                                    	<th>建立日期</th>
                                   	 	<th>訂單狀態</th>
                                 	   	<th>發送地址</th>
                                 	   	<th>金額</th>
                                 	   	<th>備註</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="orderList" items="${shopAllOrderList}">
                                    <tr>
                                    	<td><a href="<c:url value='/OrderContentForShop/${orderList.orderID}' />">明細</a></td><!-- 跳轉至訂單明細 -->
                                    	<td>${orderList.orderID}</td>
                                    	<td>${orderList.orderDate}</td>
                                    	<td>${orderList.orderStatus}</td>
                                    	<td>${orderList.orderAddress}</td>
                                    	<td>${orderList.price}</td>
                                    	<td>${orderList.description}</td><!-- 加備註 -->
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
