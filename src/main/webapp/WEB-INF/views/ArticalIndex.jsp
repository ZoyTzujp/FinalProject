<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>蔬果論壇</title>
</head>

<style>
.myaccount-content h1 {
	border-bottom: 1px dashed #e1e1e1;
	padding-bottom: 10px;
	margin-bottom: 25px;
	font-weight: 500;
}
</style>

<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="PageTop(login).jsp" />





	<!-- Breadcrumb Area Start Here -->
	<div class="breadcrumbs-area position-relative">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<div class="breadcrumb-content position-relative section-content">
						<h3 class="title-3">蔬果論壇</h3>
						<ul>
							<li><a href='<c:url value='/'/>'>Home</a></li>
							<li><a href='<c:url value='/allartical'/>'> 所有文章</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Area End Here -->
	<!-- my account wrapper start -->
	<div class="my-account-wrapper mt-no-text mb-no-text">
		<div class="container container-default-2 custom-area">
			<div class="row">
				<div class="col-lg-12 col-custom">
					<!-- My Account Page Start -->
					<div class="myaccount-page-wrapper">
						<!-- My Account Tab Menu Start -->
						<div class="row">
							<div class="col-lg-3 col-md-4 col-custom">
								<div class="myaccount-tab-menu nav" role="tablist">

									<!-- 									<a class="active" > <i -->
									<!-- 										class="fa fa-dashboard"></i> 文章功能</a> -->

									<a href="#allArtical" data-toggle="tab" class=""><i
										class="fa fa-book fa-fw"></i> 全部文章 </a> <a href="#addArtical"
										data-toggle="tab"><i class="fa fa-pencil fa-fw"></i> 新增文章
									</a>

								</div>
							</div>

							<!-- My Account Tab Menu End -->

							<!-- My Account Tab Content Start -->
							<div class="col-lg-9 col-md-8 col-custom">


								<div class="tab-content" id="myaccountContent">
									<!-- Single Tab Content Start -->
									<!-- 		全部文章 -->
									<!-- 		全部文章 -->
									<!-- 		全部文章 -->
									<div class="tab-pane fade show active" id="allArtical"
										role="tabpanel">
										<c:forEach var='artical' items='${allArtical }'>
											<div class="myaccount-content">
												<div class="col-lg-9 col-md-8 col-custom">

													<div class="welcome">
														<h1>
															<a
																href='<c:url value="/artical/" />${artical.articalID }'>
																<strong>${artical.articalID },${artical.subject }</strong>
															</a> <br>
														</h1>
													</div>
													<p class="mb-0">${artical.content }</p>
												</div>
											</div>
											<br>
										</c:forEach>
									</div>
									<!-- 全部文章END -->
									<!-- 全部文章END -->
									<!-- 全部文章END -->
									<!-- Single Tab Content End -->

									<!-- 新增文章 -->
									<!-- 新增文章 -->
									<!-- 新增文章 -->


									<!-- Single Tab Conten> Single Tab Content End -->

									<!--                                                                 --- -->
									<!--                                                                 --- -->
									<!--                                                                 --- -->
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

									<!--                                                                 --- -->
									<!--                                                                 --- -->
									<!--                                                                 --- -->
									<!--                                                                 --- -->
									<!-- 新增文章END -->
									<!-- 新增文章END -->
									<!-- 新增文章END -->






									<!-- Single Tetent End -->
								</div>
							</div>
							<!-- My Account Tab Content End -->
						</div>
					</div>
					<!-- My Account Page End -->
				</div>
			</div>
		</div>
	</div>
	<!-- my account wrapper end -->




</body>
</html>