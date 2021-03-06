<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="img/qflogo.png" />
	</div>
	<div class="col-md-5">
		<img src="img/header.png" />
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline" id="item">
			<li><a href="login.jsp">登录</a></li>
			<li><a href="register.jsp">注册</a></li>
			<li><a href="cart.jsp">购物车</a></li>
			<li><a href="${pageContext.request.contextPath}/ProductServlet?method=myOrders">我的订单</a></li>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="category">
					<li class="active"><a href="product_list.htm">手机数码<span class="sr-only">(current)</span></a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">电脑办公</a></li>
				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
	</nav>
</div>
<script>
$(function(){
	
	$.post(
		"${pageContext.request.contextPath}/CategoryServlet",
		function(data){
			var content="";
		     for(var i=0;i<data.length;i++){
		    	content+="<li><a href='${pageContext.request.contextPath}/ProductServlet?method=prByCategory&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
		     }
		     $("#category").html(content);
		},
		"json"
	)
	
/* 	$.post(
		"${pageContext.request.contextPath}/UserServlet?method=checkUserLogin",
		function(msg){
			console.log("zhouni");
		},
		"json"
	) */
	
	
	$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/UserServlet?method=checkUserLogin",
		   data: "",
		   success: function(msg){
		    	
		     if(msg==1){
		    	 $("#item li").eq(0).children("a").text("欢迎${user.username}");
		    	 $("#item li").eq(0).children("a").attr("href","#");
		     }
		   }
		});
})

</script>