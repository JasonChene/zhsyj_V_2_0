<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="/WEB-INF/sicp3.tld" prefix="sicp3"%>
<%@ page import="com.zzhdsoft.mvc.GlobalConfig,com.zzhdsoft.utils.SysmanageUtil" %>
<%@ page import="com.askj.zfba.dto.Zfwscfkywpyjtzs6DTO" %>
<%@ page import="com.zzhdsoft.utils.StringHelper,java.util.List,java.net.URLDecoder"%>
<% 
	String contextPath = request.getContextPath();
	String basePath = GlobalConfig.getAppConfig("apppath");
	if (null==basePath || "".equals(basePath)){
		 basePath = request.getScheme() + "://"	+ request.getServerName() 
		 	+ ":" + request.getServerPort() + request.getContextPath() + "/";
	}
	
	String op = StringHelper.showNull2Empty(request.getParameter("op"));
	// 案件登记id
	String v_ajdjid = StringHelper.showNull2Empty(request.getParameter("ajdjid"));
	// 执法文书所在表id
	String v_zfwsqtbid = StringHelper.showNull2Empty(request.getParameter("zfwsqtbid"));
	// 执法文书编号
	String v_zfwsdmz = StringHelper.showNull2Empty(request.getParameter("zfwsdmz"));
	// 附件参数代码名称
	String v_fjcsdmmc = URLDecoder.decode(StringHelper.showNull2Empty(request.getParameter("fjcsdmmc")),"UTF-8");
	// 是否可以保存0否1是
	String v_canbaocun = StringHelper.showNull2Empty(request.getParameter("canbaocun"));
	// 执法文书表主键，用于更新填写标识
	String v_ajzfwsid = StringHelper.showNull2Empty(request.getParameter("ajzfwsid"));	
	// 执法文书查封扣押物品移交通知书
	Zfwscfkywpyjtzs6DTO localZfwscfkywpyjtzs6DTO=new Zfwscfkywpyjtzs6DTO();
    if (request.getAttribute("mybean") != null) {
    	localZfwscfkywpyjtzs6DTO = (Zfwscfkywpyjtzs6DTO) request.getAttribute("mybean");
    }	
%>
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=GB2312">
<jsp:include page="${contextPath}/inc.jsp"></jsp:include>

<style type="text/css">.b1{white-space-collapsing:preserve;}
.b2{margin: 1.0in 1.25in 1.0in 1.25in;}
.s1{color:black;line-height:1.5em;}
.s2{font-weight:bold;color:black;}
.s3{color:black;}
.p1{text-align:justify;hyphenate:auto;font-family:宋体;font-size:12pt;}
.p2{text-align:center;hyphenate:auto;font-family:黑体;font-size:16pt;}
.p3{text-align:center;hyphenate:auto;font-family:宋体;font-size:22pt;}
.p4{margin-right:0.038194444in;margin-top:0.108333334in;text-align:end;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;margin-left:380px;}
.p5{text-indent:0.072916664in;margin-top:0.06944445in;text-align:start;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;}
.p6{text-indent:0.29166666in;margin-left:0.072916664in;text-align:start;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;}
.p7{margin-top:0.108333334in;text-align:start;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;}
.p8{margin-right:0.33333334in;margin-top:0.108333334in;text-align:start;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;}
.p9{margin-right:0.038194444in;margin-top:0.108333334in;text-align:justify;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;margin-left:540px;}
.p10{margin-top:0.108333334in;text-align:justify;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;margin-left:460px;}
.p11{margin-top:0.108333334in;text-align:start;hyphenate:auto;font-family:仿宋_GB2312;font-size:7pt;}
.p12{text-indent:0.06944445in;margin-top:0.108333334in;text-align:start;hyphenate:auto;font-family:仿宋_GB2312;font-size:10pt;}
.p13{text-align:justify;hyphenate:auto;font-family:Times New Roman;font-size:10pt;}
</style>
<meta content="Administrator" name="author">

<title>查封(扣押)物品移交通知书</title>
<meta content="X" name="author">


<script type="text/javascript">
var s = new Object();   
	s.type = "";   //设为空不刷新父页面
	sy.setWinRet(s);
var mygrid;
$(function() {
	var v_cfkyyjid=$("#cfkyyjid").val();
	if (v_cfkyyjid==null || v_cfkyyjid=="" || v_cfkyyjid.length== 0){
		$("#lcwmbBtn").linkbutton('disable');	
		$("#printBtn").linkbutton('disable');
	}else{
		$("#lcwmbBtn").linkbutton('enable');	
		$("#printBtn").linkbutton('enable');
	}
});
/**
 * 保存
 */
function mysave(){
		var url= basePath+'/pub/wsgldy/saveZfwscfkywpyjtzs';

		//下面的例子演示了如何提交一个有效并且避免重复提交的表单
	     parent.$.messager.progress({
			text : '正在提交....'
		});	// 显示进度条
		
		$('#myform').form('submit',{
			url: url,
			onSubmit: function(){ 
				// 做form字段验证,返回true表示所有字段合法  ,返回false将停止form提交.
				var isValid = $(this).form('validate'); 
				if(!isValid){
					// 如果表单是无效的则隐藏进度条
					parent.$.messager.progress('close');	 
				}					
				return isValid;
	        },
	        success: function(result){
	        	parent.$.messager.progress('close');// 隐藏进度条  
	        	result = $.parseJSON(result);  
			 	if (result.code=='0'){
			 		$("#cfkyyjid").val(result.zfwszhujianid);
			 		$("#saveBtn").linkbutton('disable');
			 		$("#lcwmbBtn").linkbutton('enable');
			 		$("#printBtn").linkbutton('enable');
			 		alert("保存成功！");
              	} else {
              		alert("保存失败：" + result.msg);
                }
	        }    
		});
}
/**
 * 打印
 */	
function myprint(){
    var obj = new Object();
    // 案件登记id
    var v_ajdjid = $("#ajdjid").val();
    var v_cfkyyjid=$("#cfkyyjid").val();
 
	var url="<%=basePath%>pub/wsgldy/zfwscfkywpyjtzs6PrintIndex?ajdjid="
		+v_ajdjid+"&cfkyyjid="+v_cfkyyjid+"&time="+new Date().getMilliseconds();
   		//创建模态窗口
		var dialog = parent.sy.modalDialog({
			title : ' ',
			width : 700,
			height : 650,
			url : url
		}); 
}
/**
 * 另存为模板
 */
function saveAsMoban(){
    var obj = new Object();
    var v_ajdjid = $("#ajdjid").val();
    var v_zfwsdmz = $("#zfwsdmz").val();
    var v_cfkyyjid = $("#cfkyyjid").val();
    
    if (v_ajdjid==null || v_ajdjid=="" || v_ajdjid.length== 0){
    	alert('案件登记id为空，不能另存为模板');
    	return false;
    } 
    
	var url="<%=basePath%>pub/wsgldy/zfwsmobanIndex?ajdjid="+v_ajdjid
		+"&zfwsdmz="+v_zfwsdmz+"&time="+new Date().getMilliseconds();
		
	//创建模态窗口
	var dialog = parent.sy.modalDialog({
		title : ' ',
		width : 650,
		height : 300,
		url : url
	});
}
/**
 * 从模板提取
 */
function tqMoban(){
    var obj = new Object();
    var v_zfwsdmz = $("#zfwsdmz").val();
    
	var url = encodeURI(encodeURI("<%=basePath%>pub/wsgldy/zfwsmobantqIndex?zfwsdmz="
		+v_zfwsdmz+"&zfwsdmmc=<%=v_fjcsdmmc%>&time="+new Date().getMilliseconds()));
   
   
   	//创建模态窗口
	var dialog = parent.sy.modalDialog({
		title : ' ',
		param :obj,
		width : 900,
		height : 500,
		url : url
	},function (dialogID){
		var v_retStr = sy.getWinRet(dialogID);
		
		sy.removeWinRet(dialogID);//不可缺少
		
		if (v_retStr!=null && v_retStr.length>0){
	   	var myrow = v_retStr[0];
		parent.$.messager.progress({
			text : '数据加载中....'
		});
		var v_zfwsmbid = myrow.zfwsmbid;
		$.post('<%=basePath%>pub/wsgldy/queryZfwsmobanObj?time='+new Date().getMilliseconds(), {
			zfwsmbid : v_zfwsmbid
		}, 
		function(result) {
			if (result.code == '0') {			
				var retdata = result.data;
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
		parent.$("#"+sy.getDialogId()).dialog("close");      
	}
</script>

</head>
<div style="width: 210mm; margin: 0 auto">
<body class="b1 b2 zfwsbackgroundcolor">
	<form id="myform" method="post">
		<input id="ajdjid" name="ajdjid" type="hidden" value="<%=v_ajdjid%>" />
		<input id="cfkyyjid" name="cfkyyjid" type="hidden" value="${mybean.cfkyyjid}" />
		<input id="zfwsdmz" name="zfwsdmz" type="hidden" value="<%=v_zfwsdmz%>" />
		<input id="ajzfwsid" name="ajzfwsid" type="hidden" value="<%=v_ajzfwsid%>" />		 
<p class="p1">
<span class="s1"></span>
</p>
<p class="p2">
<span class="s2">食品药品行政处罚文书</span>
</p>

<p class="p3">
<input type="text" id="cfkytitle" name="cfkytitle" class="easyui-validatebox" 
data-options="required:true" style="width: 260px;text-align: center;" 
value="${mybean.cfkytitle}" />
</p>

<p class="p4">
<span class="s1">文书编号：
<input type="text" id="wsbh" name="wsbh" class="easyui-validatebox" 
data-options="required:true" style="width: 260px;text-align: right;" 
value="${mybean.wsbh}" />
</span>
</p>
<hr style="height:2px;border:none;border-top:2px solid #555555;" />
<p class="p5">
<span class="s3"><input type="text" id="sysbmmc" name="sysbmmc" 
			style="width: 260px;text-align: right;" class="easyui-validatebox" 
			value="${mybean.sysbmmc}"/>
</span><span class="s1">公安局：</span>
</p>
<p class="p6" >
因<input type="text" id="cfkywfxw" name="cfkywfxw" 
			style="width: 460px;text-align: right;" class="easyui-validatebox" 
			value="${mybean.cfkywfxw}"/>
的违法行为涉嫌犯罪，根据《中华人民共和国行政强制法》第二十一条的规定，我局决定对查封(扣押)的
<input type="text" id="cfkyygwp" name="cfkyygwp" 
			style="width: 560px;text-align: right;" class="easyui-validatebox" 
			value="${mybean.cfkyygwp}"/>的有关物品［见 查封(扣押)决定书编号：
<input type="text" id="cfkyjdswsbh" name="cfkyjdswsbh" 
			style="width: 360px;text-align: right;" class="easyui-validatebox" 
			value="${mybean.cfkyjdswsbh}"/>《查封(扣押)决定书》所附《查封(扣押)物品清单》］移交给你单位。
</p>
<p class="p7"></p>
<p class="p7"></p>
<p class="p7"></p>
<p class="p7"></p>
<p class="p8"></p>
<p class="p8"></p>
<br/>
<p class="p9">
<span class="s1">（公    章）</span>
</p>
<p class="p10">
<span class="s1">&times;年&times;月&times;日
<input name="cfkyyjrq" id="cfkyyjrq" 
			class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" 
			data-options="required:true" style="width: 175px;" value="${mybean.cfkyyjrq}" >
</span>
</p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p11"></p>
<p class="p12">
<span class="s1">注：抄送（当事人）<input type="text" name="cfkyyjcsr" id="cfkyyjcsr" 
			style="width: 200px;" value="${mybean.cfkyyjcsr}">，存档（1）。</span>
</p>
<p class="p13"></p>
		<hr style="height:2px;border:none;border-top:2px solid #555555;" />
		<table>
		   <tr align="right" style="height: 60px;">
		       <td  align="right">
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
	             	 data-options="iconCls:'ext-icon-book_add'">另存为模块</a>
	           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	           		<a href="javascript:void(0);" id="lcwBtn" class="easyui-linkbutton" onclick="tqMoban();"
	              	data-options="iconCls:'ext-icon-book_go'">从模板提取</a>
	            <%} %>
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
