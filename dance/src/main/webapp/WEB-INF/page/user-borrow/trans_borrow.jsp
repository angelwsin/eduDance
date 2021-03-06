
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${__title}-${_siteConfig.siteName}</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<x:css path="common.css: style.css: layout.css: style-patch.css" output="true" />
<x:js path="jquery" defaultDir="false" />
<x:js path="layer: jquery-util.js: jquery-validator-1.2.js" />
</head>
<div class="product">
	<div class="post-form medium long-label">
		<div style="margin:30px;">
			<h3 style="border-bottom:1px solid #dcdcdc;line-height:50px;color:#0082d6">我要转让</h3>
		</div>
		<form id="tranForm" method="post">
			<div>
				<x:text property="bondValue" label="债权价值" cssClass="short" disabled="true" />
				<x:hidden id="borrowTenderRepaymentAccount" value="${canTransferCapital}" />
			</div>
			<div>
				<x:text property="ratio" label="折让率" cssClass="short" />
				%<em> (基于投资金额，给买家适当的转让优惠)</em>
			</div>
			<div>
				<x:text property="transaccount" label="转出价格" cssClass="short" disabled="true" />【转出价格 = 投资金额 * (100% - 折让率)】
			</div>
			<div>
				<x:select  id="validTime"   name="validTime" metaType="validTime" label="有效时间" />
			</div>
			<div>
				<x:text property="title" label="转让标标题" cssClass="medium" maxlength="24" />
			</div>
			<div>
				<x:text name="verifyCode" label="验证码" cssClass="short" />
				<img id="verifyCodeImg" class="verify-code" src="${root}/user/createValidateCode" title="点击更换" />
			</div>
			<div class="toolbar">
				<input id="btnSubmit" type="button" value="转让" onclick="transBorrow(${borrowTender.id})">
			</div>
		</form>
		<div style="margin:30px;padding:10px;border:1px solid #dcdcdc;background:#e9e9e9;">转让说明：转让成功后，您将收到买家支付的转让金额。当借款人还款时，此投标尚未还款的所有收益都将直接偿还给债权买家。</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		function refresh() {
			$("#verifyCodeImg").attr("src", "${root}/user/createValidateCode?t=" + Date.now());
		};
		$("#verifyCodeImg").click(function() {
			refresh();
		});
		$("#ratio").keyup(function() {
			var account = $("#borrowTenderRepaymentAccount").val();
			var ratio = $("#ratio").val();
			$('#transaccount').val(account - account * ratio / 100);
		})
		function transBorrow(tenderId) {
			var $form = $("#tranForm");
			var flag = $("form").v({
				"ratio" : {
					format : "number/money",
					range : "[0,100)"
				},
				"validTime":true,
				"title" : "required",
				"verifyCode" : "imageCode"
			});
			if (flag) {
				if (confirm("确定要转让?")) {
					var json = $.ajaxMessage("${root}/borrow/transfer", {
						"transaccount" : $("#transaccount").val(),
						"award" : $("#award").val(),
						"title" : $("#title").val(),
						"tenderId" : ${tenderId},
						"validTime":$("#validTime").val(),
						"verifyCode" : $("#verifyCode").val()
					}, function(json){
						if (json.status == "OK") {
							location.reload();
							parent.location.reload();
						} else {
							refresh();
						}						
					});
				} else {
					parent.location.reload();
				}
			}
		};
	</script>
</x:script>
${jsCode}
<x:script output="true" />