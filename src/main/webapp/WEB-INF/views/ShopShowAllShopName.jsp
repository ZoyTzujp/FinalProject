<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.12.2.min.js' />"></script>
<style>
	/*  table-outbox
------------------------------------- */
.table-outbox {
  margin: 50px; /* 添加外距 */
  box-shadow: 0px 35px 50px rgba(27, 31, 49, 0.1); /* 添加表格陰影 */
}

/*  table
------------------------------------- */
table {
  border-collapse: collapse; /* 表格邊框合併 */
  width: 100%; /* 寬度 100% */
  background-color: white; /* 背景白色 */
}


table thead th {
  color: #ffffff; /* 表頭文字白色 */
  background: #2f4961; /* 表頭背景白色 */
}

table td,
table th {
  text-align: center; /* 文字置中顯示 */
  padding: 10px; /* 添加內距 */
}

table td {
  border-right: 1px solid #f1f1f1; /* 表格 td 右邊框顏色 */
}

table tr:nth-child(even) {
  background: #f8f8f8; /* 表格偶數 tr 灰色背景 */
}

td {
     white-space:nowrap;
     overflow:hidden;
     text-overflow: ellipsis;
}
 
</style>
<script>  
window.onload = function() {
		
		var xhr = new XMLHttpRequest();
	
		xhr.open("GET", "<c:url value='/showAllShopName' />", true); //請求店名內容
		
		              
		xhr.send(); //資料送出
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = "<div class='table-outbox' ><table border='1' id='myTable' style='table-layout: fixed'>";
				content += "<thead><tr><th>店名</th><th>負責人</th><th>信箱</th>" 
						 + "<th>介紹</th></tr></thead>";
				var shops = JSON.parse(xhr.responseText);		
				content +="<tbody>";
				//抓取資料塞入表格內
				for (var i = 0; i < shops.length; i++) {
// 					content += "<tr><td align='center'><a href='<c:url value='/findSingleShop/' />" + shops[i].shopID + "'>"
					
					//model提示框彈出
 					content	+= "<tr><td align='center'><a href='' data-bs-whatever='"+shops[i].shopID+"' data-bs-toggle='modal' data-bs-target='#exampleModal' title='Quick View' id='shopID'>"															
							+ shops[i].shopName + "</a></td>"
							+ "<td>" + shops[i].shopKeeper + "</td>"
							+ "<td align='right'>" + shops[i].email + "</td>" 
							+ "<td style='width: 700px; text-align='center' id='introduce'>"	+ shops[i].introduce
							+ "</td></tr>";
				}
				content += "</tbody></table>";
				
				var divs = document.getElementById("somedivS");
				divs.innerHTML = content;
			
			}
		}

}

</script>
</head>
<body>
<!-- 引入共同的頁首 -->
<jsp:include page="PageTop(login).jsp" />


	<!-- Breadcrumb Area Start Here -->
        <div class="breadcrumbs-area position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <div class="breadcrumb-content position-relative section-content">
                            <h3 class="title-3">Shop List</h3>
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>Shop</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Area End Here -->
	<!-- 商品銷售欄 Start Here -->
 <div class="shop-main-area">
    <div class="container container-default custom-area">
            <div class="col-lg-3 col-12 col-custom">
                <!-- 商品銷售欄 右方分類欄 Start -->
                <aside class="sidebar_widget widget-mt">
                    <div class="widget_inner">
<!--                         <div class="widget-list widget-mb-1"> -->
                            <h3 class="widget-title">Search</h3>
                            <div class="search-box">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="" id="myInput" placeholder="搜尋店名" onkeyup="searchFun()">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
<!--                         </div> -->
                      
                    </div>
                </aside>
                <!-- 商品銷售欄 右方分類欄 End -->
            </div>
    </div>
</div>
<!-- 商品銷售欄 End Here -->



    <!-- Modal -->
     <div class="modal fade obrien-modal" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true"> 
<!--      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">  -->
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" >
        	<button type="button" class="close close-button" data-bs-dismiss="modal" aria-label="Close">
                    <span class="close-icon" aria-hidden="true">x</span>
            </button>
        	<div class="modal-header" id="modal-header">
        <Script> 
	        var exampleModal = document.getElementById('exampleModal')
	        
	        	exampleModal.addEventListener('show.bs.modal', function (event) {
	        	
	        	var button = event.relatedTarget
	        	var shopID = button.getAttribute('data-bs-whatever')

	        	
		        var xhr2 = new XMLHttpRequest();               
	        					
				xhr2.open("GET","<c:url value='/findSingleShop1/"+shopID+"'/>",true);
				xhr2.send();
				xhr2.onreadystatechange = function(){
				    if(xhr2.readyState == 4 && xhr2.status == 200){
				    	var shops = JSON.parse(xhr2.responseText);//將回應的JSON字串轉為javaScript物件
				    	var context = "";
				    	console.log(shops);
				                 	
				        context +="<div class='container container-default custom-area'>"     
				                +"<div class='row'><div class='col-lg-7 col-custom'><div class='product-summery position-relative'>"
				                +"<div class='product-head mb-3'><h1 class='product-title'  >" 
				        		+shops.shopName
				        		+"</h1></div>"
  				        		+"<div class='product-image' id='img'>"
  				        		+"<img src='<c:url value='/getShopImage' />?id="+shops.shopID+"' width='400' height='300' alt='' >"
  				        		+"</div>"
				        		+"<div class='product-rating mb-3'>"
				        		+"<i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>"
				        		+"</div><p class='desc-content mb-5'>"
				            	+shops.introduce
				        		+"</p></div></div></div>"
// 				            	+"<div class='row mt-no-text'><div class='col-lg-12'><ul class='nav nav-tabs' id='myTab' role='tablist'>"
// 				            	+"<li class='nav-item'><a class='nav-link active text-uppercase' id='home-tab' data-toggle='tab' href=''#connect-1' role='tab' aria-selected='true'>店家簡介</a>"
// 		                        +"</li> </li><li class='nav-item'>"   
// 		                        +"<a class='nav-link text-uppercase' id='profile-tab' data-toggle='tab' href=''#connect-2' role='tab' aria-selected='false'>Reviews</a></li>"        
// 								+"<li class='nav-item'><a class='nav-link text-uppercase' id='contact-tab' data-toggle='tab' href='#connect-3' role='tab' aria-selected='false'>Shipping Policy</a></li>"
// 		                        +"</ul><div class='tab-content mb-text' id='myTabContent'><div class='tab-pane fade show active'id='connect-1'role='tabpanel' aria-labelledby='home-tab'><div class='desc-content'>"      
           
				    
				        var divs1 = document.getElementById("modal-header");
				        divs1.innerHTML = context;
			    }
			}  
}) 		
			</script>
			</div>
        </div>
      </div>
    </div>


 	
	
	<div id='somedivS'>
	
	</div>
	<div align="center">
	<input type="button"  class="btn obrien-button-2 primary-color" value="回前頁" onClick='history.go(-1)'> 
	</div>
	
	
    <!-- 關鍵字搜尋 -->
    <script>
    	const searchFun = () =>{
    		let filter = document.getElementById('myInput').value.toUpperCase();
    		
    		let myTable = document.getElementById('myTable');
    		let tr = myTable.getElementsByTagName('tr');
    		
    		for(var i=0; i< tr.length; i++){
    			let td = tr[i].getElementsByTagName('td')[0];
    			
    			if(td){
    				let textvalue = td.textContent || td.innerHTML;
    				if(textvalue.toUpperCase().indexOf(filter) > -1){  
    					tr[i].style.display = "";
    				}else{
    					tr[i].style.display= "none";
    				}
    			}
    	}
    } 
    	
		
    </script>

</body>
</html>