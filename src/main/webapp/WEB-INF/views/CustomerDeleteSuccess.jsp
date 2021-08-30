<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Customer Login</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
</head>

<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />
 
    <c:if test="${successMessage.message != null}">
			<div class="alert alert-info"><div style="text-align: center;">${successMessage.message}</div></div>		
	</c:if>

</body>

</html>