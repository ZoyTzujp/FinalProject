<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Edit Customer Password</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/css/vendor/bootstrap.min.css' />">

	<style type="text/css">
	
	.form-signin {
	  max-width: 700px;
	  padding: 15px;
	  margin: 0 auto;
	}
	
	.form-signin .form-signin-heading,
	.form-signin .checkbox {
	  margin-bottom: 10px;
	  font-size: 40px; 
	  
	}
	.form-signin .checkbox {
	  font-weight: 400;
	}
	.form-signin .form-control {
	  position: relative;
	  box-sizing: border-box;
	  height: auto;
	  padding: 10px;
	  font-size: 16px;
	}
	
	.form-control {
		display: inline-block;
		width: 70%;
		vertical-align: baseline;
		margin: 15px 5px 15px 0px;
	}
	
	.labelForForm {
	  display: inline-block;
 	  text-align: left;	
 	  width: 150px;
 	  font-size: 18px;
 	  }
 	
 	.pForForm {
   		margin-bottom: 25px;
    }    
	
	
	.form-signin .form-control:focus {
	  z-index: 2;
	}
	.form-signin input[type="email"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	
	#birthday {
		margin-bottom: -2px;
	}
	
	.fa-leaf {
		font-size: 15px;
	}
	
	.fa-leaf_color {
		font-size: 15px;
		color: #639ebe;
		transition: 0.5s;
	}
	
	#idDivAlreadyHasAccount {
		position: absolute;
		right: 135px;
		top: 30px;
	}
	
	#idDivSignUpAsSeller {
		position: absolute;
		right: 110px;
		top: 60px;
	}
	
	#iddivForH2_1 {
		position: relative;
		font-size: 20px;
		left: 0px;
		margin-bottom: 10px;
	}
	
	#submitBt {
    	background-color: grey;
    	left: 310px;
    }
    
    #submitBt:hover {
    	background-color: #6590D3;
    }
	
	.signUp_bt {
		position: relative;
		background: #282e40;
	    color: #fff;
	    padding: 0;
	    float: left;
	    font-size: 25px;
	    font-weight: 300;
	    font-style: italic;
	    border-radius: 0;
	    width: 170px;
	    height: 50px;
	    text-align: center;
	    line-height: normal;
	    margin-bottom: 80px;
	    transition: 0.5s;	
	    border: transparent;
   	    top: 20px;
	    left: 280px;
	}
	
	.signUp_bt:hover, .signUp_bt:focus {
	    background: #5293b7;
	    color: #fff;
	}
	
	.back_bt {
		position: relative;
		background: #282e40;
	    color: #fff;
	    padding: 0;
	    float: left;
	    font-size: 25px;
	    font-weight: 300;
	    font-style: italic;
	    border-radius: 0;
	    width: 170px;
	    height: 50px;
	    text-align: center;
	    line-height: normal;
	    margin-bottom: 80px;
	    transition: 0.5s;	
	    border: transparent;
   	    top: 10px;
	    left: 50px;
	}
	
	 .back_bt:hover, .back_bt:focus {
	    background: #5293b7;
	    color: #fff;
	}
	
	#idAForBack, #idAForBack:hover {
		color: white;
	}
	
	a:hover {
	    color: #639ebe;
	    text-decoration: underline;
	}
	
	#idPForFormRadioButton {
		position: relative;
		left: 110px;
		top: 10px;
	}
	
	#idDivForFormRadioButton {
		margin: 10px 5px 5px 0px;
	}

	#idSmall {
		position: relative;
		left: 110px;
	}
	
	#idDivButton {
		margin: 15px 5px 15px 0px;
		position: relative;
		left: 110px;
		top: 10px;
		font-size: 15px;
		font-color: grey;
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
      <form class="form-signin" method="POST" action="changePassword/send">
        <div id="iddivForH2_1"><h2 id="idh2_1" class="form-signin-heading">Edit User Password</h2></div>
        
         <br>
		
		<c:if test="${successMessage.message != null}">
			<div class="alert alert-info"><div style="text-align: center;">${successMessage.message}</div></div>		
		</c:if>
		
		<c:if test="${errorMessage.message != null}">
			<div class="alert alert-info"><div style="text-align: center;">${errorMessage.message}</div></div>		
		</c:if>
		
		<c:if test="${errorMessage2.message != null}">
			<div class="alert alert-info"><div style="text-align: center;">${errorMessage2.message}</div></div>		
		</c:if>
		
		
        <p class="pForForm">
          <label class="labelForForm" for="password">目前密碼：</label>
          <input class="form-control" type="password" id="oldPassword" name="oldPwdEnteredByUser" autofocus required>
        </p>
        
         <p class="pForForm">
          <label class="labelForForm" for="password">新密碼：</label>
          <input class="form-control" type="password" id="newPassword" name="newPassword" required>
        </p>
       
        <p class="pForForm">
          <label class="labelForForm" for="password">再次確認新密碼：</label>
          <input class="form-control" type="password" id="confirmNewPassword" name="newPwdToBeConfirmed" required>
        </p>
       
        <div id="idDivButton"><button id="submitBt" class="btn btn-secondary btn-lg" style="position:relative; width:200px; height:50px; left:-30px;" type="button" onclick="location.href = '${pageContext.request.contextPath}/customer/profile/edit';">取消</button></div><input id="submitBt" class="btn btn-secondary btn-lg" style="position:relative; width:200px; height:50px; bottom:55px; left:380px;" type="submit" value="確定">
      </form>
             
    
      <br>
      <br>
      
   

      <br>
      <br>
</div>


</body>
</html>