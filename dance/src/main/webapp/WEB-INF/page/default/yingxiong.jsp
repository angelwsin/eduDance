<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="conter_nar">
	<div class="yingxiong">
		<dl class="y_x_tupian">
			<dt>
				<img src="${root}/public/upload/image/Month1.png" />
			</dt>
			<dd>${yingxiong[0].content}</dd>
		</dl>
	</div>
	<div class="yingxiong">
		<dl class="y_x_tupian">
			<dt>
				<img src="${root}/public/upload/image/Month2.png" />
			</dt>
			<dd>${yingxiong[1].content}</dd>
		</dl>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>
