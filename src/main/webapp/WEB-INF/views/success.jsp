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
<h3>Success,你好${LoginOK.shopKeeper}</h3>
<a href="<c:url value='/showProductCooperateForm' />">商品銷售合作</a>
</body>
</html>