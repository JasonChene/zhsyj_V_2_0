<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/sicp3.tld" prefix="sicp3"%>
<%@ page import="com.zzhdsoft.mvc.GlobalConfig,com.zzhdsoft.utils.SysmanageUtil,com.askj.zfba.dto.Zfwsajhyjl18DTO"%>
<%@ page import="com.zzhdsoft.utils.StringHelper,java.util.List,java.net.URLDecoder"%>
<%
	String contextPath = request.getContextPath();
	String basePath = GlobalConfig.getAppConfig("apppath");
	if (null == basePath || "".equals(basePath)) {
		basePath = request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath() + "/";
	} 
	String ajdjid = StringHelper.showNull2Empty(request.getParameter("ajdjid")); 
	String v_canbaocun = StringHelper.showNull2Empty(request.getParameter("canbaocun"));//是否可以保存0否1是		
	String v_fjcsdmmc = URLDecoder.decode(StringHelper.showNull2Empty(request.getParameter("fjcsdmmc")),"UTF-8");
	String zfwsdmz = StringHelper.showNull2Empty(request.getParameter("zfwsdmz"));
	Zfwsajhyjl18DTO localZfwsajhyjl18DTO = new Zfwsajhyjl18DTO();
	if (request.getAttribute("mybean") != null) {
		localZfwsajhyjl18DTO = (Zfwsajhyjl18DTO) request.getAttribute("mybean");
	}
%>


<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=GB2312">
<style type="text/css">
.b1 {
	white-space-collapsing: preserve;
}

.b2 {
	margin: 1.0in 1.25in 1.0in 1.25in;
}

.s1 {
	font-weight: bold;
	color: black;
}

.s2 {
	color: black;
}

.s3 {
	font-family: 仿宋_GB2312;
	color: black;
}

.p1 {
	margin-top: 0.108333334in;
	text-align: center;
	hyphenate: auto;
	font-family: 黑体;
	font-size: 16pt;
}

.p2 {
	text-align: center;
	hyphenate: auto;
	font-family: Times New Roman;
	font-size: 22pt;
}

.p3 {
	margin-top: 0.108333334in;
	text-align: end;
	hyphenate: auto;
	font-family: 仿宋;
	font-size: 10pt;
}

.p4 {
	margin-top: 0.108333334in;
	text-align: justify;
	hyphenate: auto;
	font-family: 仿宋_GB2312;
	font-size: 10pt;
}

.p5 {
	margin-top: 0.108333334in;
	text-align: start;
	hyphenate: auto;
	font-family: 仿宋_GB2312;
	font-size: 10pt;
}

.p6 {
	text-align: start;
	hyphenate: auto;
	font-family: 宋体;
	font-size: 12pt;
}

.p7 {
	text-align: justify;
	hyphenate: auto;
	font-family: Times New Roman;
	font-size: 10pt;
}
</style>
<title>食品药品行政处罚文书</title>
<meta content="X" name="author">
<jsp:include page="${contextPath}/inc.jsp"></jsp:include>

<script language="javascript" type="text/javascript">
var s = new Object();   
	s.type = "ok";       
	sy.setWinRet(s);
var layer;
 $(function() {
     layui.use(['layer'], function () {
         layer=layui.layer;
     })
	var v_ajhyjlid = $("#ajhyjlid").val();
	if (v_ajhyjlid == null || v_ajhyjlid == "" 
		|| v_ajhyjlid.length == 0){
		$("#lcwmbBtn").linkbutton('disable');	
		$("#printBtn").linkbutton('disable');
	}else{
		$("#lcwmbBtn").linkbutton('enable');	
		$("#printBtn").linkbutton('enable');
	}
	
});
function mysave() { 
	//下面的例子演示了如何提交一个有效并且避免重复提交的表单url: basePath+'/pub/zfwslaspb/savezfwslaspb';
	parent.$.messager.progress({
		text : '正在提交....'
	});
	$('#myform').form('submit',
			{
				url : basePath + '/pub/wsgldy/savezfws',
				onSubmit : function() {
					var isValid = $(this).form('validate');// 做form字段验证,返回true表示所有字段合法  ,返回false将停止form提交. 
					if (!isValid) {
						parent.$.messager.progress('close'); // 如果表单是无效的则隐藏进度条 
					}
					return isValid;
				},
				success : function(result) {
					parent.$.messager.progress('close');// 隐藏进度条  
					result = $.parseJSON(result);
					if (result.code == '0') {
						$("#ajhyjlid").val(result.ajhyjlid);
						$("#saveBtn").linkbutton('disable');
			 			$("#lcwmbBtn").linkbutton('enable');
			 			$("#printBtn").linkbutton('enable');
				 		alert("保存成功！");
				 	 
					} else {
						alert('提示', '保存失败：' + result.msg );
					}
				}
			}); 
} 
  function myprint(){
	 var obj = new Object();
	    var ajdjid=$("#ajdjid").val();
	    var v_ajhyjlid=$("#ajhyjlid").val();
		var url="<%=basePath%>pub/wsgldy/printAjhyIndex?ajdjid=" 
			+ajdjid +"&ajhyjlid="+v_ajhyjlid+"&time=" + new Date().getMilliseconds();
		//创建模态窗口
	  parent.sy.modalDialog({
          title:'打印',
          area: ['100%', '100%']
          , content: url
          ,offset:["0px"]
          , btn: [ '关闭']
      });
	}
	//保存为模板
	function saveAsMoban(){
	    var obj = new Object();
	    var v_ajdjid=$("#ajdjid").val();
	    var v_zfwsdmz=$("#zfwsdmz").val();
	    var v_ajhyjlid=$("#ajhyjlid").val();
	    
	    if (v_ajdjid==null || v_ajdjid=="" || v_ajdjid.length== 0){
	    	alert('案件登记id为空，不能另存为模板');
	    	return false;
	    } 
		var url="<%=basePath%>pub/wsgldy/zfwsmobanIndex?ajdjid="
			+v_ajdjid+"&zfwsdmz="+v_zfwsdmz+"&time="+new Date().getMilliseconds();
		//创建模态窗口
		parent.sy.modalDialog({
            title:'另存模板',
             area: ['100%', '100%']
            , content: url
            ,offset:["0px"]
            , btn: [ '保存为模板文书','关闭']
            , btn1: function (index, layero) {
				parent.window[layero.find('iframe')[0]['name']].submitForm();
            }
        });
	}
	//提取模板
	function tqMoban(){
    var obj = new Object();
    var v_zfwsdmz=$("#zfwsdmz").val();
    
	var url=encodeURI(encodeURI("<%=basePath%>pub/wsgldy/zfwsmobantqIndex?zfwsdmz="
			+v_zfwsdmz+"&zfwsdmmc=<%=v_fjcsdmmc%>&time="+new Date().getMilliseconds()));
	
	
	//创建模态窗口
		parent.sy.modalDialog({
            title:'提取模板',
            area: ['100%', '100%']
            , content: url
            , offset: ["0px"]
            , btn: ['关闭']
        },function (dialogID){
		var v_retStr = sy.getWinRet(dialogID);
		
		sy.removeWinRet(dialogID);//不可缺少
		
		if (v_retStr!=null && v_retStr.type ==='ok'){
	   	var myrow=v_retStr.data;
		parent.$.messager.progress({
			text : '数据加载中....'
		});
		var v_zfwsmbid=myrow.zfwsmbid;
		$.post('<%=basePath%>pub/wsgldy/queryZfwsmobanObj?time='+new Date().getMilliseconds(), {
			zfwsmbid : v_zfwsmbid
		}, 
		function(result) {
			if (result.code=='0') {			
				var retdata =result.data;
				//var kk=$.parseJSON(retdata);
				//$('form').form('load',retdata);
				GloballoadData(retdata);
			} else {
				parent.$.messager.alert('提示','查询模板信息失败：'+result.msg,'error');
		    }	
			parent.$.messager.progress('close');
		}, 'json');
	 }
	})
}

// 关闭并刷新父窗口
	function closeAndRefreshWindow(){
		var s = new Object();   
		s.type = "ok";      
		sy.setWinRet(s);
        parent.layer.close(parent.layer.getFrameIndex(window.name));
	}
</script>
</head>
<div style="width: 210mm; margin: 0 auto">
	<body class="b1 b2 zfwsbackgroundcolor">
		<form id="myform" method="post">
			<input id="ajdjid" name="ajdjid" type="hidden" value="<%=ajdjid%>" />
			<input id="zfwsdmz" name="zfwsdmz"  type="hidden"  value="<%=zfwsdmz %>" />
			<input id="ajhyjlid" type="hidden" name="ajhyjlid" value="${mybean.ajhyjlid}" />
			<p class="p1">
				<span class="s1">食品药品行政处罚文书</span>
			</p>
			<p class="p2">
				<span class="s1">案件合议记录</span>
			</p>
			<p class="p3" align="right">
				<span class="s2"> </span><span class="s3"> 第 页，共 页</span>
			</p>
			<hr style="height:2px;border:none;border-top:2px solid #555555;" />
			<p class="p4">
				<span class="s2">案 由： <input id="ajdjay" name="ajdjay"
					style="width: 500px;" value="${mybean.ajdjay}" />
				</span>
			</p>
			<p class="p4">
				<span class="s2">当事人： <input id="hydsr" name="hydsr"
					style="width: 500px;" value="${mybean.hydsr}" />
				</span>
			</p>
			<p class="p5">
				<span class="s2">合议时间： <input name="hysj" id="hysj" class="Wdate"
					onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
					style="width: 175px;" value="${mybean.hysj}"/>
					&times;年&times;月&times;日&nbsp;&nbsp;&nbsp;&nbsp; 
					主持人： <span	class="s3"><input type="text" id="hyzcr" name="hyzcr"
						style="width: 100px;text-align: left;" value="${mybean.hyzcr}" /></span>
						&nbsp;&nbsp;&nbsp;&nbsp; 
					地点： <span class="s3"><input type="text" id="hydd" name="hydd"
						style="width: 220px;text-align: left;" value="${mybean.hydd}" /></span>
				</span> 
			</p>
			<p class="p4">
				<span class="s2">合议人员： <span class="s3"><input
						type="text" id="hyry" name="hyry"
						style="width: 300px;text-align: left;" value="${mybean.hyry}" /></span>
					记录人： <span class="s3"><input type="text" id="hyjlr"
						name="hyjlr" style="width: 100px;text-align: left;"
						value="${mybean.hyjlr}" /></span>
				</span>
			</p>
			<p class="p4">
				<p>案情介绍：</p>
				<textarea id="hyaqjs" name="hyaqjs" 
					style="width: 770px;height: 200px;">${mybean.hyaqjs}</textarea>
			</p>
			<p class="p4">
				<p>讨论记录：</p>
				<textarea id="hytljl" name="hytljl" 
					style="width: 770px;height: 200px;">${mybean.hytljl}</textarea>
			</p>
			<p class="p4">
				<p>合议意见：</p>
				<textarea id="hyyj" name="hyyj" 
					style="width: 770px;height: 200px;">${mybean.hyyj}</textarea>
			</p>
			<p class="p4"></p>
			<p class="p4"></p>
			<p class="p4"></p>
			<p class="p4">
				<span class="s2">主持人：<span class="s3"><input
						type="text" id="hyzcrqz" name="hyzcrqz"
						style="width: 100px;text-align: left;" value="${mybean.hyzcrqz}" /></span>（签字）
					记录人：<span class="s3"><input type="text" id="hyjlrqz"
						name="hyjlrqz" style="width: 100px;text-align: left;"
						value="${mybean.hyjlrqz}" /></span>（签 字）
				</span>
			</p>
			<p class="p4">
				<span class="s2">合议人员：<span class="s3"><input
						type="text" id="hyryqz" name="hyryqz"
						style="width: 300px;text-align: left;" value=" ${mybean.hyryqz}" /></span>（签字）
				</span>
			</p>
			<p class="p6"></p>
			<p class="p7"></p>
			<hr style="height:2px;border:none;border-top:2px solid #555555;" />

			
			<table>
			   <tr align="right" style="height: 60px;">
			      <td colspan=4 align="right">
					<% if (v_canbaocun==null ||"".equals(v_canbaocun) || "1".equals(v_canbaocun)) {%>
		      		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           <a href="javascript:void(0);" id="saveBtn" class="easyui-linkbutton" onclick="mysave()"
		              data-options="iconCls:'icon-save'">保存</a>
		              <%} %>
		              
		           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		           <a href="javascript:void(0);" id="printBtn" class="easyui-linkbutton" onclick="myprint();"
		              data-options="iconCls:'icon-print'">打印</a>
		        
		              
		           <% if (v_canbaocun==null ||"".equals(v_canbaocun) || "1".equals(v_canbaocun)) {%> 
		           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
		           <a href="javascript:void(0);" id="lcwmbBtn" class="easyui-linkbutton" onclick="saveAsMoban();"
		              data-options="iconCls:'ext-icon-book_add'">另存为模板</a>
		              
		           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
		           <a href="javascript:void(0);" id="lcwBtn" class="easyui-linkbutton" onclick="tqMoban();"
		              data-options="iconCls:'ext-icon-book_go'">从模板提取</a>
		            <%}%>
		            
		           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		           	           	                
		           <a href="javascript:void(0);" id="BtnFanhui" class="easyui-linkbutton" onclick="closeAndRefreshWindow();"
		           data-options="iconCls:'icon-back'">关闭</a>	
			    </td>
			   </tr>
			</table>
		</form>
	</body>
</div>
</html>