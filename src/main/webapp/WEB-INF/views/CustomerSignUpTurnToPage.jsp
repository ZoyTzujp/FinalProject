<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Customer SignUp</title>
    <meta path="robots" content="noindex, follow" />
    <meta path="description" content="">
    <meta path="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    
  
</head>

<style>

#idDivRadioBt {
	margin-bottom: 25px;
	font-size:18px;
	padding-left: 15px;
}

#birthday {
	margin-bottom: -2px;
}

#label_birthday {
	margin-top: 30px;

}
	
#label_cellphone {
	margin-top: 35px;
}

.labels {
	font-size: 18px;
}

#submitBt {
   	background-color: grey;
   	left: 310px;
   	font-size: 17px;
   }
 
 #submitBt:hover {
 	background-color: #E98C81;
 }


</style>

<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />


		<c:if test="${successMessage.message != null}">
			<div class="alert alert-info"><div style="text-align: center;">${successMessage.message}</div></div>		
		</c:if>
		
		<c:if test="${errorMessage2.message != null}">
			<div class="alert alert-info"><div style="text-align: center;">${errorMessage2.message}</div></div>		
		</c:if>


 

</body>

</html>