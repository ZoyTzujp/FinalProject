<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Edit Customer Profile</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/css/vendor/bootstrap.min.css' />">
    <style>
    
    #iddivForH2_1 {
    	margin-bottom: 25px;
    }
    
    #idDivForForm {
    	width: 850px;
    }
    
    .pForForm {
   		margin-bottom: 25px;
    }    
    
    #idPForFormRadioButton {
        margin-top: 35px;
        font-size: 18px;
    }
    
    .labelForForm {
    	font-size: 23px;
    }
    
    #submitBt {
    	background-color: grey;
    	left: 310px;
    }
    
    #submitBt:hover {
    	background-color: #6590D3;
    }
    
    </style>
  </head>
  
  
  <body>
  
  <!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />
    
    <!-- 上方資訊欄 Start Here -->
    <div class="breadcrumbs-area position-relative">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="breadcrumb-content position-relative section-content">
                        <h3 class="title-3"></h3>
                        <ul>
                            <!-- <li><a href=""></a></li> -->
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 上方資訊欄 End Here -->
  
   	<br>
      <br>
      
     <div id="idDivForForm" class="container">
      <form:form class="form-signin"  method="POST" action="edit/send" modelAttribute="customerToBind">
        <div id="iddivForH2_1"><h2 id="idh2_1" class="form-signin-heading">User Profile</h2></div>
        
		
		<c:if test="${successMessage.message != null}">
			<div class="alert alert-info">${successMessage.message}</div>		
		</c:if>
		
		<c:if test="${errorMessage.message != null}">
			<div class="alert alert-info">${errorMessage.message}</div>		
		</c:if>
		
		<c:if test="${errorMessage2.message != null}">
			<div class="alert alert-info">${errorMessage2.message}</div>		
		</c:if>
		
		
		<form:hidden path = "id" />
		
        <p class="pForForm">
          <form:label class="labelForForm" path="name">姓名：</form:label>
          <form:input class="form-control" type="text" id="name" path="name"/>
        </p>
         <p class="pForForm">
          <form:label class="labelForForm" path="email">Email：</form:label>
          <form:input class="form-control" type="email" id="email" path="email" readonly="true"/>
        </p>
        <div id="idDivForFormRadioButton">
        <p id="idPForFormRadioButton" class="pForForm">
          <form:radiobutton id="genderM" path="gender" value="Male" label="男性"/>&nbsp;&nbsp;
          <form:radiobutton id="genderF" path="gender" value="Female" label="女性"/>&nbsp;&nbsp; 
          <form:radiobutton id="genderOther" path="gender" value="Other" label="其他"/>&nbsp;&nbsp;
          <form:radiobutton id="genderNoSay" path="gender" value="Prefer not to say" label="不願透露"/>
        </p>
        </div>
        <p class="pForForm">
          <form:label class="labelForForm" path="birthday">生日：</form:label>
          <form:input class="form-control" type="date" id="birthday" path="birthday"/><small id="idSmall" style="color:grey; display:block;">西元年/月/日 (yyyy/mm/dd)</small>
        </p>
        <p class="pForForm">
          <form:label class="labelForForm" path="cellphone">手機號碼：</form:label>
          <form:input class="form-control" type="text" id="cellphone" path="cellphone"/>
        </p>
        <p class="pForForm">
          <form:label class="labelForForm" path="address">地址：</form:label>
          <form:input class="form-control" type="text" id="address" path="address"/>
        </p>
        <input id=submitBt class="btn btn-secondary btn-lg" style="position:relative; width:200px; height:50px;" type="submit" value="送出修改資料"/>
      </form:form>
        
      <a style="position:absolute; left:810px; bottom:300px;" href="<c:url value='/customer/profile/changePassword' />">修改密碼</a>
      <a id="idAForDeleteUser" style="position:absolute; left:940px; bottom:300px;" href="<c:url value='/customer/profile' />">回會員資料</a>
             
    
      <br>
      <br>
      
   

      <br>
      <br>
</div>


</body>
</html>