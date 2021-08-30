<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>	    --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArticalSubject</title>
</head>

<script>
var addArtical = document.getElementById('addArtical');
var showArtical = document.getElementById('showArtical');
var xhr0 = new XMLHttpRequest();
xhr0.open("GET","<c:url value='/all' />",true);
xhr0.send();
addArtical.click = function{
	if(xhr0.readyState == 4 && xhr0.status == 200){
		for (var i = 0; i < .length; i++)
			showArtical.innerHTML = 
	}
}

</script>


<body>
<div align="center" id='showArtical'>
<h1 >ArticalSubject</h1>
<h4>ArticalContent<br>ArticalContent<br>ArticalContent<br>ArticalContent<br>ArticalContent<br></h4>
</div>
<hr>
<div align="center">
	<form:form modelAttribute="artical" action="save" method="POST">
	<table>
	<tr>
	<td>文章標題:<form:input path="subject"  ></form:input></td>
	<tr>
	<td>文章內容:<form:input path="content"  ></form:input></td>
<%-- <tr><td><form:input path="picture" action="create" method="GET" ></form:input></td> --%>
		<tr><td><form:button value="Send" id="addArtical">Submit</form:button></td>
	</tr>
	</table>
	</form:form>
</div>
<hr>
<div align="center">
<a  href="<c:url value='/allartical' />">所有文章</a>
</div>
</body>
</html>