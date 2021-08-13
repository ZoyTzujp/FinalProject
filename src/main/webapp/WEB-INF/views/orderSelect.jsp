<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderQuery</title>
</head>
<body>
	<h3>OrderQuery</h3>
		<form:form method="POST" action="orderQueryController" modelAttribute="orders">
			<table>
				<tr>
					<td><form:label path="orderID">OrderID</form:label></td>
					<td><form:input path="orderID" /></td>
				</tr>
				<tr>
				    <td><form:button value="send">Submit</form:button></td>
				</tr>
			</table>
		</form:form>
			
</body>
</html>