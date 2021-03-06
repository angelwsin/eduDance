<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<x:css path="common.css: admin.css: admin-patch.css" output="true" />
<div>
	<table class="ui-table">
		<caption>${__title}</caption>
		<tr class="tr-head">
			<th>序号</th>
			<c:forEach items="${title}" var="t">
				<th>${t}</th>
			</c:forEach>
		</tr>
		<c:forEach items="${page.list}" var="o" varStatus="s">
			<tr class="${s.count%2==0?'even':'odd'}">
				<td>${s.count}</td>
				<c:forEach items="${o}" var="c" varStatus="vs">
					<c:if test="${vs.index==2}">
						<td><img class="small" src="${c}" /></td>
					</c:if>
					<c:if test="${vs.index!=2}">
						<td>${c}</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<x:page />
</div>
<x:script>
	<script type="text/javascript">
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
