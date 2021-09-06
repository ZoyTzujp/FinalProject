<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Obrien</title>
   
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
	<style>
        i{color:crimson}
    </style>
 
<script >

window.onload = function() {
	
  		var fivestars1 = document.getElementsByTagName('i');
//    		var fivestars1 = document.querySelectorAll('.commentStarRe i');
   		console.log(fivestars1)

  		let divp 		= document.getElementById("p");
 		let commentID 	= document.getElementById("commentID");
 		let Name 		= document.getElementById("Name");
 		let email 		= document.getElementById("email");
 		let shopContent = document.getElementById("shopContent");
 		var xhr = new XMLHttpRequest();
 		
 		xhr.open("GET", "<c:url value='/findCommentsById/'/>${shopBean.shopID}", true); //請求店名內容     
 		xhr.send(); //資料送出
 		xhr.onreadystatechange = function() {
 			
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				
  				var shopComments = JSON.parse(xhr.responseText);	
  				
  				var context="";

 				for(let i=0;i< shopComments.length;i++){	
 					
 					context += " <div class='pro_review mb-5' ><div class='review_thumb'><img alt='review images' src='../images/review/1.jpg'></div>" 					
 					         + "<div class='review_details'><div class='review_info mb-2' ><div class='review_info commentStarRe'   >"
 					         
 					let num=shopComments[i].starNumber;
 					console.log(num)

	 					for (let j = 0; j < 5; j++) { 
							if(j < num){
								context += "<i class='fa fa-star'></i>"

	 			            console.log(fivestars[j]);
	 			            }else{
	 			            	context +="<i class='fa fa-star-o'></i>"
	 			            }
	 					}	

 					
					context += "</div><h5>"+shopComments[i].name 
					+" - "
					+"<span>"+shopComments[i].commentCreateTime+"</span></h5>"
 					
					+"</div><p>"+shopComments[i].shopContent+"</p>"
					+"</div></div>"  		
					+ shopComments[i].starNumber
					
					
 				}
 				
 				var div = document.getElementById("commentID");
	  				div.innerHTML = context  				
	  				
 			}
    }
 		
	
		//五星評價	
			document.getElementById("saveComment").addEventListener("click", Clean)
			var fivestars = document.querySelectorAll('.commentStar i');
		

			let fivestarLen=fivestars.length;
			var starNumber;
			for (let i = 0; i < fivestarLen; i++) {      //迴圈做BINDING
                fivestars[i].addEventListener("mouseout", mouseout);
                fivestars[i].addEventListener("mouseover", mouseover);
                fivestars[i].addEventListener("click", Click);
			}
			
			
			function mouseover() {

                    let no=this.id.charAt(1);
                    for (let j = 0; j < no; j++) {  //滑入時更改星星圖片                    


                        fivestars[j].classList.remove('fa-star-o')
                        fivestars[j].classList.add('fa-star')
                        
                        
                        }

            }
			
			function mouseout(){

				let no=this.id.charAt(1);
				for (let k = 0; k <=no; k++) {
				fivestars[k].classList.remove('fa-star')
				fivestars[k].classList.add('fa-star-o');
				}
            }
			
			function Click(){
				let no=this.id.charAt(1);
				console.log(no)
		
				for (let i = 0; i <=no; i++) {
				fivestars[i].removeEventListener("mouseout", mouseout);
				fivestars[i].removeEventListener("mouseover", mouseover);
				
				}
				
				starNumber = no;

			} 
			
			function Clean(){
				starNumber;
				let no=this.id.charAt(1);
				if(starNumber != null) {
					fivestars[0].classList.remove('fa-star')
					fivestars[0].classList.add('fa-star-o');
					fivestars[1].classList.remove('fa-star')
					fivestars[1].classList.add('fa-star-o');
					fivestars[2].classList.remove('fa-star')
					fivestars[2].classList.add('fa-star-o');
					fivestars[3].classList.remove('fa-star')
					fivestars[3].classList.add('fa-star-o');
					fivestars[4].classList.remove('fa-star')
					fivestars[4].classList.add('fa-star-o');
					}
				for (let i = 0; i < no; i++) {      //迴圈做BINDING
					
	                fivestars[i].addEventListener("mouseout", mouseout);
	                fivestars[i].addEventListener("mouseover", mouseover);
	                fivestars[i].addEventListener("click", Click);
				}
				document.getElementById("saveComment").addEventListener("click", Clean)
			}
  					
		var saveComment = document.getElementById("saveComment");
		saveComment.onclick = function() {	 
			let NameValue	= document.getElementById("Name").value;
	    	let emailValue 	= document.getElementById("email").value;
	    	let shopContentValue = document.getElementById("shopContent").value;
	    	var xhr1 = new XMLHttpRequest();
	    	xhr1.open("POST", "<c:url value='/saveComment/' />${shopBean.shopID}" , true);
 	    	xhr1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  		xhr1.send("Name="+NameValue+"&email="+emailValue+"&shopContent="+shopContentValue+"&starNumber="+starNumber);

 	  		xhr1.onreadystatechange = function() {
 					// 伺服器請求完成
 	  		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
 	  			var shopContentValue = "";
 	  			var shopComments = JSON.parse(xhr1.responseText);	
 	  			var context="";
 				for(let i=0;i< shopComments.length;i++){

 					context += " <div class='pro_review mb-5' ><div class='review_thumb'><img alt='review images' src='../images/review/1.jpg'></div>" 					
				         + "<div class='review_details'><div class='review_info mb-2' ><div class='review_info commentStarRe'   >"
				         
						let num=shopComments[i].starNumber;
						console.log(num)

					for (let j = 0; j < 5; j++) { 
						if(j < num){
							context += "<i class='fa fa-star'></i>"

			            console.log(fivestars[j]);
			            }else{
			            	context +="<i class='fa fa-star-o'></i>"
			            }
					}	

				
					context += "</div><h5>"+shopComments[i].name 
					+" - "
					+"<span>"+shopComments[i].commentCreateTime+"</span></h5>"
					
					+"</div><p>"+shopComments[i].shopContent+"</p>"
					+"</div></div>"  		
	
	 					}
	 				var div = document.getElementById("commentID");
		  				div.innerHTML = context
 	  			}
 	  		}
 	  		document.getElementById("shopContent").value=''; //把input清空
 	  		document.getElementById("email").value='';
 	  		document.getElementById("Name").value='';
 	  		
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
						<div class="col-lg-9 col-12 col-custom widget-mt">

                            <div class="product-head mb-3">
                                <h1 class="product-title"  >${shopBean.shopName }</h1> 
                            </div>    
                            <div class="product-image" id="img">                       
                            <img src="<c:url value='/getShopImage' />?id=${shopBean.shopID}" width="400" height="300" alt="" ><br>
                           	</div>
                           	<!-- 五星 -->
                            <div class="product-rating mb-3">
                                
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
                    <div class="col-lg-3 col-12 col-custom">
                        <!-- Sidebar Widget Start -->
                        <aside class="sidebar_widget widget-mt">
                            <div class="widget_inner">
                              
                                
                                <div class="widget-list widget-mb-4">   
                                    <h3 class="widget-title"><a href="<c:url value='/showProductFormByShopID/${LoginOK.shopID}' />">Recent Products</a></h3>
                                    <div class="sidebar-body">
                                        <div class="sidebar-product align-items-center">
                                            <a href="product-details.html" class="image">
                                                <img src="assets/images/product/small-product/1.jpg" alt="product">
                                            </a>
                                            <div class="product-content">
                                                <div class="product-title">
                                                    <h4 class="title-2"> <a href="product-details.html">Product dummy name</a></h4>
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
                                                </div>
                                            </div>
                                        </div>
                                        <div class="sidebar-product align-items-center">
                                            <a href="product-details.html" class="image">
                                                <img src="assets/images/product/small-product/2.jpg" alt="product">
                                            </a>
                                            <div class="product-content">
                                                <div class="product-title">
                                                    <h4 class="title-2"> <a href="product-details.html">Product dummy title</a></h4>
                                                </div>
                                                <div class="price-box">
                                                    <span class="regular-price ">$50.00</span>
                                                    <span class="old-price"><del>$60.00</del></span>
                                                </div>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="sidebar-product align-items-center">
                                            <a href="product-details.html" class="image">
                                                <img src="assets/images/product/small-product/3.jpg" alt="product">
                                            </a>
                                            <div class="product-content">
                                                <div class="product-title">
                                                    <h4 class="title-2"> <a href="product-details.html">Product title here</a></h4>
                                                </div>
                                                <div class="price-box">
                                                    <span class="regular-price ">$40.00</span>
                                                    <span class="old-price"><del>$50.00</del></span>
                                                </div>
                                                <div class="product-rating ">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                    <i class="fa fa-star-half-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>
                        <!-- Sidebar Widget End -->
                    </div>

            
        </div>
        <!-- Shop Main Area End Here -->
                			
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
                                <a class="nav-link text-uppercase" id="contact-tab" data-toggle="tab" href="#connect-3" role="tab" aria-selected="false">隱私權政策</a>
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
                                                 </div> 

                                            </div> 
                                         </div> 
                                        <!-- End Single Review -->
                                    </div>
                                    <!-- Start RAting Area -->
                                    <div class="rating_wrap">
                                        <h5 class="rating-title-1 mb-2">添加評論 </h5>
                                        <p class="mb-2">評論僅會顯示留言， 「*」為必填欄位。</p>
                                        <h6 class="rating-title-2 mb-2" >您的評分</h6>
                                        <div class="rating_list mb-4" >
                                             <div class="review_info commentStar " id="starNumber" > 
												<i id="s1" class="fa fa-star-o"></i>
												<i id="s2" class="fa fa-star-o"></i>
												<i id="s3" class="fa fa-star-o"></i>
												<i id="s4" class="fa fa-star-o"></i>
												<i id="s5" class="fa fa-star-o"></i>
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
                                    <h4 class="title-3 mb-4">隱私權政策</h4>
                                    <p class="desc-content mb-2">隱私權保護政策之宣示<br>
本公司非常重視您的個人資料安全及隱私權之保障，關於本公司或本集團直接或間接蒐集、處理及利用您的個人資料，均遵守中華民國政府頒布之個人資料保護法及相關法令規範，並特制定隱私權保護政策（以下簡稱本政策），以維護您的個人資料安全並保障您的權利，詳細規範內容如下：</p>
                                    <ul class="policy-list mb-2">
                                        <li>(1)當您使用本公司提供之服務，為履行或行使契約訂定之權利義務，例如訂購商品、處理訂單、支付款項以及配送商品等</li>
                                        <li>(2)提供本公司或本集團有關之產品及服務等行銷資訊、提供贈獎活動、邀請參與評價、問卷調查等。</li>
                                        <li>(3)基於個人化推薦、網路流量及相關資訊分析、網路行為調查等。</li>
                                        <li>(4)依法令之事項、履行法定義務、執行資訊安全管理等。</li>
                                        <li>(5)其他業務附隨或相關事項、合於營業登記項目或組織章程所定之業務，以及經當事人同意之其他目的等。</li>
                                    </ul>
                                    <p class="desc-content mb-2">對店家（包含洽詢開店者）的個人資料蒐集目的及類別為：
(1)基於提供本公司開店資訊、報名說明會或於本公司開設及經營網路店舖有關之事項（包含財務徵信、履行及行使契約權利義務等）、依法令之事項、行銷廣告、資訊安全管理、其他業務附隨或相關事項、合於營業登記項目或組織章程所定之業務，以及經當事人同意之其他目的等。
(2)向您蒐集之個人資料類別為：姓名、電話、傳真號碼、電子郵件地址、地址、身分證影本、身分證統一編號、金融機構帳戶帳號以及其他符合蒐集目的所必要之資訊或其他當您使用本集團服務時所產生或自行提供的資料。
4. 對合作夥伴的個人資料蒐集目的及類別為：
為雙方個別合作之目的，將會請您提供以下資料：姓名、職稱、連絡電話、電子郵件地址等其他合作所必要之資訊。
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
             </div> 

       
        


    

</body>

</html>