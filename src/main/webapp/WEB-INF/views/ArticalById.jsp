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

<body>

<!-- 引入共同的頁首 -->
	<jsp:include page="PageTop(login).jsp" />

						<!-- 模板 -->
						<!-- 模板 -->
						<!-- 模板 -->
						<!-- 模板 -->
						<!-- 模板 -->
						<!-- 模板 -->

<a href='<c:url value="/artical/editform/" />${artical.articalID }'>修改文章</a>
           
            
        
        
        <!-- Breadcrumb Area Start Here -->
        <div class="breadcrumbs-area position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <div class="breadcrumb-content position-relative section-content">
                            <h3 class="title-3">Blog Details Fullwidth</h3>
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>Blog</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Area End Here -->
        
        
        <!-- Blog Main Area Start Here -->
        <div class="blog-main-area">
            <div class="container container-default-2 custom-area">
                <div class="row flex-row-reverse">
                    <div class="col-12 col-custom mt-no-text">
                        <!-- Blog Details wrapper Area Start -->
                        <div class="blog-post-details">
                            <figure class="blog-post-thumb mb-5">
                                <img class="w-100" src="<c:url value='/images/blog/large-size/1.jpg' />" alt="Blog Image">
                                
                            </figure>
                            
                            
                            <section class="blog-post-wrapper product-summery">
                                <div class="section-content">
                                    <h2 class="title-1 mb-3">${artical.subject}</h2>
                                    <p class="mb-4">${artical.content}</p>
                                </div>
                                <div class="share-article">
                                    <span class="left-side">
                                    <a href="#"> <i class="fa fa-long-arrow-left"></i> Older Post</a>
                                </span>
                                    <h6 class="text-uppercase">Share this article</h6>
                                    <span class="right-side">
                                   <a href="#">Newer Post <i class="fa fa-long-arrow-right"></i></a>
                                </span>
                                </div>
                                <div class="social-share">
                                    <a href="#"><i class="fa fa-facebook-square facebook-color"></i></a>
                                    <a href="#"><i class="fa fa-twitter-square twitter-color"></i></a>
                                    <a href="#"><i class="fa fa-linkedin-square linkedin-color"></i></a>
                                    <a href="#"><i class="fa fa-pinterest-square pinterest-color"></i></a>
                                </div>
                                
				<!--                                 留言 -->
				<!--                                 留言 -->
				<!--                                 留言 -->
                                <div class="comment-area-wrapper mt-5" id='comment'>
                                    <div class="comments-view-area" >
                                        <h3 class="mb-5">3則留言</h3>
                                        <div class="single-comment-wrap mb-4 d-flex" id="content">
                                            <figure class="author-thumb">
                                                <a href="#">
                                                    <img src="assets/images/review/1.jpg" alt="Author">
                                                </a>
                                            </figure>
                                            <div class="comments-info">
                                                <p class="mb-2">This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet</p>
                                                <div class="comment-footer d-flex justify-content-between" id="commentfooter">
                                                    <a href="#" class="author"><strong>Duy</strong> - July 30, 2021</a>
                                                    <a href="#" class="btn-reply"><i class="fa fa-reply"></i> Reply</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single-comment-wrap mb-4 comment-reply d-flex">
                                            <figure class="author-thumb">
                                                <a href="#">
                                                    <img src="assets/images/review/1.jpg" alt="Author">
                                                </a>
                                            </figure>
                                            <div class="comments-info">
                                                <p class="mb-2">Praesent bibendum risus pellentesque faucibus rhoncus. Etiam a mollis odio. Integer urna nisl, fermentum eu mollis et, gravida eu elit.</p>
                                                <div class="comment-footer d-flex justify-content-between">
                                                    <a href="#" class="author"><strong>Jack</strong> - July 30, 2021</a> <a href="#" class="btn-reply"><i class="fa fa-reply"></i> Reply</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single-comment-wrap mb-4 d-flex">
                                            <figure class="author-thumb">
                                                <a href="#">
                                                    <img src="assets/images/review/1.jpg" alt="Author">
                                                </a>
                                            </figure>
                                            <div class="comments-info">
                                                <p class="mb-2">Praesent bibendum risus pellentesque faucibus rhoncus. Etiam a mollis odio. Integer urna nisl, fermentum eu mollis et, gravida eu elit.</p>
                                                <div class="comment-footer d-flex justify-content-between">
                                                    <a href="#" class="author"><strong>Duy</strong> - July 30, 2021</a>
                                                    <a href="#" class="btn-reply"><i class="fa fa-reply"></i> Reply</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <!-- Blog Details Wrapper Area End -->
                        
                        
                        <!-- Blog Comments Area Start -->
                        <form action="#">
                            <div class="comment-box">
                                <h3>Leave A Comment</h3>
                                <div class="row">
                                    <div class="col-12 col-custom">
                                        <div class="input-item mt-4 mb-4">
                                            <textarea cols="30" rows="5" name="content" id="content" placeholder="請輸入留言" class="border rounded-0 w-100 custom-textarea input-area" ></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-custom">
                                        <div class="input-item mb-4">
                                            <input class="border rounded-0 w-100 input-area name" type="text" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-custom">
                                        <div class="input-item mb-4">
                                            <input class="border rounded-0 w-100 input-area email" type="text" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="col-12 col-custom mt-40 mb-no-text">
                                        <button  id="sendBtn" class="btn obrien-button primary-btn rounded-0 mb-0 w-100">Post comment</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- Blog Comments Area End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog Main Area End Here -->
        <!--

    <!-- Modal Area Start Here -->
    <div class="modal fade obrien-modal" id="exampleModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close close-button" data-dismiss="modal" aria-label="Close">
                    <span class="close-icon" aria-hidden="true">x</span>
                </button>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 text-center">
                                <div class="product-image">
                                    <img src="assets/images/product/1.jpg" alt="Product Image">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="modal-product">
                                    <div class="product-content">
                                        <div class="product-title">
                                            <h4 class="title">Product dummy name</h4>
                                        </div>
                                        <div class="price-box">
                                            <span class="regular-price ">$80.00</span>
                                            <span class="old-price"><del>$90.00</del></span>
                                        </div>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <span>1 Review</span>
                                        </div>
                                        <p class="desc-content">we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame bel...</p>
                                        <form class="d-flex flex-column w-100" action="#">
                                            <div class="form-group">
                                                <select class="form-control nice-select w-100">
                                                    <option>S</option>
                                                    <option>M</option>
                                                    <option>L</option>
                                                    <option>XL</option>
                                                    <option>XXL</option>
                                                </select>
                                            </div>
                                        </form>
                                        <div class="quantity-with_btn">
                                            <div class="quantity">
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box" value="0" type="text">
                                                    <div class="dec qtybutton">-</div>
                                                    <div class="inc qtybutton">+</div>
                                                </div>
                                            </div>
                                            <div class="add-to_cart">
                                                <a class="btn obrien-button primary-btn" href="cart.html">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <div class="single-comment-wrap mb-4 d-flex">
                                            <figure class="author-thumb">
                                                <a href="#">
                                                    <img src="assets/images/review/1.jpg" alt="Author">
                                                </a>
                                            </figure>
                                            </div>
                                            <div class="single-comment-wrap mb-4 d-flex">
                                            <figure class="author-thumb">
                                                <a href="#">
                                                    <img src="assets/images/review/1.jpg" alt="Author">
                                                </a>
                                            </figure>
                                            </div>
    <!-- Modal Area End Here -->

    <!-- Scroll to Top Start -->
    <a class="scroll-to-top" href="#">
        <i class="ion-chevron-up"></i>
    </a>
    <!-- Scroll to Top End -->





</body>
<script>
window.onload = function(){
console.log("test>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
let commentArea = document.getElementById("comment");
let commentFooter = document.getElementById("commentfooter");
// var articalID = document.getElementById("articalID");
let xhr = new XMLHttpRequest();
xhr.open("POST", "<c:url value='/comment/findby' />" ,true);
xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhr.send("articalID="+${artical.articalID})

console.log("test");
xhr.onreadystatechange = function(){
	if (xhr.readyState == 4 && xhr.status == 200){
		var comment = JSON.parse(xhr.responseText);
		var content = "<div class='comments-view-area'><h3 class='mb-5'>"+comment.length+" 則留言</h3>";
// 		console.log(comment);
// 		console.log(comment.length);
// 		console.log(comment[1]);
// 		console.log(comment[1].content);
		
		for(var i=0; i<comment.length; i++){
            let imgURL = "<c:url value='/images/review/1.jpg'/>";
			content+="<div class='single-comment-wrap mb-4 d-flex'>";
			content+="<figure class='author-thumb'>";
			content+="<a href='#'>";
			content+="<img src='" + imgURL +"' alt='Author'>";
            content+="</a>";
            content+=" </figure>";
            content+='<div class="comments-info">';
            content+="<p>"+comment[i].content+"\n\n</p>";
            
            content+='<div class="comment-footer d-flex justify-content-between">';
            content+='<a href="#" class="author"><strong>'+comment[i].name+'</strong>'+' \b\b\b -'+comment[i].commentTime+'</a>';
            content+='</div>';
            content+='</div>';
            content+="</div><hr>";
			
			
		}
		content+="</div><br>";
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
			var content = "<div class='comments-view-area'><h3 class='mb-5'>"+comment.length+" 則留言</h3>";
			var comment = JSON.parse(xhr.responseText);
			for(var i=0; i<comment.length; i++){
				 let imgURL = "<c:url value='/images/review/1.jpg'/>";
					content+="<div class='single-comment-wrap mb-4 d-flex'>";
					content+="<figure class='author-thumb'>";
					content+="<a href='#'>";
					content+="<img src='" + imgURL +"' alt='Author'>";
		            content+="</a>";
		            content+=" </figure>";
		            content+="<h3>"+comment[i].content+"</h3>";
		            content+="</div>";
				}	
			content+="</div><hr><br>";
			commentArea.innerHTML = content;
	console.log(document.getElementById("content").value);
	document.getElementById("content").value=''; //把input清空
				}
			}
		}
};


</script>
</html>