<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pay.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/pay.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
  <style>


        .input_text {
            padding: 10px 10px;
            border: 1px solid #d5d9da;
            border-radius: 5px;
            box-shadow: 0 0 5px #e8e9eb inset;
            width: 100px;
            font-size: 1em;
            outline: 0;
        }

        .input_text:focus {
            border: 1px solid #b9d4e9;
            border-top-color: #b6d5ea;
            border-bottom-color: #b8d4ea;
            box-shadow: 0 0 5px #b9d4e9;
        }

        .button {
            color: #666;
            background-color: #EEE;
            border-color: #EEE;
            font-weight: 300;
            font-size: 16px;
            font-family: "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
            text-decoration: none;
            text-align: center;
            line-height: 40px;
            height: 40px;
            padding: 0 40px;
            margin: 0;
            display: inline-block;
            appearance: none;
            cursor: pointer;
            border: none;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition-property: all;
            transition-property: all;
            -webkit-transition-duration: .3s;
            transition-duration: .3s;
        }

        .button-primary {
            background-color: #1B9AF7;
            border-color: #1B9AF7;
            color: #FFF;
        }

        .button-primary:visited:visited {
            color: #FFF;
        }

        .button-primary:hover, .button-primary:focus
        {
            background-color: #4cb0f9;
            border-color: #4cb0f9;
            color: #FFF;
        }

        .button-pill {
            border-radius: 200px;
        }

        .alipay_select {
            width: 120px;
            background: url(http://codepay.fateqq.com/img/alipay.jpg) no-repeat 14px 0;
        }

        .qqpay_select {
            width: 130px;
            background: url(http://codepay.fateqq.com/img/qqpay.jpg) no-repeat 14px 0;
        }

        .wechat_select {
            width: 120px;
            background: url(http://codepay.fateqq.com/img/weixin.jpg) no-repeat 16px 0;

        }

        .type_select {
            float: left;
            padding: 1px;
            margin: 5px 5px 0px 0px;

            border: 1px solid #80C5FF;
            color: #0061F3;
            font-size: 13px;
            padding: 5px;
            margin-left: 0px;
            float: left;
            padding-left: 2px;
            padding-right: 20px;
            padding-top: 14px;
            height: 20px;
        }
    </style>
<script type="text/javascript">
$(function() {
	$("img").click(function() {
		$("#" + $(this).attr("name")).attr("checked", true);
	});
});
</script>
  </head>
  
  <body>
<div class="divContent">
	<span class="spanPrice">支付金额：</span><span class="price_t">&yen;${order.total }</span>
	<span class="spanOid">编号：${order.oid }</span>
</div>
<div class="divText">选择支付方式：</div>
<button onclick="phone()">手机支付</button>
<button onclick="bank()">网银支付</button>
<form name="form2" id="form2" method="get" action="phonepay.action" style="display:none">
    <div>
        <input type="hidden" name="oid" value="${order.oid }"/>
        <input type="hidden" name="price" value="${order.total}"/>
        <table width="550" border="0" align="center" cellpadding="8" cellspacing="1" bgcolor="#ffffff">
            <tbody>
           
            <tr>
                <td>
                    <div align="right">支付：</div>
                </td>
                <td><label>
                        <div class="type_select alipay_select">
                            <input type="radio" name="type" value="1" checked="checked">
                        </div>
                    </label>
                    <label>
                        <div class="type_select wechat_select">
                            <input type="radio" name="type" value="3">
                        </div>
                    </label>
                    <label>
                        <div class="qqpay_select type_select">
                            <input type="radio" name="type" value="2">
                        </div>
                    </label>
                </td>
            </tr>
          
            <tr>
                <td>
                    <div align="right"></div>
                </td>
                <td><label>
                        <input type="submit"  id="Submit" class="button button-pill button-primary"
                               value="支付宝支付">

                    </label></td>
            </tr>
            </tbody>
        </table>
    </div>
</form>
<form action="<c:url value='/payment.action'/>" method="post" id="form1" target="_top" style="display:none">
<input type="hidden" name="oid" value="${order.oid }"/>
<div class="divBank">
	<div class="divText">选择网上银行</div>
	<div style="margin-left: 20px;">
	  <div style="margin-bottom: 20px;">
		<input id="ICBC-NET-B2C" type="radio" name="yh" value="ICBC-NET-B2C" checked="checked"/>
		<img name="ICBC-NET-B2C" align="middle" src="<c:url value='/bank_img/icbc.bmp'/>"/>
		
		<input id="CMBCHINA-NET-B2C" type="radio" name="yh" value="CMBCHINA-NET-B2C"/>
		<img name="CMBCHINA-NET-B2C" align="middle" src="<c:url value='/bank_img/cmb.bmp'/>"/>

		<input id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C"/>
		<img name="ABC-NET-B2C" align="middle" src="<c:url value='/bank_img/abc.bmp'/>"/>
		
		<input id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C"/>
		<img name="CCB-NET-B2C" align="middle" src="<c:url value='/bank_img/ccb.bmp'/>"/>
	  </div>	
	  <div style="margin-bottom: 20px;">
		<input id="BCCB-NET-B2C" type="radio" name="yh" value="BCCB-NET-B2C"/>
		<img name="BCCB-NET-B2C" align="middle" src="<c:url value='/bank_img/bj.bmp'/>"/>

		<input id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C"/>
		<img name="BOCO-NET-B2C" align="middle" src="<c:url value='/bank_img/bcc.bmp'/>"/>

		<input id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C"/>
		<img name="CIB-NET-B2C" align="middle" src="<c:url value='/bank_img/cib.bmp'/>"/>

		<input id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C"/>
		<img name="NJCB-NET-B2C" align="middle" src="<c:url value='/bank_img/nanjing.bmp'/>"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="CMBC-NET-B2C" type="radio" name="yh" value="CMBC-NET-B2C"/>
		<img name="CMBC-NET-B2C" align="middle" src="<c:url value='/bank_img/cmbc.bmp'/>"/>

		<input id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C"/>
		<img name="CEB-NET-B2C" align="middle" src="<c:url value='/bank_img/guangda.bmp'/>"/>

		<input id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C"/>
		<img name="BOC-NET-B2C" align="middle" src="<c:url value='/bank_img/bc.bmp'/>"/>

		<input id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET"/>
		<img name="PINGANBANK-NET" align="middle" src="<c:url value='/bank_img/pingan.bmp'/>"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="CBHB-NET-B2C" type="radio" name="yh" value="CBHB-NET-B2C"/>
		<img name="CBHB-NET-B2C" align="middle" src="<c:url value='/bank_img/bh.bmp'/>"/>

		<input id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C"/>
		<img name="HKBEA-NET-B2C" align="middle" src="<c:url value='/bank_img/dy.bmp'/>"/>

		<input id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C"/>
		<img name="NBCB-NET-B2C" align="middle" src="<c:url value='/bank_img/ningbo.bmp'/>"/>

		<input id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C"/>
		<img name="ECITIC-NET-B2C" align="middle" src="<c:url value='/bank_img/zx.bmp'/>"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C"/>
		<img name="SDB-NET-B2C" align="middle" src="<c:url value='/bank_img/sfz.bmp'/>"/>

		<input id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C"/>
		<img name="GDB-NET-B2C" align="middle" src="<c:url value='/bank_img/gf.bmp'/>"/>

		<input id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C"/>
		<img name="SHB-NET-B2C" align="middle" src="<c:url value='/bank_img/sh.bmp'/>"/>

		<input id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C"/>
		<img name="SPDB-NET-B2C" align="middle" src="<c:url value='/bank_img/shpd.bmp'/>"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="POST-NET-B2C" type="radio" name="yh" value="POST-NET-B2C"/>
		<img name="POST-NET-B2C" align="middle" src="<c:url value='/bank_img/post.bmp'/>"/>

		<input id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C"/>
		<img name="BJRCB-NET-B2C" align="middle" src="<c:url value='/bank_img/beijingnongshang.bmp'/>"/>

		<input id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C"/>
		<img name="HXB-NET-B2C" align="middle" src="<c:url value='/bank_img/hx.bmp'/>"/>

		<input id="CZ-NET-B2C" type="radio" name="yh" value="CZ-NET-B2C"/>
		<img name="CZ-NET-B2C" align="middle" src="<c:url value='/bank_img/zheshang.bmp'/>"/>
	  </div>
	</div>
	<div style="margin: 40px;">
		<a href="javascript:void $('#form1').submit();" class="linkNext">下一步</a>
	</div>
</div>
</form>
  </body>
</html>
<script type="text/javascript">
    var type = document.getElementsByName('type');
    var price = document.getElementById('price');
    var money = document.getElementById('money');
    var FormSubmit = document.getElementById('Submit');
    for (var i = 0; i < type.length; i++) {
        type[i].onclick = function () {
            switch (parseInt(this.value)) {
                case 1:
                    FormSubmit.value = '支付宝支付';
                    break;
                case 2:
                    FormSubmit.value = 'QQ钱包支付';
                    break;
                case 3:
                    FormSubmit.value = '微信支付';
                    break;
                default:
                    FormSubmit.value = '支付宝支付';
            }
        }
    }
    $(".w-pay-money").click(function () {
        $(".w-pay-money").removeClass('w-pay-money-selected');
        $(this).addClass('w-pay-money-selected');
        price.value = $(this).attr('data');
        money.value = $(this).attr('data');
    });
  function phone(){
	  $("#form2").css("display","block")
	  $("#form1").css("display","none")
  }  
  function bank(){
	  $("#form1").css("display","block")
	  $("#form2").css("display","none")
  }  
</script>