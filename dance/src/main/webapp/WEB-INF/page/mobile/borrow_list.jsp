<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/admin_header.jsp"%>
<header class="header">
	<div class="head">
		<div class="top">
			<h3>投资理财</h3>
		</div>
	</div>
</header>
<section>
	<div class="lc_list">
		<c:forEach var="b" items="${page.list}">
			<div class="list">
				<a href="${root}/mobile/detail?b.id=${b.id}">
					<div class="index">
						<div class="lc_info">
							<h3>
								<span>${b.icon}</span>${b.title}
							</h3>
						</div>
						<div class="lc_info">
							<ul>
								<li>年华利率：<font class="fc1">${b.apr_0}</font></li>
								<li>项目金额：<font class="fc2">${b.account_0}</font></li>
								<li>项目期限：<i>${b.borrowLimit_}</i></li>
							</ul>
						</div>
						<div class="cont">
							<div class="loading">
								<div class="jd">
									<span class="jd_hover" style="width:${b.tenderProcess}%;"></span>
								</div>
							</div>
							<div class="lc_btn">
								<input type="button" value="立即投资">
							</div>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
		<div class="tixian-wrap org">
			<dl class="blue">
				<a onclick="searchForm()"><li class="login-bottow">点击更多</li></a>
			</dl>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/page/common/mobile_footer.jsp"%>