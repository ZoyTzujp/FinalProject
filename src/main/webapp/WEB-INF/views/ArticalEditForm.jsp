<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>蔬果論壇</title>
</head>
<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />



<br><br><br>
<br>


<div class="login-register-area mt-no-text mb-no-text"> 
	<div class="container  custom-area">
		<fieldset>
<div class="myaccount-content" >
	<div class="account-details-form" >
			
			<form action="<c:url value='/artical/'/>${artical.articalID }">
			
			<div class="row" align="left">
				<div class="col-lg-6 col-custom">
					<fieldset>
					<h1 align="left">文章標題</h1><br>
						<input name="subject" id='subject' value="${artical.subject }">
					</fieldset>
				</div>
				</div>
			
			<div class="row" align="center">
				<div class="col-lg-6 col-custom">
					<fieldset>
						<h1 align="left">文章內容</h1><br>
						<textarea name="content" rows="10" cols="120" >${artical.content }
	<%-- 					<input  id='content' value="${artical.content }"> --%>
						</textarea>
					</fieldset>
			</div></div>
			
			<input type="hidden" name="articalID" id='articalID'  value="${artical.articalID }">
			<input type="hidden" name="picture" id='picture' value="${artical.picture }">
			<input type="hidden" name="commentTime" id='commentTime' value="${artical.commentTime }">
			
			<button formaction="<c:url value='/artical/edit/'/>${artical.articalID }" 
					class="btn obrien-button primary-btn">確認修改</button>
			<button formaction="<c:url value='/artical/delete/'/>${artical.articalID }" 
					class="btn obrien-button primary-btn">刪除文章</button>
			</form>
			
			
			</div>
			</div>
				</fieldset>
				
				</div>
				</div>


</body>
</html>