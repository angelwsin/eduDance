<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="wrap">
	<div class="about">
		<div class="about-left">
			<ul>
				<c:forEach items="${posts}" var="p">
					<li ${p.id == post.id ? ' id="btn"' : ''}><a href="aboutUs?post.id=${p.id}">${p.title}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="about-right">
			<h2>${post.title}</h2>
			<div class="news-center">
				${post.content }
			</div>
		</div>
	</div>
</div>
<x:script>
	<script type="text/javascript">
		$(function() {
			$("#btn").addClass('clckClass');
		});
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
