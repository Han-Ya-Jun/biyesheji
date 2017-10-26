<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jsps/css/book/list.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jsps/pager/pager.css'/>" />
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jsps/js/book/list.js'/>"></script>
</head>
<style>
table {
	font-size: 10pt;
	border-color: #efeae5;
	border-style: solid;
	border-width: 5px;
	color: #404040;
}

td {
	border-color: #efeae5;
	border-style: solid;
	border-width: 0;
	border-bottom-width: 1px;
	padding: 10px;
}
</style>
<body>
	<c:choose>
		<c:when test="${empty pb.beanList }">
			<table width="95%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right"><img style="width: 443px;"align="top"
							src="<c:url value='/images/timg.jpg'/>" /></td>
					<td><span class="spanEmpty"
						style="margin-top: 50px; font-size: 24px; font-weight: 900;">暂时没有搜到复合要求的书籍，再搜下试试！</span></td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<ul>
				<c:forEach items="${pb.beanList }" var="book">
					<li>
						<div class="inner">
							<a class="pic"
								href="<c:url value='/loadbook.action?bid=${book.bid }'/>"><img
								src="<c:url value='/${book.imageB }'/>" border="0" /></a>
							<p class="price">
								<span class="price_n">&yen;${book.currprice }</span> <span
									class="price_r">&yen;${book.price }</span> (<span
									class="price_s">${book.discount }折</span>)
							</p>
							<p>
								<a id="bookname" title="${book.bname }"
									href="<c:url value='/loadbook.action?bid=${book.bid }'/>">${book.bname }</a>
							</p>
							<%-- url标签会自动对参数进行url编码 --%>
							<c:url value="/findByAuthor.action" var="authorUrl">
								<c:param name="author" value="${book.author }" />
							</c:url>
							<c:url value="/findByPress.action" var="pressUrl">
								<c:param name="press" value="${book.press }" />
							</c:url>
							<p>
								<a href="${authorUrl }" name='P_zz' title='${book.author }'>${book.author }</a>
							</p>
							<p class="publishing">
								<span>出 版 社：</span><a href="${pressUrl }">${book.press }</a>
							</p>
							<p class="publishing_time">
								<span>出版时间：</span>${book.publishtime }</p>
						</div>
					</li>
				</c:forEach>












			</ul>

			<div style="float: left; width: 729px; text-align: center;">
				<hr />
				<br />
				<%@include file="/jsps/pager/pager.jsp"%>
			</div>


		</c:otherwise>

	</c:choose>


</body>

</html>

