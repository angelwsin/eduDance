<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<div class="wrap">
	<div class="user">
		<%@ include file="/WEB-INF/page/common/user_menu.jsp"%>
		<x:js path="date" />
		<div class="user-right">
			<div class="user-content">
				<div class="post-form">
					<ul>
						<li><x:text property="ml.title" label="标题" /></li>
						<li><x:textarea property="ml.finalContent" label="内容" /></li>
						<li><x:text property="ml.message.sender.username" label="发送人" /></li>
						<li><x:text property="ml.message.sendTime_" label="发送时间" /></li>
						<li class="toolbar"><a class="btn" href="${root}/message-log/list">返回</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/page/common/footer.jsp"%>