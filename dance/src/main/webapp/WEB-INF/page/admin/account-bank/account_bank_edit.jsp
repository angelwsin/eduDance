<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>" />
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:js path="jsAddress.js" />
<div class="post-form medium">
	<form id="bankForm" method="post">
		<div>
			<x:hidden property="bank.id" />
			<label>账号</label>：<span>${bank.user.username}</span>
		</div>
		<div>
			<label>真实姓名</label>：<span>${bank.user.realName}</span>
		</div>
		<div>
			<x:select property="bank.bank" metaType="bank" label="开户银行" />
		</div>
		<div>
			<label>开户行所在地</label>：<select id="province" name="bank.province"></select> <select id="city" name="bank.city"></select> <select id="area" name="bank.area"></select>
		</div>
		<div>
			<x:text property="bank.branch" label="开户支行" placeholder="例如：福田区金田路支行" />
		</div>
		<div>
			<x:text property="bank.account" label="银行账号" />
		</div>
		<div class="toolbar">
			<input id="btnSubmit" type="button" value="确认提交"><input type="button" onclick="history.back()" value="返回" />
		</div>
	</form>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			addressInit("province", "city", "area", "${bank.province}" || "北京", "${bank.city}" || "东城区", "${bank.area}" || "密云县");
			var $form = $("#bankForm");
			$("#btnSubmit").click(function() {
				var flag = $form.v({
					"bank.bank" : "required",
					"bank.branch" : "required",
					"bank.account" : {
						format : "number",
						length : "[10,]",
						message : "请输入有效的银行账号，否则可能无法正常提现!"
					},
				});
				flag && $.confirm("您确认需要修改？", function() {
					$.ajaxMessage(root + "/admin/account-bank/edit", $form.serialize());
				});
			});
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>