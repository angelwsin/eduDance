<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>找回密码</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<form name="form1">
		<div class="reg">
			<ul>
				<li><label>用户名</label> ：<input type="text" name="username" placeholder="6-16位数字" maxlength="16"><input type="hidden" name="smsType" value="FORGETPWD"></li>
				<li><label>手机号</label> ：<input type="text" id="phone" name="phone" placeholder="输入您的常用手机号码" maxlength="11"></li>
				<li><label>手机验证码</label>： <input type="text" style="width: 110px;"  name="phoneCode" placeholder="输入验证码(6位)"><span id="btnText" class="yzm"><a href="javascript:;" id="gainCode">获取验证码</a></span></li>
			</ul> 
			<div class="login-wrap blue tj">
				<a href="javascript:submitForm();">下一步 </a>
			</div>
		</div>
	</form>
</section>
<x:script>
	<script type="text/javascript">
		var enabled = true;
		//短信验证码获取的定时器
		function smsCodeTimer($dom, seconds) {
			seconds--;
			if (seconds > 0) {
				$dom.html("重新发送(" + seconds + ")");
				enabled = false;
				setTimeout((function($dom, seconds) {
					return function() {
						smsCodeTimer($dom, seconds);
					};
				})($dom, seconds), 1000);
			} else {
				$dom.html("获取验证码");
				enabled = true;
			}
		}
		v.define({
			phoneCode : {
				format : "number",
				length : "[6]"
			}
		});
		v.setLabel("phoneCode", "手机验证码");
		$("#gainCode").click(function() {
			if (!enabled)
				return false;
			var reg = /^1\d{10}$/;
			if (!reg.test($("#phone").val())) {
				alert("手机号码错误");
				$("#phone").focus();
			} else {
				$.postJSON("${root}/mobile/createPhoneCodeFindPwd?phone=" + $("#phone").val(), function(data) {
					if (data.status == "OK") {
						smsCodeTimer($("#btnText"), 60);
					}
					alert(data.message);
				})
			}
		});
		function submitForm() {
			var flag = $("form").v({
				"username" : "required",
				"phone" : "cellphone",
				phoneCode : "phoneCode"
			});
			if (flag) {
				$.ajaxMessage("${root}/mobile/findPwd", $("form").serialize());
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>