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
<button onclick="location.href='<c:url value="/artical/" />${artical.articalID }'" formaction="<c:url value='/artical/edit/'/>${artical.articalID }">確認修改</button>
<button  formaction="<c:url value='/artical/delete/'/>${artical.articalID }">刪除文章</button>
</form>
</div>
<hr>
<a href="<c:url value='/allartical' />">所有文章</a>


...

<div class="tab-pane fade" id="addArtical" role="tabpanel">
										<div class="myaccount-content">
											<!--       <h3>新增文章</h3> -->
											<div class="account-details-form">
												<div class="myaccount-content">
													<!--  <h3>新增文章</h3> -->
													<div class="account-details-form">
														<form:form modelAttribute="artical" action="save"
															method="POST">
<!-- 															<table> -->
																<div class="row">
																	<div class="col-lg-6 col-custom">
																		<fieldset>
																			<div class="single-input-item mb-3">
																				<h1> 文章標題 </h1>
																				<label for="display-name" class="required mb-1">
																				</label>
																				<form:input path="subject" placeholder="請輸入標題內容"
																					id="display-name" type="text"></form:input>
																			</div>
																		</fieldset>
																	</div>
																</div>

																<div class="single-input-item mb-4">
																	<h1>文章內容:</h1>
																	<textarea rows="15" cols="10" name="content"></textarea>
<%-- 																	<form:input path="content" placeholder="請輸入文章內容" --%>
<%-- 																		id="display-name" type="text"></form:input> --%>
																</div>
																<div align="center">
																<form:button value="Send" id="addArtical"
																	class="btn obrien-button primary-btn"
																	>Submit</form:button>
																</div>

<!-- 															</table> -->
														</form:form>

													</div>
												</div>
											</div>
										</div>
									</div>

</body>
</html>