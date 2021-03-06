<%@ page language="java" import="java.util.*,com.xml.vo.BsProductInfo,com.xml.service.com.BsSymService" pageEncoding="UTF-8"%>
<%@ include file="query_head.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String sym=null==request.getParameter("sym")?"":request.getParameter("sym").toString();
BsSymService service=null;
List dataList=null;
BsProductInfo bean=null;
String sym_state="";
if(!"".equals(sym)){
	service=new BsSymService();
	sym_state=service.checkSym(sym);
	if("ok".equals(sym_state)){
		dataList=service.getProductGrowthInfo(sym);
	}
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>二维码溯源查询</title>
<script type="text/javascript">	
	var sym='<%=sym%>';
	var sym_state='<%=sym_state%>';
	if(sym.length==0){
		alert('请输入追溯码！');
		top.location.href='index.jsp';
	}
	if(sym.length>0 && sym_state!="ok"){
	    alert('不好意思，系统平台查询不到此追溯码，请输入有效的追溯码！');
		top.location.href='index.jsp';
	}
</script>
  </head>
<body>
	<div role="main" class="ui-content"> 
		<table width="100%" class="table_border mytable" bordercolor="#000000" cellspacing="0" border="1" cellpadding="0">
		 <thead>
		   <tr>
			 <th data-priority="2">操作人</th>
			 <th>操作内容</th>
			 <th data-priority="3">操作日期</th>
			 <th data-priority="1">备注</th>
			 <th data-priority="5">批次号</th>
		   </tr>
		 </thead>
		 <tbody>
		 <% 
		if(null!=dataList && dataList.size()>0){
			for(int i=0;i<dataList.size();i++){
				bean=(BsProductInfo)dataList.get(i);
				out.println("<tr>");
				out.println("<td>"+bean.getPiCzr()+"</td>");
				out.println("<td>"+bean.getPiCznr()+"</td>");
				out.println("<td>"+bean.getPiCzrq()+"</td>");
				out.println("<td>"+bean.getPiBz()+"</td>");
				out.println("<td>"+bean.getPiProPc()+"</td>");
				out.println("</tr>");
			}
		}else{
			out.println("<tr><td colspan=\"5\">暂无生长信息</td></tr>");
		}
		%>
			</tbody>
		</table>        
	</div>
	 
<%@ include file="query_footer.jsp"%>
</body>
</html>