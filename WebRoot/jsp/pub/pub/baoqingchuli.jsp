<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/sicp3.tld" prefix="sicp3"%>
<%@ page import="com.zzhdsoft.mvc.GlobalConfig,com.zzhdsoft.utils.SysmanageUtil"%>
<%@ page import="com.zzhdsoft.utils.StringHelper,java.util.List,java.net.URLDecoder"%>
<%
	String contextPath = request.getContextPath();
	String basePath = GlobalConfig.getAppConfig("apppath");
	if (null == basePath || "".equals(basePath)) {
		basePath = request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath() + "/";
	}
	//String v_qtbid = StringHelper.showNull2Empty(request.getParameter("qtbid"));
	//String v_fsxtbz=URLDecoder.decode(StringHelper.showNull2Empty(request.getParameter("fsxtbz")),"utf-8");//发送者系统级备注
	//String v_opkind=StringHelper.showNull2Empty(request.getParameter("opkind"));//操作类型1报请2已阅
%>
<!DOCTYPE html>
<html>
<head>

<title>待办事项</title>
<jsp:include page="${contextPath}/inc.jsp"></jsp:include>
<script type="text/javascript">
	var table;
	$(function() {

		layui.use(['element','table'], function() {
			var element = layui.element;
			table=layui.table;

			table.render({
				elem: '#jieshouren_table'
				, url: basePath + '/pub/pub/queryChayueWei?jsbz=0'
				, page: true // 展示分页
				, limit: 10 // 每页展示条数
				, limits: [10, 20, 30] // 每页条数选择项
				, request: {
					pageName: 'page' //页码的参数名称，默认：page
					, limitName: 'rows' //每页数据量的参数名，默认：limit
				}
				, response: {
					countName: 'total' //数据总数的字段名称，默认：count
					, dataName: 'rows' //数据列表的字段名称，默认：data
				}
				, cols: [[
					{field: 'fsorgname', width: 200, title: '发起人所属机构名称', event: 'trclick'}
					, {field: 'fsusername', width: 200, title: '发起人姓名', event: 'trclick'}
					, {field: 'fssj', width: 200, title: '发起时间', event: 'trclick'}
					, {field: 'fsxtbz', width: 200, title: '备注', event: 'trclick'}
					, {field: 'fsnr', width: 200, title: '发送内容', event: 'trclick'}
					, {field: 'jsorgname', width: 200, title: '接收人所属机构', event: 'trclick'}
					, {field: 'jsusername', width: 200, title: '接收人姓名', event: 'trclick'}
					, {field: 'jssj', width: 200, title: '已阅时间', event: 'trclick'}
					, {field: 'jsclyj', width: 200, title: '已阅处理意见', event: 'trclick'}
                    ,{fixed: 'right', width:150, align:'center', toolbar: '#jieshouren_barDemo'} //这里的toolbar值是模板元素的选择器
				]]
				, done: function (res, curr, count) {
				}

			});

            table.render({
                elem: '#jieshouren_table_yi'
                , url: basePath + '/pub/pub/queryChayueWei?jsbz=1'
                , page: true // 展示分页
                , limit: 10 // 每页展示条数
                , limits: [10, 20, 30] // 每页条数选择项
                , request: {
                    pageName: 'page' //页码的参数名称，默认：page
                    , limitName: 'rows' //每页数据量的参数名，默认：limit
                }
                , response: {
                    countName: 'total' //数据总数的字段名称，默认：count
                    , dataName: 'rows' //数据列表的字段名称，默认：data
                }
                , cols: [[
                    {field: 'fsorgname', width: 200, title: '发起人所属机构名称', event: 'trclick'}
                    , {field: 'fsusername', width: 200, title: '发起人姓名', event: 'trclick'}
                    , {field: 'fssj', width: 200, title: '发起时间', event: 'trclick'}
                    , {field: 'fsxtbz', width: 200, title: '备注', event: 'trclick'}
                    , {field: 'fsnr', width: 200, title: '发送内容', event: 'trclick'}
                    , {field: 'jsorgname', width: 200, title: '接收人所属机构', event: 'trclick'}
                    , {field: 'jsusername', width: 200, title: '接收人姓名', event: 'trclick'}
                    , {field: 'jssj', width: 200, title: '已阅时间', event: 'trclick'}
                    , {field: 'jsclyj', width: 200, title: '已阅处理意见', event: 'trclick'}
//                    ,{fixed: 'right', width:150, align:'center', toolbar: '#jieshouren_yi_barDemo'} //这里的toolbar值是模板元素的选择器
                ]]
                , done: function (res, curr, count) {
                }

            });
            table.on('tool(jieshouren_table)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                if('yiyue'===layEvent){//已阅
                    chayue(data.pdbsxjsrid,data.jsclyj);
                }
                if('huifu'===layEvent){//回复
                    huifu(data.pdbsxjsrid,data.jsclyj);
                }
            });
		});







		//案件承办人
		/*var v_jieshouren_table = $("#jieshouren_table");
		v_jieshouren_table.datagrid({
			title : '未阅记录',
			//iconCls : 'icon-tip',
			url : basePath + '/pub/pub/queryChayueWei?jsbz=0',
			nowrap : false,
			striped : true, //奇偶行使用不同的颜色
			singleSelect : false, // 只允许选择一行
			checkOnSelect : true, //当用户点击行的时候就选中
			selectOnCheck : true, //单击复选框将选择行
			pagination : true, //底部显示分页栏
			pageSize : 10, //每页显示的页数
			pageList : [ 10, 20, 30 ], //每页显示的页数（供选择）
			rownumbers : true, //是否显示行号
			fitColumns : false, //列自适应宽度  防止滚动
			idField : 'pdbsxjsrid', //该列是一个唯一列 也是数据库中的表的主键
			sortOrder : 'asc', //按升序排序
			columns : [ [
			 {field:'opt',title:'操作',align:'left',width:110,
	              formatter:function(value,rec){
			    	  var v_OperRet='';
			    	  if (rec.jsbz==null || rec.jsbz==''||rec.jsbz=='0') {
			    		  v_OperRet+='<a href="javascript:chayue(\''+rec.pdbsxjsrid+'\',\''+rec.jsclyj+'\')" mce_href="#"><img src="../../images/pub/ok.png" align="absmiddle">查阅</a>&nbsp;';
			    		  v_OperRet+='<a href="javascript:huifu(\''+rec.pdbsxjsrid+'\',\''+rec.jsclyj+'\')" mce_href="#"><img src="../../images/pub/rollback2.png" align="absmiddle">回复</a>&nbsp;';
			    	  }

			    	  return v_OperRet;
	             }
		     },{
				title : '发起人所属机构名称',
				field : 'fsorgname',
				width : 120,
				hidden : false
			}, {
				title : '待办事项表主键',
				field : 'pdbsxid',
				width : 50,
				hidden : true
			}, {
				title : '待办事项接收人ID',
				field : 'pdbsxjsrid',
				width : 50,
				hidden : true
			}, {
				title : '发起人姓名',
				field : 'fsusername',
				align : 'center',
				width : 70
			}, {
				title : '发起人时间',
				field : 'fssj',
				align : 'center',
				width : 120
			}, {
				title : '备注',
				field : 'fsxtbz',
				width : 90,
				hidden : false
			}, {
				title : '发送内容',
				field : 'fsnr',
				width : 200
			}, {
				title : '接收人所属机构',
				field : 'jsorgname',
				width : 120,
				hidden : false
			}, {
				title : '接收人姓名',
				field : 'jsusername',
				width : 70,
				hidden : false
			}, {
				title : '已阅标志',
				field : 'jsbz',
				width : 60,
				hidden : true
			}, {
				title : '已阅时间',
				field : 'jssj',
				width : 120,
				hidden : false
			}, {
				title : '已阅处理意见',
				field : 'jsclyj',
				width : 260,
				hidden : false
			}]]
		});
*/
		//案件承办人
		/*var v_jieshouren_table_yi = $("#jieshouren_table_yi");
		v_jieshouren_table_yi.datagrid({
			title : '已阅记录',
			//iconCls : 'icon-tip',
			url : basePath + '/pub/pub/queryChayueWei?jsbz=1',
			nowrap : false,
			striped : true, //奇偶行使用不同的颜色
			singleSelect : false, // 只允许选择一行
			checkOnSelect : true, //当用户点击行的时候就选中
			selectOnCheck : true, //单击复选框将选择行
			pagination : true, //底部显示分页栏
			pageSize : 10, //每页显示的页数
			pageList : [ 10, 20, 30 ], //每页显示的页数（供选择）
			rownumbers : true, //是否显示行号
			fitColumns : false, //列自适应宽度  防止滚动
			idField : 'pdbsxjsrid', //该列是一个唯一列 也是数据库中的表的主键
			sortOrder : 'asc', //按升序排序
			columns : [ [ {
				title : '发起人所属机构名称',
				field : 'fsorgname',
				width : 120,
				hidden : false
			}, {
				title : '待办事项表主键',
				field : 'pdbsxid',
				width : 50,
				hidden : true
			}, {
				title : '待办事项接收人ID',
				field : 'pdbsxjsrid',
				width : 50,
				hidden : true
			}, {
				title : '发起人姓名',
				field : 'fsusername',
				align : 'center',
				width : 70
			}, {
				title : '发起时间',
				field : 'fssj',
				align : 'center',
				width : 120
			}, {
				title : '备注',
				field : 'fsxtbz',
				width : 90,
				hidden : false
			}, {
				title : '发送内容',
				field : 'fsnr',
				width : 200
			}, {
				title : '接收人所属机构',
				field : 'jsorgname',
				width : 120,
				hidden : false
			}, {
				title : '接收人姓名',
				field : 'jsusername',
				width : 70,
				hidden : false
			}, {
				title : '已阅时间',
				field : 'jssj',
				width : 120,
				hidden : false
			}, {
				title : '已阅处理意见',
				field : 'jsclyj',
				width : 260,
				hidden : false
			}]]
		});*/
	});

	//报请 已阅
	function chayue(v_pdbsxjsrid,v_jsclyj){
	   	var url = basePath + 'pub/pub/baoqingchulidoIndex';
        parent.sy.modalDialog({
            title:'查阅'
            ,area:['100%','100%']
            , offset: '0px'
            ,param:{
                pdbsxjsrid : v_pdbsxjsrid,
                jsclyj : v_jsclyj,
                dokind : "chayue",
                time : new Date().getMilliseconds()
            }
            ,content:url
            ,btn:['已阅','关闭']
            , btn1: function (index, layero) {
                parent.window[layero.find('iframe')[0]['name']].submitForm();
            }
        },closeModalDialogCallback);


//		var dialog = parent.sy.modalDialog({
//				title : '查阅',
//				param : {
//					pdbsxjsrid : v_pdbsxjsrid,
//					jsclyj : v_jsclyj,
//					dokind : "chayue",
//					time : new Date().getMilliseconds()
//				},
//				width : 800,
//				height : 260,
//				url : url
//		},function(dialogID) {
//			$("#jieshouren_table").datagrid('reload');
//			$("#jieshouren_table_yi").datagrid('reload');
//		    sy.removeWinRet(dialogID);//不可缺少
//		});
	}

    //子页面返回参数
    function closeModalDialogCallback(dialogID) {
        var obj = sy.getWinRet(dialogID);
        if (obj == null || obj == '') {
            return false;
        }
        sy.removeWinRet(dialogID);
        if (obj.type == "ok") {
            table.reload('jieshouren_table');
            table.reload('jieshouren_table_yi');
        }
    }

	//报请 回复
	function huifu(v_pdbsxjsrid, v_jsclyj){
	   	var url = basePath + 'pub/pub/baoqingchulidoIndex';
        parent.sy.modalDialog({
            title: '回复'
            , area: ['100%', '100%']
            , offset: '0px'
            , param: {
                pdbsxjsrid: v_pdbsxjsrid,
                jsclyj: v_jsclyj,
                dokind: "huifu",
                time: new Date().getMilliseconds()
            }
            , content: url
            ,btn:['回复','关闭']
            , btn1: function (index, layero) {
                parent.window[layero.find('iframe')[0]['name']].submitForm();
            }
        },closeModalDialogCallback);
//		var dialog = parent.sy.modalDialog({
//				title : '回复',
//				param : {
//					pdbsxjsrid : v_pdbsxjsrid,
//					jsclyj : v_jsclyj,
//					dokind : "huifu",
//					time : new Date().getMilliseconds()
//				},
//				width : 800,
//				height : 260,
//				url : url
//		},function(dialogID) {
//			$("#jieshouren_table").datagrid('reload');
//			$("#jieshouren_table_yi").datagrid('reload');
//		    sy.removeWinRet(dialogID);//不可缺少
//		});
	}

</script>

    <%--<script type="text/html" id="jieshouren_yi_barDemo">--%>
        <%--<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>--%>
        <%--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
        <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>

    <%--</script>--%>

</head>
<%--class="easyui-layout"--%>
<body  >

<div class="layui-tab" lay-filter="demo">
    <ul class="layui-tab-title">
        <li class="layui-this">未阅</li>
        <li>已阅</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <table id="jieshouren_table" class="layui-hide" lay-filter="jieshouren_table"></table>
            <div id="jieshouren_barDemo" lay-filter="jieshouren_barDemo" style="display: none">
                <a class="layui-btn layui-btn-xs" lay-event="yiyue">已阅</a>
                <a class="layui-btn layui-btn-xs" lay-event="huifu">回复</a>
            </div>
        </div>
        <div class="layui-tab-item">
            <table id="jieshouren_table_yi" class="layui-hide" lay-filter="jieshouren_table_yi"></table>
        </div>
    </div>
</div>






	<%--<form id="myform" method="post">--%>
		<%--<div region="center">--%>
			<%--<div id="tt" class="easyui-tabs" data-options="fit:true"  >--%>
			    <%--<div title="未阅" style="overflow:auto;padding:2px;">--%>
					<%--<div id="jieshouren_table" fit="true" ></div>--%>
			    <%--</div>--%>
			    <%--<div title="已阅" style="overflow:auto;padding:2px;">--%>
					<%--<div id="jieshouren_table_yi" fit="true" ></div>--%>
			    <%--</div>					    --%>
			<%--</div>					--%>
	   <%--</div>--%>
	<%--</form>--%>
</body>
</html>