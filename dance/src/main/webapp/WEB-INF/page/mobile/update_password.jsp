<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>修改密码</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<form>
		<div class="change_password">
			<ul>
				<li><x:password property="oldpwd" label="旧密码" /></li>
				<li><x:password property="newpwd" label="新密码" /></li>
				<li><x:password property="newpwd2" label="确认密码" /></li>
			</ul>
			<div class="passwrod_btn">
				<input type="button" value="提交" class="tj" onclick="subForm()">
			</div>
		</div>
	</form>
</section>
<x:script>
	<script type="text/javascript">
		v.define({
			repeatPwd : {
				equalsTo : "newpwd"
			}
		});
		function subForm() {
			var flag = $("form").v({
				"oldpwd" : "password",
				"newpwd" : "password",
				"newpwd2" : "repeatPwd"
			});
			if (flag) {
				if (flag) {
					$.ajaxMessage("${root}/mobile/updatePsd", $("form").serialize());
				}
			}
		}
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>