
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>


<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${__title}</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<x:css path="common.css: style.css" output="true" />
<x:js path="jquery: layer: jquery-util: jquery-validator" />
</head>
<div class="user-content">
	<div class="user-table">
		<table class="table">
			<tr>
				<th>标题</th>
				<th>类型</th>
				<th>年利率</th>
				<th>期限</th>
				<th>期数</th>
				<th>待还总额</th>
				<th>待还利息</th>
				<th>状态</th>
				<th>还款时间</th>
				<th>我要还款</th>
			</tr>
			<c:forEach items="${repayments}" var="repayments">
				<tr height="15px">
					<td>${repayments.borrow.title}</td>
					<td>${repayments.borrow.type_}</td>
					<td>${repayments.borrow.apr_}</td>
					<td>${repayments.borrow.borrowLimit_}</td>
					<td>${repayments.period_}</td>
					<td>${repayments.repaymentAccount_}</td>
					<td>${repayments.repaymentInterest_}</td>
					<td>${repayments.status_}</td>
					<td>${repayments.repaymentTime_}</td>
					<c:if test="${repayments.status==0}">
						<td><input type="button" id="submit" value="还款" onclick="arepayments(${repayments.id})" /></td>
					</c:if>
					<c:if test="${repayments.status==1}">
						<td>已还完</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>				
	</div>
</div>
<x:script>
	<script type="text/javascript">
		function arepayments(i) {
			$.ajaxMessage("${root}/borrow/repayment", {
				"borrowRepaymentId" : i
			}, function(json){
				if (json.status == "OK") {
					location.reload();
					parent.location.reload();
				}				
			});
		};
	</script>
</x:script>
${jsCode}
<x:script output="true" />