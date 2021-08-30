<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />

<div align="center">
<h1>${artical.subject }</h1>
<form action="<c:url value='/artical/edit/'/>${artical.articalID }">
<table border="1">
<tr><th>ArticalID</th><th>Subject</th><th>Content</th><th>picture</th><th>commentTime</th>
<tr>
		<td><input name="articalID" id='articalID' disabled value="${artical.articalID }"></td>
		<td><input name="subject" id='subject' value="${artical.subject }"></td>
		<td><input name="content" id='content' value="${artical.content }"></td>
		<td><input name="picture" id='picture' value="${artical.picture }"></td>
		<td><input name="commentTime" id='commentTime' value="${artical.commentTime }"></td>
</tr>
</table>
<button  formaction="<c:url value='/artical/edit/'/>${artical.articalID }">submit${artical.articalID }</button>
<button  formaction="<c:url value='/artical/delete/'/>${artical.articalID }">delete${artical.articalID }</button>
</form>
</div>
<hr>
<a href="<c:url value='/allartical' />">所有文章</a>

</body>
</html>