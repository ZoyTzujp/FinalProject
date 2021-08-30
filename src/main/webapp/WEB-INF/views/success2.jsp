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
<h3>Success!!!->${Customer.name},你好,購物車->${Cart.content}</h3>
<a href="<c:url value='/getAllProductInfo' />">商品</a>
</body>
</html>