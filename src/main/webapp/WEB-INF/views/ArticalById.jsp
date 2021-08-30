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
<h1 id="articalID">${artical.articalID}</h1>
<div align="right">
<h1>${artical} </h1>
<a href='<c:url value="/artical/editform/" />${artical.articalID }'>修改文章</a>
</div>
<h1>${artical.subject} </h1>
<a>${artical.commentTime }</a>
<h1>${artical.content} </h1>
<hr>
<br>
<div id='comment' align='center'>
目前尚無留言
</div>
<hr>
<div align="center" id='sendcomment'>
${artical.articalID }

<form >
<!-- action="<c:url value='/comment/save/'/>${artical.articalID }"  --!>
<!--  -->

新增留言<input type="text" name="content" id="content" placeholder="請輸入留言">
<button type="button" value="送出" id="sendBtn">送出</button>
</form>
</div>
</body>
<script>
window.onload = function(){
let commentArea = document.getElementById("comment");
// var articalID = document.getElementById("articalID");
let xhr = new XMLHttpRequest();
xhr.open("POST", "<c:url value='/comment/findby' />" ,true);
xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhr.send("articalID="+${artical.articalID})

xhr.onreadystatechange = function(){
	if (xhr.readyState == 4 && xhr.status == 200){
		var content = "";
		
		var comment = JSON.parse(xhr.responseText);
// 		console.log(comment);
// 		console.log(comment.length);
// 		console.log(comment[1]);
// 		console.log(comment[1].content);
		
		for(var i=0; i<comment.length; i++){
			content+="<h3>commentContent="+comment[i].content+"</h3>"
			
		}
		commentArea.innerHTML = content;
	}
}



let btn = document.getElementById("sendBtn");
console.log(btn);
btn.onclick = function(){
	let sendCommentArea = document.getElementById("sendcomment");
	let commentArea = document.getElementById("comment");
	var content = document.getElementById("content").value;
	console.log("content==="+content);
	let xhr = new XMLHttpRequest();
// 	let xhr2 = new XMLHttpRequest();
	xhr.open("POST","<c:url value='/comment/save/'/>${artical.articalID }");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("content="+content);
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
// 	console.log(xhr.status);
// 	console.log(xhr.readyState);
// 	xhr2.open("GET", "<c:url value='/comment/findby/'/>${artical.articalID}");
//  	xhr2.send();
// 	console.log("readystate="+xhr2.readyState);
// 	console.log("ststus="+xhr2.status);
// 	xhr2.onreadystatechange = function(){
// 		if (xhr2.readyState == 4 && xhr2.status == 200){
			var content = "";
			var comment = JSON.parse(xhr.responseText);
			for(var i=0; i<comment.length; i++){
				content+="<h3>commentContent="+comment[i].content+"</h3>"
				commentArea.innerHTML = content;}}
				}	
				
	console.log(document.getElementById("content").value);
	document.getElementById("content").value=''; //把input清空
	
	}

};



</script>
</html>