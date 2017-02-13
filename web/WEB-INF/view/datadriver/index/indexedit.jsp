<%--
  Created by IntelliJ IDEA.
  User: dodo
  Date: 2017/1/3
  Time: 下午5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
    <title>指标编辑</title>
    <%@include file="/commons/include/form.jsp" %>
    <script type="text/javascript" src="${ctx}/js/hotent/CustomValid.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/formdata.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/subform.js"></script>
</head>
<body>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
            class="sr-only">Close</span></button>
    <h4 class="modal-title" id="myModalLabel">指标创建</h4>
</div>
<div class="modal-body">
    <div class="container-fluid">
        <form id="indexform" name="indexform" method="post" action="${ctx}/datadriver/index/save.ht"
              enctype="multipart/form-data">
            <table id="AddHandlingFee" class="table table-striped" cellpadding="0" cellspacing="0"
                   border="0"
                   type="main">
                <tr>
                    <th width="20%">指标名称:</th>
                    <td><input type="text" id="ddIndexName" name="ddIndexName"
                               value="" class="form-control"/></td>
                </tr>
                <tr>
                    <th width="20%">指标类型:</th>
                    <td>
                        <select name="ddIndexTypeId" class="form-control">
                            <option value=""></option>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th width="20%">指标属性:</th>
                    <td>
                        <select name="ddIndexProperty" class="form-control">
                            <option value=""></option>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th width="20%">最优值:</th>
                    <td><input type="text" id="ddIndexOptimum" name="ddIndexOptimum"
                               value="" class="form-control"/></td>
                </tr>
                <tr>
                    <th width="20%">灵敏度:</th>
                    <td>
                        <input type="text" name="ddIndexSensitiveness" id="ddIndexSensitiveness"
                               value="" class="form-control"/>
                    </td>
                </tr>
                <tr>
                    <th width="20%">最新值:</th>
                    <td><input type="text" id="ddIndexLastestValue" name="ddIndexLastestValue"
                               value="" class="form-control"/></td>
                </tr>
            </table>
            <input id="ddIndexProjectId" name="ddIndexProjectId" type="hidden" value="${projectId}"/>
        </form>
        <div class="row">
            <div class="col-xs-6">
                <input class="btn btn-primary btn-block" id="dataFormSave" value="创建新指标"/>
            </div>
            <div class="col-xs-6">
                <input class="btn btn-default btn-block" id="" value="从模版创建指标"/>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var options = {};
        if (showResponse) {
            options.success = showResponse;
        }
        var frm = $('#indexform').form();
        $("#dataFormSave").click(function () {
            frm.setData();
            frm.ajaxForm(options);
            if (frm.valid()) {
                form.submit();
            }
        });
    });

    function showResponse(responseText) {
        var obj = new com.hotent.form.ResultMessage(responseText);
        if (obj.isSuccess()) {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
            window.location.href = "${ctx}/datadriver/index/indexlist.ht?id=${projectId}";
        } else {

        }
    }
</script>
</body>
</html>
