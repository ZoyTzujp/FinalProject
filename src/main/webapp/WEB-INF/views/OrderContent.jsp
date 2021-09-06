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
window.onload=function(){
// 	var orderListId = allOrderProduct.
	console.log("orderListId: "+${orderListId});
	submitOrder = document.getElementById("submitOrder")
	submitOrder.onclick = function(){// 確認支付
		
		var submit = confirm('前往支付');

		if (submit) {
			console.log("前往支付");
			window.location.href="<c:url value='/OrderPayment/'/>${orderListId}";
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
		} else {
			console.log("取消前往支付");
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
<!--                                 <tr> -->
<!--                                 	<td>運費:60</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<%--                                 	<td>總額:${price}</td> --%>
<!--                                 </tr> -->
                                </tbody>
                            </table>
                            <div style="width:300px;margin:0 0 0 auto;">
                            	運費:70
                            </div>
                            <div style="width:300px;margin:0 0 0 auto;">
                            	總額:${price}
                            </div>
                            <div style="width:300px;margin:0 0 0 auto;">
                            	訂單狀態:${orderStatus}
                            </div>
                            <!-- 有空再看看怎麼弄到右邊，改顏色 -->
                            <c:if test="${orderStatus == '未付款'}">
                            <div style="width:300px;margin:0 0 0 auto;">
                            	<div class="order-button-payment" >
                                	<input value="付款" type="button" id="submitOrder">
                                	<input value="取消" type="button" id="cancelOrder">
                           		 </div>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />


</body>

</html>
