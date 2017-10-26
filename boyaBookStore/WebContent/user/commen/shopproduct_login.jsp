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
									<a data-toggle='modal' data-target='#mymodal'><i class="fa fa-edit"></i>修改密码</a></li>
								<li><a href="${baseurl }quit.action"><i
										class="fa fa-external-link"></i>退出</a></li>
							</c:otherwise>
						</c:choose>
					</ul>

				</div>
				<input type="password" class="hidden" name="oldpassword"
					id="oldpassword" value=${sessionScope.sessionUser.loginpass }>
				<div id="mymodal" class='modal fade'>
					<div class="modal-dialog" style="width: 330px; margin-top: 101px;">
						<div class="modal-content">
							<div class="modal-header"
								style="padding-bottom: 0px; padding-top: 15px;">
								<span class='close' data-dismiss='modal'>x</span>
								<h2 class='text-primary text-center'>
									<strong>修改密码</strong>
								</h2>
								<form id="password_edit" role="form">
									<div class="text-danger" id="password_bak"
										style="height: 20px; width: 320px;"></div>
									<div class="form-group">
										<label for="password" class="text-primary"><span
											class="glyphicon glyphicon-lock text-info"></span>原密码: </label> <input
											type="password" id="password" name="password"
											class="form-control">
									</div>
									<div class="text-danger" id="new_password_bak"
										style="height: 20px; width: 320px;"></div>
									<div class="form-group">
										<label for="new_password" class="text-primary"><span
											class="glyphicon glyphicon-lock text-info"></span>新密码:</label> <input
											type="password" id="new_password" name="new_password"
											class="form-control">
									</div>
									<div class="text-danger" id="pre_password_bak"
										style="height: 20px; width: 320px;"></div>
									<div class="form-group">
										<label for="pre_password" class="text-primary"><span
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
						<a href="javascript:void(0);" class="top-cart-info-count">${cartsize }</a>
						<a href="javascript:void(0);" class="top-cart-info-value">￥${sum }</a>
					</div>
					<i class="fa fa-shopping-cart"></i>

					<div class="top-cart-content-wrapper">
						<div class="top-cart-content">
							<ul class="scroller" style="height: 100%;" id="cartsmall">
								<c:forEach items="${cartItemList }" var="cartItem">
									<input value="${cartItem.cartitemid }" type="checkbox"
										class="hidden" name="checkboxBtn" checked="checked" />
									<li id="${cartItem.book.bid }"><a
										href="${baseurl }loginfirst.action?url2=<c:url value='/loadbook.action?bid=${cartItem.book.bid }'/>"><img
											src="<c:url value='/${cartItem.book.imageB }'/>"
											alt="Rolex Classic Watch" width="37" height="34"></a> <span
										class="cart-content-count">x ${cartItem.quantity }</span> <strong><a
											href="${baseurl }loginfirst.action?url2=<c:url value='/loadbook.action?bid=${cartItem.book.bid }'/>">${cartItem.book.bname }</a></strong>
										<em>${cartItem.subtotal }￥</em> <a
										href="<c:url value='/batchaDelete2.action?cartItemIds=${cartItem.cartitemid }'/>"
										name="${cartItem.book.bid }" class="del-goods">&nbsp;</a></li>


								</c:forEach>

							</ul>
							<div class="text-right">
								<a
									href="<c:url value='/loginfirst.action'/>?url2=<c:url value='/myCart.action'/>"
									class="btn btn blue">购物车</a> <a href="javascript:jiesuan();"
									class="btn btn-primary">去结算</a>
							</div>
							<form id="jieSuanForm"
								action="<c:url value='/loadCardItems.action'/>" method="post">
								<input class="hidden" name="cartItemIds" id="cartItemIds" /> <input
									class="hidden" id="total" value="${sum }" />
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
								name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">古典小说<i
									class="fa fa-angle-right"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a name="<c:url value='/findByname.action'/>"
										onclick="serach2(this.name)">世界名著</a></li>
									<li><a name="<c:url value='/findByname.action'/>"
										onclick="serach2(this.name)">名人传记</a></li>
									<li class="dropdown-submenu"><a class="dropdown-toggle"
										data-toggle="dropdown" data-target="#" href="javascript:;">
											专家学者 <i class="fa fa-angle-right"></i>
									</a>
										<ul class="dropdown-menu">
											<li><a name="<c:url value='/findByname.action'/>"
												onclick="serach2(this.name)">文学家</a></li>
											<li><a name="<c:url value='/findByname.action'/>"
												onclick="serach2(this.name)">科学家</a></li>
											<li><a name="<c:url value='/findByname.action'/>"
												onclick="serach2(this.name)">艺术家</a></li>
										</ul></li>
								</ul></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">政治人物</a></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">军事人物</a></li>
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
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">幼儿认知</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">识字说话</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">智力启蒙</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">少儿国学</a></li>
											</ul>
										</div>
										<div class="col-md-4 header-navigation-col">
											<h4>科普百科</h4>
											<ul>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">百科全书</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">动物|植物</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">天文|地理</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">历史|文化</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">数理化|科技</a></li>
											</ul>
										</div>
										<div class="col-md-4 header-navigation-col">
											<h4>兴趣|爱好|特长</h4>
											<ul>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">音乐舞蹈</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">绘画书法</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">特长</a></li>
											</ul>

											<h4>卡通游乐园</h4>
											<ul>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">中国传统经典</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">梦幻迪斯尼</a></li>
												<li><a name="<c:url value='/findByname.action'/>"
													onclick="serach2(this.name)">甜美小公主</a></li>
											</ul>
										</div>

									</div>
								</div>
							</li>
						</ul></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown"
						data-target="#" href="javascript:;">社会科学</a>
						<ul class="dropdown-menu">


							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">社会学</a></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">语言文学</a></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">文化</a></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">教育</a></li>

						</ul></li>
					<li class="dropdown dropdown100 nav-catalogue"><a
						class="dropdown-toggle" data-toggle="dropdown" data-target="#"
						href="javascript:;"> 新书上架 </a>
						<ul class="dropdown-menu">
							<li>
								<div class="header-navigation-content">
									<div class="row">
										<c:forEach items="${cheapBook }" var="book">

											<div class="col-md-3 col-sm-4 col-xs-6">
												<div class="product-item">
													<div class="pi-img-wrapper">
														<a
															name="<c:url value='/loadbook.action?bid=${book.bid }'/>"
															onclick="loadbook(this.name)"><img
															src="<c:url value='/${book.imageW}'/>"
															class="img-responsive" alt="${book.bname }"></a>
													</div>
													<h3>
														<a
															name="<c:url value='/loadbook.action?bid=${book.bid }'/>"
															onclick="loadbook(this.name)">${book.bname }</a>
													</h3>
													<div class="pi-price">￥${book.currprice }</div>
													<form action="<c:url value='/first2add.action'/>"
														method="post">
														<input class="hidden" id="product-quantity" type="text"
															value="1" name="quantity"> <input type="hidden"
															name="bid" value="${book.bid }" />
														<button class="btn btn-default add2cart" type="submit">加入购物车</button>
													</form>
												</div>
											</div>




										</c:forEach>



									</div>
								</div>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" data-target="#" href="javascript:;">
							计算机与互联网 </a>

						<ul class="dropdown-menu">
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">程序语言与软件开发</a></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">图像图像多媒体</a></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">操作系统|系统开发</a></li>
							<li><a name="<c:url value='/findByname.action'/>"
								onclick="serach2(this.name)">办公与计算机</a></li>
						</ul></li>
					<li><a name="<c:url value='/user/commen/shop_about.jsp'/>" onclick="serach2(this.name)">关于博雅书城</a></li>
					<!-- BEGIN TOP SEARCH -->
					<li class="menu-search"><span class="sep"></span> <i
						class="fa fa-search search-btn"></i>
						<div class="search-box">
							<form action="#">
								<div class="input-group">
									<input type="text" placeholder="书籍名称" id="bname2" name="bname"
										class="form-control"> <span class="input-group-btn">
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
						<h2>特价产品</h2>
						<c:forEach items="${cheapBook }" var="book">

							<div class="item">
								<a name="<c:url value='/loadbook.action?bid=${book.bid }'/>"
									onclick="loadbook(this.name)"><img
									src="<c:url value='/${book.imageB }'/>" alt="${book.bname }"></a>
								<h3>
									<a onclick="loadbook(this.name)"
										name="<c:url value='/loadbook.action?bid=${book.bid }'/>">${book.bname }</a>
								</h3>
								<div class="price">￥${book.currprice }</div>
							</div>

						</c:forEach>

					</div>
				</div>
				<!-- END SIDEBAR -->
				<!-- BEGIN CONTENT -->
				<div class="col-md-9 col-sm-7">
					<div class="row center-block"
						style="margin-bottom: 13px; margin-left: 81px;">

						<div class="col-md-6">
							<form action="<c:url value='/findByname.action'/>" method="get"
								target="main2" id="form1">
								<div class="input-group">
									<input type="text" placeholder="书籍名称" name="bname"
										class="form-control"> <span class="input-group-btn">
										<button class="btn btn-primary" type="submit">搜索</button>
									</span>
								</div>
							</form>
						</div>
						<div class="col-md-6">
							<h1>
								<button data-toggle='modal' data-target='#addModal'
									class="btn blue">高级搜索</button>
							</h1>
							<div id="addModal" class='modal fade'>
								<div class="modal-dialog">
									<div class="modal-content"
										style="padding-bottom: 0px; padding-top: 13px; padding-left: 0px; border-right-width: 0px; margin-top: 0px; top: 49px;">
										<div class="modal-header"
											style="padding-bottom: 0px; padding-top: 0px;">
											<span class='close' data-dismiss='modal'>x</span>
											<h2 class='text-primary text-center'>
												<strong>高级组合查询</strong>
											</h2>
											<form action="<c:url value='/findBycombination.action'/>"
												method="get" class="form-horizontal" role="form">
												<div class="form-group">
													<label for="classtype"
														class="control-label col-md-3 text-primary">书籍名称&nbsp<i
														class="fa fa-book ">:</i></label>
													<div class="col-md-5">
														<input type="text" class="form-control" name="bname"
															id="bname3">
													</div>
												</div>
												<div class="form-group">
													<label for="classtype"
														class="control-label col-md-3 text-primary">书籍作者&nbsp<i
														class="fa fa-user">:</i></label>
													<div class="col-md-5">
														<input type="text" class="form-control" id="author3"
															name="author">
													</div>
												</div>
												<div class="form-group">
													<label for="classtype"
														class="control-label col-md-3 text-primary">出版社&nbsp<i
														class="fa fa-bank ">:</i></label>
													<div class="col-md-5">
														<input type="text" class="form-control" id="press3"
															name="press">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer"
											style="padding-top: 5px; margin-top: 0px;">
											<button onclick="serach4(this.name)"
												name="<c:url value='/findBycombination.action'/>"
												type="button" class="btn btn-primary">查询</button>
											<button class="btn btn blue" data-dismiss='modal'>返回</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<input class="hidden" id="error" value="${msg }"> <input
					class="hidden" id="loginname" value="${user.loginname}"> <input
					class="hidden" id="loginpass" value="${user.loginpass}">
				<!-- BEGIN PRODUCT LIST -->
				<c:choose>
					<c:when test="${cart eq 'cart'}">

						<iframe frameborder="0" src="${url2 }" hight="100%"
							width="847.5px" hight="1026px" onLoad="iFrameHeight()"
							id="iframepage" name="main2" scrolling="no"> </iframe>
					</c:when>

					<c:otherwise>
						<iframe frameborder="0" src="/boyaBookStore/myCart.action"
							hight="100%" width="100%" scrolling="no" onLoad="iFrameHeight()"
							id="iframepage" name="main2"> </iframe>
					</c:otherwise>
				</c:choose>

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
				<a name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/canon.jpg"
					alt="canon" title="canon"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/esprit.jpg"
					alt="esprit" title="esprit"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/gap.jpg" alt="gap"
					title="gap"></a> <a name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/next.jpg"
					alt="next" title="next"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/puma.jpg"
					alt="puma" title="puma"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/zara.jpg"
					alt="zara" title="zara"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/canon.jpg"
					alt="canon" title="canon"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/esprit.jpg"
					alt="esprit" title="esprit"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/gap.jpg" alt="gap"
					title="gap"></a> <a name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/next.jpg"
					alt="next" title="next"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
					src="${baseurl}assets/frontend/pages/img/brands/puma.jpg"
					alt="puma" title="puma"></a> <a
					name="<c:url value='/findByname.action'/>"
					onclick="serach2(this.name)"><img
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
	<script type="text/javascript"
		src="${baseurl}js/artDialog/jquery.artDialog.js?skin=twitter"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			Layout.init();
			Layout.initOWL();
			Layout.initTwitter();
			Layout.initImageZoom();
			Layout.initTouchspin();
			Layout.initUniform();
			Layout.initSliderRange();
			var msg = $("#error").val();
			if (msg) {
				var d = art.dialog({
					content : msg
				});
				d.show();
				setTimeout(function() {
					d.close().remove();
				}, 2000);
				$("#error").val("");

			}
		});
		function loadbook(url) {
			$("#iframepage").attr("src", url);
		}
		function submit1() {
			var h = checkForm();
			if (h) {
				var value = $("#pre_password").val();
				$("#oldpassword").val(value);
				$.ajax({
					type : "POST",
					dataType : "json",
					data : {
						password : value
					},
					url : "/boyaBookStore/editpassword.action",
					success : function(data) {
						$("#password_edit")[0].reset();
						$('#mymodal').modal("hide");
						var d = art.dialog({
							content : '修改密码成功'
						});
						d.show();
						setTimeout(function() {
							d.close().remove();
						}, 2000);
					}
				});

			} else {
				return false;
			}
		}
		function checkForm() {
			//1.判断相应的input表单是否为空
			var new_password = formIsNull("new_password", "new_password_bak",
					"新密码不能为空");
			var Pwd = formIsNull('password', 'password_bak', "旧密码不能为空");
			var pre_password = formIsNull('pre_password', 'pre_password_bak',
					"确认密码不能为空");
			if (new_password && Pwd && pre_password) {
				var eual = isEqual("new_password", "pre_password",
						"pre_password_bak", "两次输入的密码不一致");
				if (eual) {
					return true;
				} else {

					return false;
				}

			}
		}

		$("#new_password").blur(
				function() {
					var new_password = formIsNull("new_password",
							"new_password_bak", "新密码不能为空");
				});
		$("#password")
				.blur(
						function() {
							var Uname = formIsNull("password", "password_bak",
									"密码不能为空");
							var eual = isEqual("oldpassword", "password",
									"password_bak", "输入旧密码错误！");
						});
		$("#pre_password").blur(
				function() {
					var pre_password = formIsNull('pre_password',
							'pre_password_bak', "确认密码不能为空");
					if (pre_password) {
						var eual = isEqual("new_password", "pre_password",
								"pre_password_bak", "两次输入的密码不一致");
					}

				});

		function serach2(name) {
			var bname = $("#bname2").val();
			var url2 = name + "?bname=" + bname;
			loadbook(url2);
		}
		function serach4(name) {
			var bname3 = $("#bname3").val();
			var author3 = $("#author3").val();
			var press3 = $("#press3").val();
			var url3 = name + "?press=" + press3 + "&bname=" + bname3
					+ "&author=" + author3;
			$("#addModal").modal('hide');
			loadbook(url3);

		}
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>