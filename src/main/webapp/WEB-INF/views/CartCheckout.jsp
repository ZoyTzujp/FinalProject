<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
	
	$(function() {
		
		var sum = 0;
		$(".itemTotal").each(function(){
			console.log($(this).text());
			var itemtotal = $(this).text();
			sum+=Number(itemtotal);
		});	
		$("#sum").text(sum);
		
		console.log(Number($("#sum").text()));
		console.log(Number($("#shippingFee").text()));
		$("#total").text(Number($("#sum").text())+Number($("#shippingFee").text()));
		
	});
	
	submitCart = document.getElementById("submitCart")
	submitCart.onclick = function(){// 確認聯絡資訊、建立訂單
		
	
		var submit = confirm('確認生成訂單');

		if (submit) {
			//讀取地址、信箱、電話、註記
			var orderAddress = $("#orderAddress").val();//.attr("text") .attr("value")
			var orderEmail = $("#orderEmail").val();
			var orderPhone = $("#orderPhone").val();
			var orderDescription = $("#orderDescription").val();
			//讀取使用者
			var customerID = ${Customer.id};
//	 		//測試
//	 		window.alert("orderAddress: "+orderAddress+"\n"
//	 				+"orderEmail: "+orderEmail+"\n"
//	 				+"orderPhone: "+orderPhone+"\n"
//	 				+"customerID: "+customerID);
			
			//送出資料至controller
			var xhr = new XMLHttpRequest(); //Ajax引擎物件
			xhr.open("POST", "<c:url value='/addOrderList' />", true); //說明請求內容
//	 		var productID = $(this).siblings("#display-none").text(); //產品ID
//	 		var updatedSaleQty = $(this).val(); //更新後之數量
//	 		console.log('產品ID:'+productID);
//	 		console.log('更新後數量:'+updatedSaleQty);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); //請求標頭
			xhr.send("orderAddress="+orderAddress+"&orderEmail="+orderEmail
					+"&orderPhone="+orderPhone+"&orderDescription="+orderDescription);
				
				xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
//	 				console.log("測試");
					window.alert("提交成功，聯絡資訊為-"+"\n"
							+"orderAddress: "+orderAddress+"\n"
							+"orderEmail: "+orderEmail+"\n"
							+"orderPhone: "+orderPhone+"\n"
							+"orderDescription: "+orderDescription+"\n"
							+"customerID: "+customerID+"\n"+"\n"
							+"即將跳轉頁面至訂單列表");
					window.location.href="<c:url value='/getCustomersAllOrder' />";
				}
			}
		} else {
			console.log("取消生成訂單");
		}

	}
}


	
	
	



</script>
<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />

        <!-- Checkout Area Start Here -->
        <div class="checkout-area">
            <div class="container container-default-2 custom-container">
            

                <div class="row">
                    <div class="col-lg-6 col-12">
                        <form action="#">
                            <div class="checkbox-form">
                                <h3>Billing Details</h3>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>姓名 <span class="required"></span></label>
                                            <input readonly value="${Customer.name}" placeholder="" type="text"><!-- 帶使用者名稱 -->
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>地址 <span class="required">*</span></label>
                                            <input value="${Customer.address}" placeholder="" type="text" id="orderAddress"><!-- 帶使用者地址 -->
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>電子信箱 <span class="required">*</span></label>
                                            <input value="${Customer.email}" placeholder="" type="email" id="orderEmail"><!-- 帶使用者信箱 -->
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>電話 <span class="required">*</span></label>
                                            <input value="${Customer.cellphone}" placeholder=""type="text" id="orderPhone"><!-- 帶使用者電話 -->
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>備註 <span></span></label>
                                            <input placeholder="填寫註記" type="text" id="orderDescription"><!-- 帶使用者地址 -->
                                        </div>
                                    </div>
                              	</div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="your-order">
                            <h3>Your order</h3>
                            <div class="your-order-table table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="cart-product-name">產品</th>
                                            <th class="cart-product-total">小計</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach varStatus="vs" var="anEntry" items="${Cart.content}">
                                    	<tr class="cart_item">
                                            	<td class="cart-product-name"> ${anEntry.value.productName}<strong class="product-quantity">
                                    	× ${anEntry.value.newSaleQty}</strong></td>
                                            	<td class="itemTotal cart-product-total text-center"><span class="amount">${anEntry.value.price * anEntry.value.newSaleQty}</span></td>
                                        </tr>
                                    </c:forEach>
                                    <tr class="cart_item">
                                            <td class="cart-product-name"> 總計<strong class="product-quantity"></strong></td>
<!--                                             <td class="cart-product-total text-center" id="sum"><span class="amount"></span></td> -->
                                        	<td class="cart-product-total text-center" id="sum"></td>
                                        </tr>
                                    <tr class="cart_item">
                                            <td class="cart-product-name"> 運費<strong class="product-quantity"></strong></td>
<!--                                             <td class="cart-product-total text-center" id="shippingFee"><span class="amount">70</span></td> -->
                                            <td class="cart-product-total text-center" id="shippingFee">70</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
<!--                                         <tr class="cart-subtotal"> -->
<!--                                             <th>Cart Subtotal</th> -->
<!--                                             <td class="text-center"><span class="amount">£215.00</span></td> -->
<!--                                         </tr> -->
                                        <tr class="order-total">
                                            <th>Total</th>
<!--                                             <td class="text-center" id="total"><strong><span class="amount"></span></strong></td> -->
												<td class="text-center" id="total"></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="order-button-payment">
                                <input value="確認" type="button" id="submitCart">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Checkout Area End Here -->
        
        
        <!-- Support Area Start Here -->
        <div class="support-area">
            <div class="container container-default custom-area">
                <div class="row">
                    <div class="col-lg-12 col-custom">
                        <div class="support-wrapper d-flex">
                            <div class="support-content">
                                <h1 class="title">Need Help ?</h1>
                                <p class="desc-content">Call our support 24/7 at 01234-567-890</p>
                            </div>
                            <div class="support-button d-flex align-items-center">
                                <a class="obrien-button primary-btn" href="contact-us.html">Contact now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Support Area End Here -->
        

<!-- 引入共同的頁尾 -->
<jsp:include page="PageFoot.jsp" />
</body>

</html>
