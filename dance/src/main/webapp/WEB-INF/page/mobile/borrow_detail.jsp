<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>${__title}</h3>
			<a class="back" onclick="history.back()"></a>
		</div>
	</div>
</header>
<section>
	<div class="about">
		<c:forEach var="f" items="${files}">
			<div>
				<img src="${f.fileURI}" />
			</div>
		</c:forEach>
	</div>
</section>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>