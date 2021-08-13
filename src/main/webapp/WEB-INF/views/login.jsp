<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Obrien</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
</head>

<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />
 
    <!-- 登入欄 Start Here -->
    <div class="login-register-area mt-no-text mb-no-text">
        <div class="container container-default-2 custom-area">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-custom">
                    <div class="login-register-wrapper">
                        <div class="section-content text-center mb-5">
                            <h2 class="title-4 mb-2">登入</h2>
                            <p class="desc-content">請輸入會員資訊</p>
                        </div>
                        <form action="userLogin" role="form" method="post" class="needs-validation " novalidate>
							<div class="col-md-4 single-input-item mb-3">
                                <input type="text" class="form-control" id="Email" name="Email" placeholder="電子郵件，例如:(exsample@gmail.com)"  required  pattern=".+@.+.com"/>
                                	<div class="invalid-feedback">
											信箱不可空白
									</div>
                           	</div>
                            <div class="col-md-4 single-input-item mb-3">
                                <input type="text" class="form-control" id="Password" name="Password" placeholder="密碼"  required/>
                                	<div class="invalid-feedback">
											密碼不可空白
									 </div>
                            </div>
                          
                             <div class="single-input-item mb-3">
                                <div class="login-reg-form-meta d-flex align-items-center justify-content-between">
                                    <div class="remember-meta mb-3">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="rememberMe">
                                            <label class="custom-control-label" for="rememberMe">Remember Me</label>
                                        </div>
                                    </div>
                                    <a href="#" class="forget-pwd mb-3">Forget Password?</a>
                                </div>
                            </div> 
                            <div class="single-input-item mb-3">
                            	<button class="btn obrien-button-2 primary-color" type="submit"	>登入</button>
                            	 <small>${errors.msg}</small> 
                           
                            </div>
<script type="text/javascript">
			(function () {
		  'use strict'

		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  var forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.prototype.slice.call(forms)
		    .forEach(function (form) {
		      form.addEventListener('submit', function (event) {
		    	  confirm('是否輸入完成?')
		        if (!form.checkValidity()) {
		          event.preventDefault()
		          event.stopPropagation()
		        }

		        form.classList.add('was-validated')
		      }, false)
		    })
		})()
	</script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 登入欄 End Here -->

</body>

</html>