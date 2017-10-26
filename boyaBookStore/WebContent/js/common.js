function _change() {
	$("#vCode").attr("src", "/boyaBookStore/VerifyCodeServlet?" + new Date().getTime());
}