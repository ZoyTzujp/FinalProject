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
<%-- <h3>你好${LoginOK.shopKeeper},商品新增成功!!</h3> --%>
<%-- <a href="<c:url value='/showProductCooperateForm' />">繼續新增商品</a><br> --%>
<%-- <a href="<c:url value='/getAllProductInfo' />">回賣場</a> --%>

        <div class="login-register-area mt-no-text mb-no-text">
            <div class="container custom-area">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-custom">
                        <div class="login-register-wrapper">
                            <div class="section-content text-center mb-5">
                                <h2 class="title-4 mb-2">你好${LoginOK.shopKeeper},商品新增成功!!</h2>
                                <p class="desc-content"></p>
                             </div>
                             <a class="btn obrien-button-2 treansparent-color pt-0 pb-0" href="<c:url value='/showProductCooperateForm' />">繼續新增商品</a>
                             <a class="btn obrien-button-2 treansparent-color pt-0 pb-0" href="<c:url value='/showProductEditFormByShopID/${LoginOK.shopID}' />">回賣場</a>
                             </div></div></div></div></div>
</body>
</html>