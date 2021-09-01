<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
<script >
window.onload = function() {
 		let divp 		=  document.getElementById("p");
 		let Name 		= document.getElementById("Name");
 		let email 		= document.getElementById("email");
 		let shopContent = document.getElementById("shopContent");
 		var xhr = new XMLHttpRequest();
	
 		xhr.open("GET", "<c:url value='/findCommentsById/'/>${shopBean.shopID}", true); //請求店名內容
// 		console.log(${shopBean.shopID})      
 		xhr.send(); //資料送出
 		xhr.onreadystatechange = function() {
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				
  				var shopComments = JSON.parse(xhr.responseText);	
  				var context="";
 				for(let i=0;i< shopComments.length;i++){
 					
 					context += " <div class='pro_review mb-5' > <div class='review_details'  ><div class='review_info mb-2' >  "+shopComments[i].name 
						+"<br>"
						+shopComments[i].shopContent+"</div></div></div>"	  				
//  	 				console.log(shopComments)  
//  					console.log(shopComments.length) 
//  					console.log(shopComments[0].name) 
 				}	
 				var div = document.getElementById("commentID");
	  				div.innerHTML = context
 			}
    }
		
		var saveComment = document.getElementById("saveComment");
		saveComment.onclick = function() {	 
			let NameValue	= document.getElementById("Name").value;
	    	let emailValue 	= document.getElementById("email").value;
	    	let shopContentValue = document.getElementById("shopContent").value;
	    	var xhr1 = new XMLHttpRequest();
	    	xhr1.open("POST", "<c:url value='/saveComment/' />${shopBean.shopID}" , true);
 	    	xhr1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  		xhr1.send("Name="+NameValue+"&email="+emailValue+"&shopContent="+shopContentValue);

 	  		xhr1.onreadystatechange = function() {
 					// 伺服器請求完成
 	  		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
 	  			var shopContentValue = "";
 	  			var shopComments = JSON.parse(xhr1.responseText);	
 	  			var context="";
 				for(let i=0;i< shopComments.length;i++){
 					
 					console.log(shopComments[i])
 	  				context += " <div class='pro_review mb-5' > <div class='review_details'  ><div class='review_info mb-2' >  "+shopComments[i].name 
 	  						+"<br>"
 	  						+shopComments[i].shopContent+"</div></div></div>"
 	  						
 	  						

 					}
 				var div = document.getElementById("commentID");
	  				div.innerHTML = context
 	  			}
 	  		}
	}		
}		
</script>
</head>

<body>

<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />
    
        <!-- Single Product Main Area Start -->
        <div class="single-product-main-area">
            <div class="container container-default custom-area">
                <div class="row">


                            <div class="product-head mb-3">
                                <h1 class="product-title"  >${shopBean.shopName }</h1> 
                            </div>    
                            <div class="product-image" id="img">                       
                            <img src="<c:url value='/getShopImage' />?id=${shopBean.shopID}" width="400" height="300" alt="" ><br>
                           	</div>
                           	
                            <div class="product-rating mb-3">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <div>
                            <h5>聯絡資訊:</h5>
                            </div>
                            <p class="desc-content mb-5">
                            
                            電話:${shopBean.shopPhone}<br>
                            Mail:${shopBean.email}<br>
                            </p>          
							<div class="product-image" id="img">  
							<a href="${shopBean.webLink}"><img src="http://chart.apis.google.com/chart?cht=qr&choe=UTF-8&chs=200x200&chl=${shopBean.webLink}" /></a>
                			</div>
                </div>	
                <div class="row mt-no-text">
                    <div class="col-lg-12">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active text-uppercase" id="home-tab" data-toggle="tab" href="#connect-1" role="tab" aria-selected="true">店家簡介</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-uppercase" id="profile-tab" data-toggle="tab" href="#connect-2" role="tab" aria-selected="false">評論</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-uppercase" id="contact-tab" data-toggle="tab" href="#connect-3" role="tab" aria-selected="false">Shipping Policy</a>
                            </li>
                        
                        </ul>
                        <div class="tab-content mb-text" id="myTabContent">
                            <div class="tab-pane fade show active" id="connect-1" role="tabpanel" aria-labelledby="home-tab">
                                <div class="desc-content">
                                    <p class="mb-3">${shopBean.introduce }                                
                                </div>
                            </div>
                            <div class="tab-pane fade" id="connect-2" role="tabpanel" aria-labelledby="profile-tab">
                                <!-- Start Single Content -->
                                <div class="product_tab_content  border p-3">
                                    <div class="review_address_inner"id="commentID">
                                        <!-- Start Single Review -->
                                         <div class="pro_review mb-5" > 
                                             <div class="review_details"  > 
                                                 <div class="review_info mb-2" > 
<!--                                                     <div class="product-rating mb-2"> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star-o"></i> -->
<!--                                                         <i class="fa fa-star-o"></i> -->
<!--                                                     </div> -->
<!-- 														<div id="commentID"></div> -->
<!--                                                      <h5 id="commentID"><span> December 19, 2020</span></h5>  -->
                                                 </div> 

                                            </div> 
                                         </div> 
                                        <!-- End Single Review -->
                                    </div>
                                    <!-- Start RAting Area -->
                                    <div class="rating_wrap">
                                        <h5 class="rating-title-1 mb-2">Add a review </h5>
                                        <p class="mb-2">Your email address will not be published. Required fields are marked *</p>
                                        <h6 class="rating-title-2 mb-2">Your Rating</h6>
                                        <div class="rating_list mb-4">
                                            <div class="review_info">
                                                <div class="product-rating mb-3">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End RAting Area -->
                                    <div class="comments-area comments-reply-area">
                                        <div class="row">
                                            <div class="col-lg-12 col-custom">
                                                <form  action="" class="comment-form-area" >
                                                    <div class="row comment-input">
                                                        <div class="col-md-6 col-custom comment-form-author mb-3">
                                                            <label>Name <span class="required">*</span></label>
                                                            <input type="text" required="required" name="Name" id="Name">
                                                        </div>
                                                        <div class="col-md-6 col-custom comment-form-emai mb-3">
                                                            <label>Email <span class="required">*</span></label>
                                                            <input type="text" required="required" name="email" id="email">
                                                        </div>
                                                    </div>
                                                    <div class="comment-form-comment mb-3">
                                                        <label>Comment</label>
                                                        <textarea class="comment-notes" required="required" id="shopContent" name="shopContent"></textarea>
                                                    </div>
                                                    <div class="comment-form-submit">
<!--                                                          <input id='saveComment' type="submit" value="Submit" class="comment-submit btn obrien-button primary-btn">  -->
                                                     	<button type="button" value="送出" id='saveComment' class="comment-submit btn obrien-button primary-btn">送出</button> 
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Content -->
                            </div>
                            <div class="tab-pane fade" id="connect-3" role="tabpanel" aria-labelledby="contact-tab">
                                <div class="shipping-policy">
                                    <h4 class="title-3 mb-4">Shipping policy for our store</h4>
                                    <p class="desc-content mb-2">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate</p>
                                    <ul class="policy-list mb-2">
                                        <li>1-2 business days (Typically by end of day)</li>
                                        <li><a href="#">30 days money back guaranty</a></li>
                                        <li>24/7 live support</li>
                                        <li>odio dignissim qui blandit praesent</li>
                                        <li>luptatum zzril delenit augue duis dolore</li>
                                        <li>te feugait nulla facilisi.</li>
                                    </ul>
                                    <p class="desc-content mb-2">Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum</p>
                                    <p class="desc-content mb-2">claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per</p>
                                    <p class="desc-content mb-2">seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product Main Area End -->

</body>

</html>