
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>

<x:inject />
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<c:if test="${!empty _siteConfig.siteDesc}">
<meta http-equiv="description" content="${_siteConfig.siteDesc}">
</c:if>
<x:css path="common.css: style.css: user.css" output="true" />
<x:js path="jquery: layer: jquery-util: jquery-validator" />
<!--[if lt ie 9]>
	<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
</head>
<body>
<div class="wrap top-bg">
	<div class="w1000">
		<div class="top-right">
			<ul>
				<c:choose>
					<c:when test="${empty sessionUser}">
						<li class="top-right-hover"><a href="${root}/user/login">登录</a></li>
						<li class="top-right-hover"><a href="${root}/user/register">注册</a></li>
					</c:when>
					<c:otherwise>
						<li>您好，<a href="${root}/user/center">${sessionUser.username}</a></li>
						<li class="top-right-hover"><a href="${root}/user/loginOut">退出</a></li>						
					</c:otherwise>
				</c:choose>
				<li>客服热线：${_siteConfig.hotline}</li>
				<li><img src="${root}/public/image/cake.png" /><a href="${root}/default/calc">收益计算器</a></li>
				<li><img src="${root}/public/image/shouji.png" /><a href="${root}/mobile/index">手机客户端</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="wrap deepred">
	<div class="w1000 position">
		<div class="head-left">
			<div class="logo"><a href="${root}"><img src="${root}/public/image/logo.png"></a></div>
			<div class="logo-right"><img src="${root}/public/image/logo-right.png"></div>
		</div>
		<div class="menu">
			<ul>
				<li><a href="${root}/">首页</a></li>
				<li><a href="${root}/borrow/list">我要理财</a></li>
				<li><a href="${root}/borrow/select">我要借款</a></li>
				<li><a href="${root}/user/center">会员中心</a></li>
				<li><a href="${root}/news/more?flag=安全保障 ">安全保障 </a></li>
				<li><a href="${root}/news/aboutUs">关于我们 </a></li>
			</ul>
		</div>
	</div>
</div>
