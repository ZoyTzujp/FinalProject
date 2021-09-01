<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />
<!-- 	<div class="breadcrumbs-area position-relative"> -->
<!--             <div class="container"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-12 text-center"> -->
<!--                         <div class="breadcrumb-content position-relative section-content"> -->
<!--                             <h2 class="title-3">店家註冊</h2> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
		<div class="error-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="error_form">
                            <h1>店家註冊</h1>
                            <h4>您已註冊成功!</h4><br>
                            <p>請確認信箱來啟用您的帳號!</p>
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
<!-- <h2>店家註冊</h2> -->
<!-- <h4>您已註冊成功</h4> -->
<!-- <p>請確認信箱來啟用您的帳號!</p> -->
<%-- <a href="<c:url value='/showProductCooperateForm' />">商品銷售合作</a> --%>
</body>
</html>