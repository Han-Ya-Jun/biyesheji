<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsps/commen/tag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>商品详情</title>

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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jsps/pager/pager.css'/>" />
<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<style>
.inputPageCode{
    border-bottom-width: 2px;
    width: 25px;
    height: 28px;
    margin-top: 0px;
}

</style>
<body>

  

	<div class="main">
		<div class="container">

			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40">


				<!-- BEGIN CONTENT -->
				<div class="col-md-12 col-sm-12">
					<div class="product-page">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="product-main-image">
									<img src="<c:url value='/${book.imageW }'/>"
										alt="Cool green dress with red bell" class="img-responsive"
										data-BigImgsrc="<c:url value='/${book.imageW }'/>">
								</div>

							</div>
							<div class="col-md-6 col-sm-6">
								<h1>${ book.bname}</h1>
								<div class="price-availability-block clearfix">
									<div class="price">
										<strong><span>￥</span>${book.currprice }</strong> <em>￥<span>${book.price }</span></em>
										折扣：<span style="color: #c30;">${book.discount }</span>折
									</div>
									<div class="availability">
										作者: <strong>${book.author } 著</strong>
									</div>
								</div>
								<div class="description">
									<p>${book.press}</p>
								</div>
								<div class="product-page-cart">
									<form action="<c:url value='/add.action'/>" method="post">
										<div class="product-quantity">
											<input id="product-quantity" type="text" value="1"
												name="quantity" readonly class="form-control input-sm">
										</div>
										<input type="hidden" name="bid" value="${book.bid }" />
										<button class="btn btn-primary" type="submit">加入购物车</button>

									</form>

								</div>
								<div class="review">
									<input type="range" value="4" step="0.25" id="backing4">
									<div class="rateit" data-rateit-backingfld="#backing4"
										data-rateit-resetable="false" data-rateit-ispreset="true"
										data-rateit-min="0" data-rateit-max="5"
										data-rateit-readonly="true"></div>
									<a href="javascript:;">${pb.tr }条评论</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
										href="javascript:;">评价商品</a>
								</div>

							</div>

							<div class="product-page-content">
								<ul id="myTab" class="nav nav-tabs">
									<li><a href="#Description" data-toggle="tab">商品描述</a></li>
									<li ><a href="#Information"
										data-toggle="tab">商品详情</a></li>
									<li class="active"><a href="#Reviews" data-toggle="tab">顾客评价(${pb.tr})</a></li>
									<li ><a href="#comment" data-toggle="tab">商品评价</a></li>
								</ul>
								<div id="myTabContent" class="tab-content">
									<div class="tab-pane fade" id="Description">
										<p>${book.des }</p>
									</div>
									<div class="tab-pane fade" id="comment">
										<!-- BEGIN FORM-->
										<form action="${baseurl}addcomment.action" class="reviews-form" role="form">
											<h2>评价该商品</h2>
											<div class="form-group">
												<label for="name">用户名<span class="require">*</span></label>
												<input type="text" class="form-control" name="uid" id="name">
												<input type="text" class="hidden" name="bid" value="${book.bid }">
											</div>
											
											<div class="form-group">
												<label for="review">详细评价 <span class="require">*</span></label>
												<textarea class="form-control" name="detail" rows="8" id="review"></textarea>
											</div>
											<div class="form-group">
												<label for="email">评分</label> <input type="range" value="4"
													step="0.25" id="backing5" name="grade">
												<div class="rateit" data-rateit-backingfld="#backing5"
													data-rateit-resetable="false" data-rateit-ispreset="true"
													data-rateit-min="0" data-rateit-max="5"></div>
											</div>
											<div class="padding-top-20">

												<button type="submit" class="btn btn-primary">确定</button>
											</div>
										</form>
										<!-- END FORM-->
									</div>
									<div class="tab-pane fade " id="Information">
										<table class="datasheet">
											<tr>
												<th colspan="2">书籍详细信息</th>
											</tr>
											<tr>
												<td class="datasheet-features-type">出版社：</td>
												<td>${book.press }</td>
											</tr>
											<tr>
												<td class="datasheet-features-type">出版时间：</td>
												<td>${book.publishtime }</td>
											</tr>
											<tr>
												<td class="datasheet-features-type">版次：</td>
												<td>${book.edition }</td>
											</tr>
											<tr>
												<td class="datasheet-features-type">页数：</td>
												<td>${book.pagenum }</td>
											</tr>
											<tr>
												<td class="datasheet-features-type">字数：</td>
												<td>${book.wordnum }</td>
											</tr>
											<tr>
												<td class="datasheet-features-type">印刷时间：</td>
												<td>${book.printtime }</td>
											</tr>
											<tr>
												<td class="datasheet-features-type">开本：</td>
												<td>${book.booksize }开</td>
											</tr>
											<tr>
												<td class="datasheet-features-type">纸张：</td>
												<td>${book.paper }</td>
											</tr>
										</table>
									</div>
									<div class="tab-pane fade in active" id="Reviews">
										<!--<p>There are no reviews for this product.</p>-->
										<c:choose>

											<c:when test="${empty pb.beanList }">
												<p>该商品暂时没有用户评价</p>
											</c:when>

											<c:otherwise>

												<c:forEach items="${pb.beanList }"
													var="comment">
													<div class="review-item clearfix">
														<div class="review-item-submitted">
															<strong>${comment.uid }</strong> <em>${comment.time }</em>
															<div class="rateit" data-rateit-value="${comment.grade }"
																data-rateit-ispreset="true" data-rateit-readonly="true"></div>
														</div>
														<div class="review-item-content">
															<p>${comment.detail }</p>
														</div>
													</div>

												</c:forEach>
												<div >
													<hr />
													<br />
													<%@include file="/jsps/pager/pager.jsp"%>
												</div>
											</c:otherwise>
										</c:choose>




									</div>
								</div>
							</div>

							<div class="sticker sticker-sale"></div>
						</div>
					</div>
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END SIDEBAR & CONTENT -->


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

	<script src="${baseurl}assets/frontend/layout/scripts/layout.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			Layout.init();
			Layout.initOWL();
			Layout.initTwitter();
			Layout.initImageZoom();
			Layout.initTouchspin();
			Layout.initUniform();
		});
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>