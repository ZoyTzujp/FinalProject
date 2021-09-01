<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<meta http-equiv="refresh" content="5;URL=http://localhost:6060/FinalProject/shopLoginForm">
</head>
<body onload="out(4)">
<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />

	<div class="error-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="error_form">
                            <h1>信箱驗證成功</h1>
                            <h4>恭喜! 您的帳號已驗證完成</h4><br>
                            <p><span id="h1">sec</span>秒後跳轉至登入介面</p>
							

                        </div>
                    </div>
                </div>
            </div>
        </div>
	<script type="text/javascript">
		function out(sec){
			var v = document.getElementById("h1");
			if(--sec>0){
				setTimeout("out("+sec+")", 1000);
			}
			v.innerHTML=sec;
		}
	</script>

</body>
</html>