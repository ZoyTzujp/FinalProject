<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

let xhr = new XMLHttpRequest();
xhr.open("GET","<c:url value='/comment/findby'/>");
xhr.send();

</script>
</head>

<body>
<div id='comment' align='center'>
</div>
</body>
</html>