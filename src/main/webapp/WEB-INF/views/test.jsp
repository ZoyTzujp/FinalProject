<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<h3>Success</h3>
	<a href="<c:url value='/getAllProduct0' />">A</a><br>
	<c:forEach var="productList" items="${productList}">
                ${productList.productName}<br>
	</c:forEach>
	<a href="<c:url value='/showProductCooperateForm' />">商品銷售合作</a>
</body>
</html>