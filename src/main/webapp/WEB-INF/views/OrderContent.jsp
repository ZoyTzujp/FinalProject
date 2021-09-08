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
window.onload=function(){
// 	var orderListId = allOrderProduct.
	console.log("orderListId: "+${orderListId});
// 	submitOrder = document.getElementById("submitOrder")
// 	submitOrder.onclick = function(){// 確認支付
		
// 		var submit = confirm('前往支付');

// 		if (submit) {
// 			console.log("前往支付");
// 			window.location.href="<c:url value='/OrderPayment/'/>${orderListId}";
// // 			var orderListId = ${orderListId};
			
// // 			//測試
// // 			let xhr = new XMLHttpRequest();
// // 			xhr.open("POST", "<c:url value='/pay' />" ,true);
// // 			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
// // 			xhr.setRequestHeader("Access-Control-Allow-Origin", "https://www.sandbox.paypal.com/");
			
// // 			xhr.send("orderListId="+orderListId);//
			
// // 			xhr.onreadystatechange = function(){
// //         		if(xhr.readyState == 4 && xhr.status == 200){
// //         			console.log("12345");
// //         		}
// //         	}	
// 		} else {
// 			console.log("取消前往支付");
// 		}

// 	}		
	
	cancelOrder = document.getElementById("cancelOrder")
	cancelOrder.onclick = function(){
		var cancelcheck = confirm("確認取消訂單");
		if (cancelcheck){
			console.log("刪除訂單");
			window.location.href="<c:url value='/cancelOrder/'/>${orderListId}";
			
		} else {
			console.log("取消刪除訂單");
		}
		
	}
			
			
			
// 			cancelOrder
			//讀取地址、信箱、電話、註記
			
			// 如何傳allOrderProduct?
					
					
//	 		var orderAddress = $("#orderAddress").val();
//	 		var orderEmail = $("#orderEmail").val();
//	 		var orderPhone = $("#orderPhone").val();
//	 		var orderDescription = $("#orderDescription").val();
//	 		//讀取使用者
//	 		var customerID = ${Customer.id};
//	 		//測試
//	 		window.alert("orderAddress: "+orderAddress+"\n"
//	 				+"orderEmail: "+orderEmail+"\n"
//	 				+"orderPhone: "+orderPhone+"\n"
//	 				+"customerID: "+customerID);
			
			//送出資料至controller
// 			var xhr = new XMLHttpRequest(); //Ajax引擎物件
// 			console.log("1");
// 			xhr.open("GET", "<c:url value='/OrderPayment' />", true); //說明請求內容
// 			console.log("2");
//	 		var productID = $(this).siblings("#display-none").text(); //產品ID
//	 		var updatedSaleQty = $(this).val(); //更新後之數量
//	 		console.log('產品ID:'+productID);
//	 		console.log('更新後數量:'+updatedSaleQty);
// 	 		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); //請求標頭
// 			xhr.send();
				
//	 			xhr.onreadystatechange = function(){
//	 			if(xhr.readyState == 4 && xhr.status == 200){
	// // 				console.log("測試");
//	 				window.alert("提交成功，聯絡資訊為-"+"\n"
//	 						+"orderAddress: "+orderAddress+"\n"
//	 						+"orderEmail: "+orderEmail+"\n"
//	 						+"orderPhone: "+orderPhone+"\n"
//	 						+"orderDescription: "+orderDescription+"\n"
//	 						+"customerID: "+customerID+"\n"+"\n"
//	 						+"即將跳轉頁面至訂單列表");
//	 				window.location.href="<c:url value='/getCustomersAllOrder' />";
//	 			}
//	 		}
		
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
										<%-- <td>${orderProduct.id}</td> --%>
										<td>${orderProduct.orderID}</td>
										<td>${orderProduct.productName}</td>
										<td>${orderProduct.newSaleQty}</td>
										<td>${orderProduct.price}</td>
										<td>${orderProduct.newSaleQty * orderProduct.price}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-lg-5 ml-auto">
							<!-- Cart Calculation Area -->
							<div class="cart-calculator-wrapper">
								<div class="cart-calculate-items">
									<div class="table-responsive">
										<table class="table">
											<tr>
												<td>運費</td>
												<td>70</td>
											</tr>
											<tr>
												<td>總計</td>
												<td>${price}</td>
											</tr>
											<tr class="total">
												<td>訂單狀態</td>
												<td class="total-amount">${orderStatus}</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- 有空再看看怎麼弄到右邊，改顏色 -->
						<c:if test="${orderStatus == '未付款'}">
							<div style="width: 300px; margin: 0 0 0 auto;">
							<!-- 方案2 -->
								<form method="POST" action="<c:url value='/pay' />">
									<label style="display: none" for="price">總額</label>
									<input style="display: none" type="text" id="price" name="price" value="${orderList.price}">
									<label style="display: none" for="currency">幣種</label>
									<input style="display: none" type="text" id="currency" name="currency" placeholder="Enter Currency" value="TWD">
									<label style="display: none" for="method">支付方式</label>
									<input style="display: none" type="text" id="method" name="method" placeholder="Payment Method" value="paypal">
									<label style="display: none" for="intent">Intent</label>
									<input style="display: none" type="text" id="intent" name="intent" value="sale">
									<label style="display: none" for="description">付款描述</label><!-- 原字段:Payment Description -->
									<input style="display: none" type="text" id="description" name="description" placeholder="Payment Description" value="${orderList.description}">
									<label style="display: none" for="orderListId">付款描述</label>
									<input style="display: none" type="text" id="orderListId" name="orderListId" value="${orderListId}">
									<div class="order-button-payment">
									<input type="submit" value="付款" class="btn">
									</div>
								</form>
								<div class="order-button-payment">
										<!-- 方案1 -->
<!-- 									<input value="付款" type="button" id="submitOrder"> -->
									<input value="取消" type="button" id="cancelOrder">
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>

</html>
