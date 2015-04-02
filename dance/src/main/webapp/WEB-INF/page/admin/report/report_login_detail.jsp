<%@ page language="java" pageEncoding="UTF-8"%>

<x:css path="common.css: admin.css: admin-patch.css" output="true" />
<x:js path="jquery" defaultDir="false" />
<x:js path="layer: jquery-util.js: jquery-validator.js" />
<div id="login_detail_table"></div>
<x:script>
	<script type="text/javascript">
		var t = new Table("登录统计列表", "username=用户名;loginTime=最近登录时间;loginIP=登录IP", ${page.JSONForDateTime});
		t.rowTemplate("username", function() {
			return this[0];
		});
		t.rowTemplate("loginTime", function() {
			return this[1];
		});
		t.rowTemplate("loginIP", function() {
			return this[2];
		});
		t.show("#login_detail_table");
	</script>
</x:script>
<%@ include file="/WEB-INF/page/common/admin_footer.jsp"%>
