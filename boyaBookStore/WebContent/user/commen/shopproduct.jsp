<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="baseurl" value="${pageContext.request.contextPath}/"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>博雅网上书城</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">

<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<!-- Fonts END -->

<!-- Global styles START -->
<link
	href="${baseurl}assets/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${baseurl}assets/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link
	href="${baseurl}assets/global/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${baseurl}assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css"
	rel="stylesheet">
<link
	href="${baseurl}assets/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css">
<link
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">
<!-- for slider-range -->
<link href="${baseurl}assets/global/plugins/rateit/src/rateit.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="${baseurl}assets/global/css/components.css" rel="stylesheet">
<link href="${baseurl}assets/frontend/layout/css/style.css"
	rel="stylesheet">
<link href="${baseurl}assets/frontend/pages/css/style-shop.css"
	rel="stylesheet" type="text/css">
<link href="${baseurl}assets/frontend/layout/css/style-responsive.css"
	rel="stylesheet">
<link href="${baseurl}assets/frontend/layout/css/themes/red.css"
	rel="stylesheet" id="style-color">
<link href="${baseurl}assets/frontend/layout/css/custom.css"
	rel="stylesheet">
<script type="text/javascript" src="${baseurl }js/form.js"></script>
<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
	<!-- BEGIN STYLE CUSTOMIZER -->
	<!-- BEGIN STYLE CUSTOMIZER -->
	<div class="color-panel hidden-sm">
		<div class="color-mode-icons icon-color"></div>
		<div class="color-mode-icons icon-color-close"></div>
		<div class="color-mode">
			<p>主题颜色</p>
			<ul class="inline">
				<li class="color-red current color-default" data-style="red"></li>
				<li class="color-blue" data-style="blue"></li>
				<li class="color-green" data-style="green"></li>
				<li class="color-orange" data-style="orange"></li>
				<li class="color-gray" data-style="gray"></li>
				<li class="color-turquoise" data-style="turquoise"></li>
			</ul>
		</div>
	</div>
	<!-- END BEGIN STYLE CUSTOMIZER -->

	<!-- BEGIN TOP BAR -->
	<div class="pre-header">
		<div class="container">
			<div class="row">
				<!-- BEGIN TOP BAR LEFT PART -->
				<div class="col-md-6 col-sm-6 additional-shop-info">
					<ul class="list-unstyled list-inline">
						<li><i class="fa fa-phone"></i><span>+15671621723</span></li>
						<!-- BEGIN CURRENCIES -->
						<li class="shop-currencies"><a href="javascript:void(0);">€</a>
							<a href="javascript:void(0);">$</a> <a href="javascript:void(0);"
							class="current">￥</a></li>
						<!-- END CURRENCIES -->
						<!-- BEGIN LANGS -->
						<li class="langs-block"><a href="javascript:void(0);"
							class="current">中文 </a>
							<div class="langs-block-others-wrapper">
								<div class="langs-block-others">
									<a href="javascript:void(0);">French</a> <a
										href="javascript:void(0);">Germany</a> <a
										href="javascript:void(0);">English</a>
								</div>
							</div></li>
						<!-- END LANGS -->
					</ul>
				</div>
				<!-- END TOP BAR LEFT PART -->
				<!-- BEGIN TOP BAR MENU -->
				<div class="col-md-6 col-sm-6 additional-nav">
					<ul class="list-unstyled list-inline pull-right">
						<c:choose>
							<c:when test="${empty sessionScope.sessionUser }">
								<li><a name="${baseurl }jsps/user/regist.jsp"
									onclick="loadbook(this.name)"><i class="fa fa-user-plus"></i>注册</a></li>
								<li><a name="${baseurl }jsps/user/login.jsp"
									onclick="loadbook(this.name)"><i class="fa fa-user"></i>登陆</a></li>
							</c:when>
							<c:otherwise>
		                                                                               博雅会员：${sessionScope.sessionUser.loginname }&nbsp;&nbsp;|&nbsp;&nbsp;
		                        <li><a name="${baseurl }myCart.action"
									onclick="loadbook(this.name)"><i
										class="fa fa-shopping-cart"></i>我的购物车</a></li>
								<li><a name="${baseurl }myorders.action"
									onclick="loadbook(this.name)"><i
										class="fa fa-bitbucket-square"></i>我的博雅订单</a></li>
								<li><a
									<a data-toggle='modal' data-target='#mymodal'></i>修改密码</a></li>
								<li><a href="${baseurl }quit.action"><i
										class="fa fa-external-link"></i>退出</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<input type="password"
							class="hidden" name="oldpassword"id="oldpassword" value=${sessionScope.sessionUser.loginpass }>
				<div id="mymodal" class='modal fade'>
					<div class="modal-dialog" style="width: 330px; margin-top: 101px;">
						<div class="modal-content">
							<div class="modal-header"
								style="padding-bottom: 0px; padding-top: 0px;">
								<span class='close' data-dismiss='modal'>x</span>
								<h3 class='text-primary text-center'>密码修改</h3>
								<form id="password_edit" role="form">
									<div class="text-danger" id="password_bak"
										style="height: 20px; width: 320px;"></div>
									<div class="form-group">
										<label for="password"><span
											class="glyphicon glyphicon-lock text-info"></span>原密码: </label> <input
											type="password" id="password" name="password"
											class="form-control">
									</div>
									<div class="text-danger" id="new_password_bak"
										style="height: 20px; width: 320px;"></div>
									<div class="form-group">
										<label for="new_password"><span
											class="glyphicon glyphicon-lock text-info"></span>新密码:</label> <input
											type="password" id="new_password" name="new_password"
											class="form-control">
									</div>
									<div class="text-danger" id="pre_password_bak"
										style="height: 20px; width: 320px;"></div>
									<div class="form-group">
										<label for="pre_password"><span
											class="glyphicon glyphicon-lock text-info"></span>确认密码:</label> <input
											type="password" id="pre_password" name="pre_password"
											class="form-control">
									</div>

								</form>
							</div>
							<div class="modal-footer">
								<button onclick="submit1()" class="btn btn-primary">保存</button>
								<button class="btn blue" data-dismiss='modal'>返回</button>
							</div>
						</div>
					</div>
				</div>
				<!-- END TOP BAR MENU -->
			</div>
		</div>
	</div>
	<!-- END TOP BAR -->

	<!-- BEGIN HEADER -->
	<div class="header">
		<div class="container">
			<a class="site-logo" href="${baseurl }first.action"><img
				src="${baseurl}assets/frontend/layout/img/logos/logo-shop-red.png"
				alt="Metronic Shop UI"></a> <a href="javascript:void(0);"
				class="mobi-toggler"><i class="fa fa-bars"></i></a>

			<c:if test="${not empty sessionScope.sessionUser }">

				

             <div class="top-cart-block">
					<div class="top-cart-info">
						<a href="javascript:void(0);" class="top-cart-info-count">${cartsize }</a> <a href="javascript:void(0);" class="top-cart-info-value">￥${sum }</a>
					</div>
					<i class="fa fa-shopping-cart"></i>

					<div class="top-cart-content-wrapper">
						<div class="top-cart-content">
							<ul class="scroller" style="height: 100%;" id="cartsmall">
							    <c:forEach items="${cartItemList }" var="cartItem">
							        <input value="${cartItem.cartitemid }" type="checkbox" class="hidden" name="checkboxBtn" checked="checked"/>
							       <li id="${cartItem.book.bid }"><a name="<c:url value='/loadbook.action?bid=${cartItem.book.bid }'/>" onclick="loadbook(this.name)"><img
										src="<c:url value='/${cartItem.book.imageB }'/>"
										alt="Rolex Classic Watch" width="37" height="34"></a> <span
									class="cart-content-count">x ${cartItem.quantity }</span> <strong><a
										name="<c:url value='/loadbook.action?bid=${cartItem.book.bid }'/> " onclick="loadbook(this.name)">${cartItem.book.bname }</a></strong> <em>${cartItem.subtotal }￥</em> <a
									 href="<c:url value='/batchaDelete2.action?cartItemIds=${cartItem.cartitemid }'/>" name="${cartItem.book.bid }" class="del-goods">&nbsp;</a>
								   </li>	
							    
							    
							    </c:forEach>
								
							</ul>
							<div class="text-right">
								<a name="<c:url value='/myCart.action'/>" onclick="loadbook(this.name)" class="btn btn blue">购物车</a> <a href="javascript:jiesuan();" class="btn btn-primary">去结算</a>
							</div>
							<form id="jieSuanForm" action="<c:url value='/loadCardItems.action'/>" method="post">
		                        <input class="hidden" name="cartItemIds" id="cartItemIds"/>
		                        <input class="hidden" id="total" value="${sum }"/>
	                       </form>
						</div>
					</div>
				</div>
			</c:if>


			<!-- BEGIN NAVIGATION -->
			<div class="header-navigation">
				<ul>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							电子图书 </a> <!-- BEGIN DROPDOWN MENU -->
						<ul class="dropdown-menu">
							<li class="dropdown-submenu"><a
								href="shop-product-list.html">古典小说<i
									class="fa fa-angle-right"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="shop-product-list.html">世界名著</a></li>
									<li><a href="shop-product-list.html">名人传记</a></li>
									<li class="dropdown-submenu"><a class="dropdown-toggle"
										data-toggle="dropdown" data-target="#" href="javascript:;">
											专家学者 <i class="fa fa-angle-right"></i>
									</a>
										<ul class="dropdown-menu">
											<li><a href="shop-product-list.html">文学家</a></li>
											<li><a href="shop-product-list.html">科学家</a></li>
											<li><a href="shop-product-list.html">艺术家</a></li>
										</ul></li>
								</ul></li>
							<li><a href="shop-product-list.html">政治人物</a></li>
							<li><a href="shop-product-list.html">军事人物</a></li>
						</ul> <!-- END DROPDOWN MENU --></li>
					<li class="dropdown dropdown-megamenu"><a
						class="dropdown-toggle" data-toggle="dropdown" data-target="#"
						href="javascript:;"> 少儿图书 </a>
						<ul class="dropdown-menu">
							<li>
								<div class="header-navigation-content">
									<div class="row">
										<div class="col-md-4 header-navigation-col">
											<h4>幼儿启蒙</h4>
											<ul>
												<li><a href="shop-product-list.html">幼儿认知</a></li>
												<li><a href="shop-product-list.html">识字说话</a></li>
												<li><a href="shop-product-list.html">智力启蒙</a></li>
												<li><a href="shop-product-list.html">少儿国学</a></li>
											</ul>
										</div>
										<div class="col-md-4 header-navigation-col">
											<h4>科普百科</h4>
											<ul>
												<li><a href="shop-product-list.html">百科全书</a></li>
												<li><a href="shop-product-list.html">动物|植物</a></li>
												<li><a href="shop-product-list.html">天文|地理</a></li>
												<li><a href="shop-product-list.html">历史|文化</a></li>
												<li><a href="shop-product-list.html">数理化|科技</a></li>
											</ul>
										</div>
										<div class="col-md-4 header-navigation-col">
											<h4>兴趣|爱好|特长</h4>
											<ul>
												<li><a href="shop-product-list.html">音乐舞蹈</a></li>
												<li><a href="shop-product-list.html">绘画书法</a></li>
												<li><a href="shop-product-list.html">特长</a></li>
											</ul>

											<h4>卡通游乐园</h4>
											<ul>
												<li><a href="shop-product-list.html">中国传统经典</a></li>
												<li><a href="shop-product-list.html">梦幻迪斯尼</a></li>
												<li><a href="shop-product-list.html">甜美小公主</a></li>
											</ul>
										</div>

									</div>
								</div>
							</li>
						</ul></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown"
						data-target="#" href="javascript:;">社会科学</a>
						<ul class="dropdown-menu">


							<li><a href="shop-product-list.html">社会学</a></li>
							<li><a href="shop-product-list.html">语言文学</a></li>
							<li><a href="shop-product-list.html">文化</a></li>
							<li><a href="shop-product-list.html">教育</a></li>

						</ul></li>
					<li class="dropdown dropdown100 nav-catalogue"><a
						class="dropdown-toggle" data-toggle="dropdown" data-target="#"
						href="javascript:;"> 新书上架 </a>
						<ul class="dropdown-menu">
							<li>
								<div class="header-navigation-content">
									<div class="row">
										<div class="col-md-3 col-sm-4 col-xs-6">
											<div class="product-item">
												<div class="pi-img-wrapper">
													<a href="shop-item.html"><img
														src="${baseurl}assets/frontend/pages/img/products/model4.jpg"
														class="img-responsive" alt="人名的名义"></a>
												</div>
												<h3>
													<a href="shop-item.html">人名的名义</a>
												</h3>
												<div class="pi-price">￥29.00</div>
												<a href="javascript:;" class="btn btn-default add2cart">添加到购物车</a>
											</div>
										</div>
										<div class="col-md-3 col-sm-4 col-xs-6">
											<div class="product-item">
												<div class="pi-img-wrapper">
													<a href="shop-item.html"><img
														src="${baseurl}assets/frontend/pages/img/products/model3.jpg"
														class="img-responsive" alt="人名的名义"></a>
												</div>
												<h3>
													<a href="shop-item.html">人名的名义</a>
												</h3>
												<div class="pi-price">￥29.00</div>
												<a href="javascript:;" class="btn btn-default add2cart">添加到购物车</a>
											</div>
										</div>
										<div class="col-md-3 col-sm-4 col-xs-6">
											<div class="product-item">
												<div class="pi-img-wrapper">
													<a href="shop-item.html"><img
														src="${baseurl}assets/frontend/pages/img/products/model7.jpg"
														class="img-responsive" alt="人名的名义"></a>
												</div>
												<h3>
													<a href="shop-item.html">人名的名义</a>
												</h3>
												<div class="pi-price">￥29.00</div>
												<a href="javascript:;" class="btn btn-default add2cart">添加到购物车</a>
											</div>
										</div>
										<div class="col-md-3 col-sm-4 col-xs-6">
											<div class="product-item">
												<div class="pi-img-wrapper">
													<a href="shop-item.html"><img
														src="${baseurl}assets/frontend/pages/img/products/model4.jpg"
														class="img-responsive" alt="人名的名义"></a>
												</div>
												<h3>
													<a href="shop-item.html">人名的名义</a>
												</h3>
												<div class="pi-price">￥29.00</div>
												<a href="javascript:;" class="btn btn-default add2cart">添加到购物车</a>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							计算机与互联网 </a>

						<ul class="dropdown-menu">
							<li class="active"><a href="shop-index.html"></a></li>
							<li><a href="shop-index-header-fix.html">程序语言与软件开发</a></li>
							<li><a href="shop-index-light-footer.html">图像图像多媒体</a></li>
							<li><a href="shop-product-list.html">操作系统|系统开发</a></li>
							<li><a href="shop-search-result.html">办公与计算机</a></li>
						</ul></li>
					<li><a href="onepage-index.html" target="_blank">关于博雅书城</a></li>
					<!-- BEGIN TOP SEARCH -->
					<li class="menu-search"><span class="sep"></span> <i
						class="fa fa-search search-btn"></i>
						<div class="search-box">
							<form action="#">
								<div class="input-group">
									<input type="text" placeholder="书籍名称" id="bname" name="bname"
										class="form-control"> 
										<span class="input-group-btn">
										<button class="btn btn-primary" type="button"
											name="<c:url value='/findByname.action'/>"
											onclick="serach2(this.name)">搜索</button>
									</span>
								</div>
							</form>
						</div></li>
					<!-- END TOP SEARCH -->
				</ul>
			</div>
			<!-- END NAVIGATION -->
		</div>
	</div>
	<!-- Header END -->

	<div class="title-wrapper">
		<div class="container">
			<div class="container-inner">
				<h1>
					<span>博雅书城</span> 竭诚为您服务
				</h1>
				<em>这里，没有您买不到的书籍</em>
			</div>
		</div>
	</div>

	<div class="main">
		<div class="container">
			<!-- <ul class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li><a href="">Store</a></li>
				<li class="active">Men category</li>
			</ul> -->
			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40">
				<!-- BEGIN SIDEBAR -->
				<div class="sidebar col-md-3 col-sm-5">
					<ul class="list-group margin-bottom-25 sidebar-menu">
						<c:forEach items="${parents2}" var="parent">
							<li class="list-group-item clearfix dropdown"><a><i
									class="fa fa-angle-right"></i>${parent.cname}</a> <c:set
									var="begin" value="${parent.cid}" />
								<ul class="dropdown-menu"
									<c:if test="${pid eq begin}"> style="display:block;"</c:if>>
									<c:forEach items="${parent.children}" var="child">

										<li><a onclick="loadbook(this.name)"
											name="/boyaBookStore/findByCategoryBook.action?cid=${child.cid}"
											target="main2"><i class="fa fa-angle-right"></i>${child.cname}</a></li>
									</c:forEach>
								</ul></li>
						</c:forEach>

					</ul>

					<div class="sidebar-filter margin-bottom-25">
						<h2>筛选</h2>
						<h3>全部类目</h3>
						<div class="checkbox-list">
							<label><input type="checkbox">价格优先 </label> <label><input
								type="checkbox">评分有先</label>
						</div>

						<h3>价格</h3>
						<p>
							<label for="amount">范围:</label> <input type="text" id="amount"
								style="border: 0; color: #f6931f; font-weight: bold;">
						</p>
						<div id="slider-range"></div>
					</div>

					<div class="sidebar-products clearfix">
						<h2>热销产品</h2>
						<div class="item">
							<a href="shop-item.html"><img
								src="${baseurl}assets/frontend/pages/img/products/k1.jpg"
								alt="Some Shoes in Animal with Cut Out"></a>
							<h3>
								<a href="shop-item.html">打折特价书籍</a>
							</h3>
							<div class="price">￥31.00</div>
						</div>
						<div class="item">
							<a href="shop-item.html"><img
								src="${baseurl}assets/frontend/pages/img/products/k4.jpg"
								alt="Some Shoes in Animal with Cut Out"></a>
							<h3>
								<a href="shop-item.html">打折特价书籍</a>
							</h3>
							<div class="price">￥31.00</div>
						</div>
						<div class="item">
							<a href="shop-item.html"><img
								src="${baseurl}assets/frontend/pages/img/products/k3.jpg"
								alt="Some Shoes in Animal with Cut Out"></a>
							<h3>
								<a href="shop-item.html">打折特价书籍</a>
							</h3>
							<div class="price">￥31.00</div>
						</div>
					</div>
				</div>
				<!-- END SIDEBAR -->
				<!-- BEGIN CONTENT -->
				<div class="col-md-9 col-sm-7">
					<div class="row center-block" style="margin-bottom:13px;margin-left: 81px;">

						<div class="col-md-6">
							<form action="<c:url value='/findByname.action'/>" method="get" target="main2" id="form1">
								<div class="input-group">
									<input type="text" placeholder="书籍名称"  name="bname" id="bname2"class="form-control">
									<span class="input-group-btn">
										<button class="btn btn-primary" type="submit">搜索</button>
									</span>
								</div>
							</form>
						</div>
						<div class="col-md-6">
							<h1>
								<button class="btn blue" >高级搜索</button>
							</h1>
						</div>
					</div>
					<!-- BEGIN PRODUCT LIST -->
					<iframe frameborder="0"
						src="<c:url value='/findByCategoryBook.action?cid=${cid }'/>"
						width="100%" scrolling="no" hight="100%" width="847.5px"
						hight="1026px" onLoad="iFrameHeight()" id="iframepage"
						name="main2"> </iframe>

					<script type="text/javascript" language="javascript">
						function iFrameHeight() {

							var ifm = document.getElementById("iframepage");

							var subWeb = document.frames ? document.frames["iframepage"].document
									: ifm.contentDocument;

							if (ifm != null && subWeb != null) {

								ifm.height = subWeb.body.scrollHeight;

							}

						}
					</script>
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END SIDEBAR & CONTENT -->
		</div>
	</div>

	<!-- BEGIN BRANDS -->
	<div class="brands">
		<div class="container">
			<div class="owl-carousel owl-carousel6-brands">
				<a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/canon.jpg"
					alt="canon" title="canon"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/esprit.jpg"
					alt="esprit" title="esprit"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/gap.jpg" alt="gap"
					title="gap"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/next.jpg"
					alt="next" title="next"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/puma.jpg"
					alt="puma" title="puma"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/zara.jpg"
					alt="zara" title="zara"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/canon.jpg"
					alt="canon" title="canon"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/esprit.jpg"
					alt="esprit" title="esprit"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/gap.jpg" alt="gap"
					title="gap"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/next.jpg"
					alt="next" title="next"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/puma.jpg"
					alt="puma" title="puma"></a> <a href="shop-product-list.html"><img
					src="${baseurl}assets/frontend/pages/img/brands/zara.jpg"
					alt="zara" title="zara"></a>
			</div>
		</div>
	</div>
	<!-- END BRANDS -->

	<!-- BEGIN STEPS -->
	<!-- BEGIN STEPS -->
	<div class="steps-block steps-block-red">
		<div class="container">
			<div class="row">
				<div class="col-md-4 steps-block-col">
					<i class="fa fa-truck"></i>
					<div>
						<h2>方便快捷</h2>
						<em> </em>
					</div>
					<span>&nbsp;</span>
				</div>
				<div class="col-md-4 steps-block-col">
					<i class="fa fa-gift"></i>
					<div>
						<h2>服务周到</h2>
						<em> </em>
					</div>
					<span>&nbsp;</span>
				</div>
				<div class="col-md-4 steps-block-col">
					<i class="fa fa-phone"></i>
					<div>
						<h2>477 505 8877</h2>
						<em>24小时在线</em>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END STEPS -->

	<!-- BEGIN PRE-FOOTER -->
	<div class="pre-footer">
		<div class="container">
			<div class="row">

				<!-- END BOTTOM ABOUT BLOCK -->
				<!-- BEGIN BOTTOM INFO BLOCK -->
				<div class="col-md-3 col-sm-6 pre-footer-col">
					<h2>购物指南</h2>
					<ul class="list-unstyled">
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">购物流程</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">发票制度</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">账户管理</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">会员优惠</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-6 pre-footer-col">
					<h2>支付方式</h2>
					<ul class="list-unstyled">
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">在线支付</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">微信支付</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">银联支付</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">支付宝支付</a></li>
					</ul>
				</div>
				<!-- END INFO BLOCK -->

				<div class="col-md-3 col-sm-6 pre-footer-col">
					<h2>配送方式</h2>
					<ul class="list-unstyled">
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">配送范围及免邮标准</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">当日递/次日达</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">订单自提</a></li>
						<li><i class="fa fa-angle-right"></i> <a href="javascript:;">验货与签收</a></li>
					</ul>
				</div>
				<!-- END TWITTER BLOCK -->

				<!-- BEGIN BOTTOM CONTACTS -->
				<div class="col-md-3 col-sm-6 pre-footer-col">
					<h2>联系方式</h2>
					<address class="margin-bottom-40">
						湖北省武汉青山区和平大道947号<br> 电话: 300 323 3456<br> 传真: 300 323
						1456<br> 邮箱: <a href="mailto:info@metronic.com">hanyajun@sf-express.com</a><br>
					</address>
				</div>
				<!-- END BOTTOM CONTACTS -->
			</div>
			<hr>

		</div>
	</div>
	<!-- END PRE-FOOTER -->

	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<!-- BEGIN COPYRIGHT -->
				<div class="col-md-6 col-sm-6 padding-top-10">2017 ©
					武汉科技大学韩亚军. ALL Rights Reserved.</div>
				<!-- END COPYRIGHT -->
				<!-- BEGIN PAYMENTS -->
				<div class="col-md-6 col-sm-6">
					<ul class="list-unstyled list-inline pull-right">
						<li><img
							src="${baseurl}assets/frontend/layout/img/payments/western-union.jpg"
							alt="We accept Western Union" title="We accept Western Union"></li>
						<li><img
							src="${baseurl}assets/frontend/layout/img/payments/american-express.jpg"
							alt="We accept American Express"
							title="We accept American Express"></li>
						<li><img
							src="${baseurl}assets/frontend/layout/img/payments/MasterCard.jpg"
							alt="We accept MasterCard" title="We accept MasterCard"></li>
						<li><img
							src="${baseurl}assets/frontend/layout/img/payments/PayPal.jpg"
							alt="We accept PayPal" title="We accept PayPal"></li>
						<li><img
							src="${baseurl}assets/frontend/layout/img/payments/visa.jpg"
							alt="We accept Visa" title="We accept Visa"></li>
					</ul>
				</div>
				<!-- END PAYMENTS -->
			</div>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN fast view of a product -->
	<div id="product-pop-up" style="display: none; width: 700px;">
		<div class="product-page product-pop-up">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-3">
					<div class="product-main-image">
						<img src="${baseurl}assets/frontend/pages/img/products/model7.jpg"
							alt="Cool green dress with red bell" class="img-responsive">
					</div>
					<div class="product-other-images">
						<a href="javascript:;" class="active"><img
							alt="Berry Lace Dress"
							src="${baseurl}assets/frontend/pages/img/products/model3.jpg"></a>
						<a href="javascript:;"><img alt="Berry Lace Dress"
							src="${baseurl}assets/frontend/pages/img/products/model4.jpg"></a>
						<a href="javascript:;"><img alt="Berry Lace Dress"
							src="${baseurl}assets/frontend/pages/img/products/model5.jpg"></a>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-9">
					<h1>Cool green dress with red bell</h1>
					<div class="price-availability-block clearfix">
						<div class="price">
							<strong><span>$</span>47.00</strong> <em>$<span>62.00</span></em>
						</div>
						<div class="availability">
							Availability: <strong>In Stock</strong>
						</div>
					</div>
					<div class="description">
						<p>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed
							nonumy nibh sed euismod laoreet dolore magna aliquarm erat
							volutpat Nostrud duis molestie at dolore.</p>
					</div>
					<div class="product-page-options">
						<div class="pull-left">
							<label class="control-label">Size:</label> <select
								class="form-control input-sm">
								<option>L</option>
								<option>M</option>
								<option>XL</option>
							</select>
						</div>
						<div class="pull-left">
							<label class="control-label">Color:</label> <select
								class="form-control input-sm">
								<option>Red</option>
								<option>Blue</option>
								<option>Black</option>
							</select>
						</div>
					</div>
					<div class="product-page-cart">
						<div class="product-quantity">
							<input id="product-quantity" type="text" value="1" readonly
								name="product-quantity" class="form-control input-sm">
						</div>
						<button class="btn btn-primary" type="submit">Add to cart</button>
						<a href="shop-item.html" class="btn btn-default">More details</a>
					</div>
				</div>

				<div class="sticker sticker-sale"></div>
			</div>
		</div>
	</div>
	<!-- END fast view of a product -->

	<!-- Load javascripts at bottom, this will reduce page load time -->
	<!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
	<!--[if lt IE 9]>
    <script src="${baseurl}assets/global/plugins/respond.min.js"></script>  
    <![endif]-->
	<script src="${baseurl}assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script src="${baseurl}assets/global/plugins/jquery-migrate.min.js"
		type="text/javascript"></script>
	<script
		src="${baseurl}assets/global/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="${baseurl}assets/frontend/layout/scripts/back-to-top.js"
		type="text/javascript"></script>
	<script
		src="${baseurl}assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script
		src="${baseurl}assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<!-- pop up -->
	<script
		src="${baseurl}assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>
	<!-- slider for products -->
	<script src='${baseurl}assets/global/plugins/zoom/jquery.zoom.min.js'
		type="text/javascript"></script>
	<!-- product zoom -->
	<script
		src="${baseurl}assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js"
		type="text/javascript"></script>
	<!-- Quantity -->
	<script
		src="${baseurl}assets/global/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script
		src="${baseurl}assets/global/plugins/rateit/src/jquery.rateit.js"
		type="text/javascript"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"
		type="text/javascript"></script>
	<!-- for slider-range -->

	<script src="${baseurl}assets/frontend/layout/scripts/layout.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="${baseurl}js/artDialog/jquery.artDialog.js?skin=twitter"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			Layout.init();
			Layout.initOWL();
			Layout.initTwitter();
			Layout.initImageZoom();
			Layout.initTouchspin();
			Layout.initUniform();
			Layout.initSliderRange();
		});
		function loadbook(url) {
			$("#iframepage").attr("src", url);
		}
		function submit1() {
			var h = checkForm();
			if (h) {
				var value=$("#pre_password").val();
				$("#oldpassword").val(value);
				$.ajax({
					type:"POST",
					dataType:"json",
					data:{password:value},
					url:"/boyaBookStore/editpassword.action",
					success:function(data){
						$("#password_edit")[0].reset();
						$('#mymodal').modal("hide");
						var d = art.dialog({
							content: '修改密码成功'
						});
						d.show();
						setTimeout(function () {
							d.close().remove();
						}, 2000);
					}
				});
			
			}else{
				return false;
			}
		}
		function checkForm() {
			//1.判断相应的input表单是否为空
			var new_password = formIsNull("new_password", "new_password_bak", "新密码不能为空");
			var Pwd = formIsNull('password', 'password_bak', "旧密码不能为空");
			var pre_password = formIsNull('pre_password', 'pre_password_bak', "确认密码不能为空");
			if (new_password && Pwd && pre_password) {
				var eual=isEqual("new_password","pre_password","pre_password_bak","两次输入的密码不一致");
				if(eual){
					return true;
				}
				else{
					
					return false;
				}

			}
		}
		
		$("#new_password").blur(function() {
			var new_password = formIsNull("new_password", "new_password_bak", "新密码不能为空");
		});
		$("#password").blur(function() {
			var Uname = formIsNull("password", "password_bak", "密码不能为空");
			var eual=isEqual("oldpassword","password","password_bak","输入旧密码错误！");
		});
		$("#pre_password").blur(function() {
			var pre_password = formIsNull('pre_password', 'pre_password_bak', "确认密码不能为空");
			if(pre_password){
				var eual=isEqual("new_password","pre_password","pre_password_bak","两次输入的密码不一致");
			}
			
		});
		function jiesuan() {
			// 1. 获取所有被选择的条目的id，放到数组中
			var cartItemIdArray = new Array();
			 $("input[type=checkbox]").each(function() {
				cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
			});	
			// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
			var cartItemIds=cartItemIdArray.toString();
			var total=$("#total").val();
			//var url2="/boyaBookStore/loadCardItems.action?total="+total;
			url="/boyaBookStore/loadCardItems.action?total="+total+"&cartItemIds="+cartItemIds;
			loadbook(url);
		}
		function serach2(name) {
			var bname= $("#bname2").val();
			var url2 = name + "?bname=" + bname;
			loadbook(url2);
		}
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>