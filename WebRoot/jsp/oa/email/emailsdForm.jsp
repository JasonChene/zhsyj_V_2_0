<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/sicp3.tld" prefix="sicp3"%>
<%@ page import="com.zzhdsoft.mvc.GlobalConfig,com.zzhdsoft.utils.SysmanageUtil" %>
<%@ page import="com.zzhdsoft.siweb.entity.news.News"%>
<%@ page import="com.zzhdsoft.utils.StringHelper"%>
<%@ page import="com.zzhdsoft.utils.db.DbUtils" %>
<% 
	String contextPath = request.getContextPath();
	String basePath = GlobalConfig.getAppConfig("apppath");
	String id=DbUtils.getSequenceStr();
	if (null==basePath || "".equals(basePath)){
		 basePath = request.getScheme() + "://"	+ request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
	}
	String oaemailid = StringHelper.showNull2Empty(request.getParameter("oaemailid"));
	String oaemailmanid = StringHelper.showNull2Empty(request.getParameter("oaemailmanid"));
	String op = StringHelper.showNull2Empty(request.getParameter("op"));
%>
<!DOCTYPE html>
<html>
<head>
<title>站内信收件管理</title>
	<jsp:include page="${contextPath}/inc.jsp"></jsp:include>
	<jsp:include page="${contextPath}/inc_ztree.jsp"></jsp:include>
<style type="text/css">

 </style>

<script type="text/javascript">
    var form; // form表单（查询条件）
    var layer; // 弹出层
    var laydate;
    var element;
    var mask;
    var table;
    var selectTableDataId = '';
	$(function() {
        layui.use(['form', 'layer','table','element', 'laydate'], function () {
            form = layui.form;
            layer = layui.layer;
            laydate = layui.laydate;
            fjqt();
            var url = basePath + '/oaeamil/backOaemail';
            form.on('submit(save)', function (data) {
                var formData = data.field;
                $.post(url, formData, function (result) {
                    result = $.parseJSON(result);
                    if (result.code == '0') {
                        layer.msg('保存成功', {time: 1000}, function () {
                            var obj = new Object();
                            obj.type = "ok";
                            sy.setWinRet(obj);
                            closeWindow();
                        });
                    } else {
                        layer.open({
                            title: '提示'
                            , content: '保存失败' + result.msg
                        });
                    }
                });
                return false; // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });
        });
       if ($('#oaemailid').val().length > 0) {
            $.post(basePath + '/oaeamil/queryOaemailGetDTO', {
                    oaemailid: $('#oaemailid').val()
                },
                function (result) {
                    if (result.code == '0') {
                        var mydata = result.data;
                        $('#emailcontentold').val(mydata.emailcontent);
                        $('#aae011').val(mydata.aae011);

                    } else {
                        layer.open({
                            title: "提示",
                            content: "查询失败：" + result.msg //这里content是一个普通的String
                        });
                    }
                }, 'json');

        }

	});

    var submitForm = function () {
        $("#saveTaskBtn").click();
    };

    function uploadFjViewqt(type) {
		var fjwid='<%=id%>';
        var url = basePath + "jsp/pub/egovernment/uploadViewWare.jsp";
        parent.sy.modalDialog({
            area: ['100%', '100%'],
            title: '上传其它附件'
            , content: url
            , param: {
                folderName: "writing",
                fjwid: fjwid,
                fjtype: type
            }
        }, function (dialogID) {
            var obj = sy.getWinRet(dialogID);
            if (obj == null || obj == '') {
                return;
            }
            if (obj.type == "ok") {
                var myrow = obj.data;
                /*$("#ceshi").html(myrow.fjpath);*/ //人员id
                var html = $("#ceshi").html();
                html += "<a href='javascript:;' onclick=check('" + myrow.fjpath + "')>" + obj.fjname + "</a></br>";
                $("#ceshi").html(html);
            }
            sy.removeWinRet(dialogID);//不可缺少
            if (obj != null) {
                if (obj.type == 'ok') {
                    //
                }
            }
        });
    }
    function fjqt() {
        var html = "";
		var fjwid='<%=oaemailid%>';
        $.ajax({
            type: 'POST',
            url: basePath + '/workflow/FJ',
            dataType: 'json',
            data: {fjwid: fjwid,
                fjtype:'GWQTFJ'
            },
            async: false,
            success: function (result) {
                var mydata = result.data;
                if(mydata.length==0){
                    $.ajax({
                        type: 'POST',
                        url: basePath + '/oaeamil/updateoaemailman',
                        dataType: 'json',
                        data: {oaemailmanid: '<%=oaemailmanid%>'
                        },
                        async: false,
                        success: function (result) {
                        }
                    });
				}
                for (var i = 0; i < mydata.length; i++) {
                    var a = mydata[i].fjname;
                    var b = mydata[i].fjpath;
                    html += "<a href='javascript:;' onclick=check('" + b + "')>" + a + "</a></br>";

                }
            }
        });
        $("#ceshinew").html(html);
    }

    function closeWindow(){
        parent.layer.close(parent.layer.getFrameIndex(window.name));
    }

    function check(s) {
        $.ajax({
            type: 'POST',
            url: basePath + '/oaeamil/updateoaemailman',
            dataType: 'json',
            data: {oaemailmanid: '<%=oaemailmanid%>'
            },
            async: false,
            success: function (result) {
            }
        });
        window.open(s);

    }

    function closeModalDialogCallback(dialogID) {
        var obj = sy.getWinRet(dialogID);
        sy.removeWinRet(dialogID);
        if (obj == null || obj == "") {
            return;
        }
        if (obj.type == "ok") {
            //其他在本页刷新
            $("#hf").html("已回复");
        }
    }
</script>
</head>
<body>
<div class="layui-table">
	<div region="center" style="overflow: hidden;" border="false">
		<form id="fm" class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-input-inline">
					<input type="hidden" id="oaemailid" name="oaemailid"  style="width: 300px" value="<%=oaemailid%>"
						   class="layui-input layui-bg-gray">
					<input type="hidden" id="id" name="id"  style="width: 300px" value="<%=id%>"
						   class="layui-input layui-bg-gray">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">站内信内容:</label>
				<div height="100px" class="layui-input-inline" style="width: 650px">
					<textarea class="layui-textarea" id="emailcontentold" name="emailcontentold" cols="20" lay-verify="required"
							  rows="3"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" >附件:</label>

				<div class="layui-input-inline" style="width: 250px">
					<span id="ceshinew"></span>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">发送人:</label>
				<div class="layui-input-inline">
					<input type="text" id="aae011" name="aae011"
						   autocomplete="off" class="layui-input" readonly="readonly" lay-verify="required">
					<input type="hidden" id="zxrUserid" name="zxrUserid">

				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">回复内容:</label>
				<div height="100px" class="layui-input-inline" style="width: 650px">
					<textarea class="layui-textarea" id="emailcontent" name="emailcontent" cols="20" lay-verify="required"
							  rows="3"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" >附件:</label>

				<div class="layui-input-inline" style="width: 250px">
					<div id="c">
						<a id="btnselectcomnew1" href="javascript:void(0)"
						   class="layui-btn" iconCls="icon-upload"
						   onclick="uploadFjViewqt('GWQTFJ')">上传附件</a><br/>
					</div>
					<span id="ceshi"></span>
				</div>
			</div>



			<div class="layui-form-item" style="display: none">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="save"
							id="saveTaskBtn">保存</button>
				</div>
			</div>
		</form>
	</div>
</div>
	
</body>
</html>