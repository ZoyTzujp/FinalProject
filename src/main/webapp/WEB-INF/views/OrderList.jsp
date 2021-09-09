<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Obrien</title>
<meta name="robots" content="noindex, follow" />
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->


</head>

<body>
	<script>
<!-- 關鍵字搜尋 -->
const searchFun = () =>{
	let filter = document.getElementById('myInput').value.toUpperCase();
	
	let myTable = document.getElementById('myTable');
	let tr = myTable.getElementsByTagName('tr');
	
	for(var i=0; i< tr.length; i++){
		let td = tr[i].getElementsByTagName('td')[6];
		
		if(td){
			let textvalue = td.textContent || td.innerHTML;
			if(textvalue.toUpperCase().indexOf(filter) > -1){  
				tr[i].style.display = "";
			}else{
				tr[i].style.display= "none";
			}
		}
}
} 

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
						<div class="shop-main-area">
							<div class="container container-default custom-area">
								<div class="col-lg-3 col-12 col-custom">
									<!-- 商品銷售欄 右方分類欄 Start -->
									<aside class="sidebar_widget widget-mt">
										<div class="widget_inner">
<!-- 											<h3 class="widget-title">Search</h3> -->
											<div class="search-box">
												<div class="input-group">
													<input type="text" class="form-control" name="" id="myInput" placeholder="搜尋" onkeyup="searchFun()">
													<div class="input-group-append">
														<button class="btn btn-outline-secondary" type="button">
															<i class="fa fa-search"></i>
														</button>
													</div>
												</div>
											</div>

										</div>
									</aside>
									<!-- 商品銷售欄 右方分類欄 End -->
								</div>
							</div>
						</div>
						<br>
						<table class="table table-bordered" id="myTable">
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
								<c:forEach var="orderList" items="${allOrderList}">
									<tr>
										<td><a href="<c:url value='/OrderContent/${orderList.orderID}' />">明細</a></td>
										<!-- 跳轉至訂單明細 -->
										<td>${orderList.orderID}</td>
										<td>${orderList.orderDate}</td>
										<td>${orderList.orderStatus}</td>
										<td>${orderList.orderAddress}</td>
										<td>${orderList.price}</td>
										<td>${orderList.description}</td>
										<!-- 加備註 -->
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
