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


 <div class="login-register-area mt-no-text mb-no-text">
            <div class="container container-default-2 custom-area">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-custom">
                        <div class="login-register-wrapper" style="background-color:#A6C6F8">
                            <div class="section-content text-center mb-5">
                                <h2 class="title-4 mb-2">會員註冊</h2>
                                <p class="desc-content">請輸入會員資料</p>
                            </div>
                            <form:form method="POST" action="signUpPage/send" modelAttribute="signUpRequest">                    
                                <div class="single-input-item mb-3">
                                    <form:label class="labels" path="name">姓名：</form:label><form:input type="text" path="name" id="name" required="required" autocomplete="on" autofocus="autofocus" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <form:label class="labels" path="email">Email：</form:label><form:input type="email" path="email" id="email" required="required" autocomplete="on"/>
                                </div>
                                <div class="single-input-item mb-3">
                                    <form:label class="labels" path="password">密碼：</form:label><form:input type="password" id="password" path="password" required="required" autocomplete="off"/>
                                </div>
                                <div id="idDivRadioBt">
                                <p>
						          <form:radiobutton id="genderM" path="gender" value="Male" label="男性"/>&nbsp;&nbsp;
						          <form:radiobutton id="genderF" path="gender" value="Female" label="女性"/>&nbsp;&nbsp; 
						          <form:radiobutton id="genderOther" path="gender" value="Other" label="其他"/>&nbsp;&nbsp;
						          <form:radiobutton id="genderNoSay" path="gender" value="Prefer not to say" label="不願透露"/>
						        </p>
						        </div>
                                <div id="label_birthday" class="single-input-item mb-3">
                                    <form:label class="labels" path="birthday">生日：</form:label><form:input  type="date" id="birthday" path="birthday" required="required" autocomplete="on" /><small style="color:grey">西元年/月/日 (yyyy/mm/dd)</small>
                                </div>
                                <div id="label_cellphone" class="single-input-item mb-3">
                                    <form:label class="labels" path="cellphone">手機號碼：</form:label><form:input type="text" id="cellphone" path="cellphone" required="required" autocomplete="on"/>
                                </div>
                                <div class="single-input-item mb-3">
                                    <form:label class="labels" path="address">地址：</form:label><form:input type="text" id="address" path="address" required="required" autocomplete="on" />
                                </div>
                                <div class="single-input-item mb-3">
                                    <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                        <div class="remember-meta mb-3">
                                        </div>
                                    </div>
                                </div>
                                <div class="single-input-item mb-3">
                                    <input id="submitBt" class="btn obrien-button-2 primary-color" type="submit" value="會員註冊"/>
                                </div>
                            </form:form>
                            <div><a style="position:absolute; left:850px; bottom:470px;" href='${pageContext.request.contextPath}/TODO' >成為商家？</a></div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

</body>

</html>