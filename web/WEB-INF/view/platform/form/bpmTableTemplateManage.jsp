<%@page import="com.hotent.platform.model.system.GlobalType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.hotent.platform.model.form.BpmTableTemprights"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
    <title>业务数据模板管理</title>
    <%@include file="/commons/include/form.jsp" %>
    <link rel="stylesheet" href="${ctx}/js/tree/v35/zTreeStyle.css" type="text/css" />
    <script type="text/javascript" src="${ctx}/js/lg/plugins/ligerMenu.js"></script>
    <script type="text/javascript" src="${ctx}/js/tree/v35/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/lg/plugins/ligerLayout.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/platform/system/SysDialog.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/platform/form/GlobalType.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/platform/system/GlobalMenu.js"></script>
    <script type="text/javascript" src="${ctx}/js/hotent/platform/bpm/FlowRightDialog.js"></script>
    <style type="text/css">
            .tree-title{overflow:hidden;width:100%;}
            body{overflow: hidden;}
        </style>
    <script type="text/javascript">
                var catKey="<%=GlobalType.CAT_FORM%>";              
                var flowTypeMenu=new FlowTypeMenu();
                var curMenu=null;
                var globalType=new GlobalType(catKey,"glTypeTree",
                        {
                            onClick:onClick,
                            onRightClick:zTreeOnRightClick,
                            url:'${ctx}/platform/system/globalType/getByCatKeyForForm.ht',
                            expandByDepth:1
                        });
                
                $(function (){
                    //布局
                    $("#defLayout").ligerLayout({ leftWidth:210,height: '100%',allowLeftResize:false});
                    //加载菜单 
                    globalType.loadGlobalTree();
                    $(document).click(hiddenMenu);
                });
                
                function hiddenMenu(){
                    if(curMenu){
                        curMenu.hide();
                    }
                }
                
                function handler(item){
                    hiddenMenu();
                    var txt=item.text;
                    switch(txt){
                        case "增加分类":
                            globalType.openGlobalTypeDlg(true);
                            break;
                        case "编辑分类":
                            globalType.openGlobalTypeDlg(false);
                            break;
                        case "删除分类":
                            globalType.delNode();
                            break;
                        case "分类权限管理":
                            assignRights();
                            break;
                    }
                }

                /**
                 * 树右击事件
                 */
                function zTreeOnRightClick(event, treeId, treeNode) {
                    
                    if (treeNode) {
                        globalType.currentNode=treeNode;
                        globalType.glTypeTree.selectNode(treeNode);
                        curMenu=flowTypeMenu.getMenu(treeNode, handler);
                        curMenu.show({ top: event.pageY, left: event.pageX });
                    }
                };
                
                //左击
                function onClick(treeNode){
                    var typeId=treeNode.typeId;                 
                    var url="${ctx}/platform/form/bpmTableTemplate/list.ht?typeId="+typeId;
                    $("#defFrame").attr("src",url);
                };
                //展开收起
                function treeExpandAll(type){
                    globalType.treeExpandAll(type);
                };
                
                //对流程分类分配权限。
                function assignRights(){
                    var node=globalType.currentNode;
                    if(node!=null && node!=undefined){
                        if(node.isRoot==undefined){
                            var typeId=node.typeId;
                            FlowTemplateDialog(typeId,1);
                        }
                    }
                }

                function SetWinHeight(obj) 
                { 
                var win=obj; 
                if (document.getElementById) 
                { 
                    if (win && !window.opera) 
                    { 
                        if (win.contentDocument && win.contentDocument.body.offsetHeight) 
                            win.height = win.contentDocument.body.offsetHeight + 30; 
                        else if(win.Document && win.Document.body.scrollHeight) 
                            win.height = win.Document.body.scrollHeight + 30; 
                    }
                    // console.log("第二层iframe的高度为" + win.height);
                    // window.parent.document.getElementById("manager_right").height = win.height;
                    $("#defcenter").height(win.height);
                    $("#defconfcenter").height(win.height);
                    // $("#defconfleft").height(win.height);
                    $("#defLayout").height(win.height);
                    $("#all").height(win.height);     
                } 
                } 
            
         </script>
</head>
<body>
    <div class="panel" id="all">
        <div id="defLayout" class="panel-top">
            <div position="left" title="表单类型分类管理" style="overflow: auto;float:left;width:100%">
                <div class="tree-toolbar">
                    <span class="toolBar">
                        <div class="group">
                            <a class="link reload" id="treeFresh" href="javascript:globalType.loadGlobalTree();;">刷新</a>
                        </div>
                        <div class="l-bar-separator"></div>
                        <div class="group">
                            <a class="link expand" id="treeExpandAll" href="javascript:treeExpandAll(true)">展开</a>
                        </div>
                        <div class="l-bar-separator"></div>
                        <div class="group">
                            <a class="link collapse" id="treeCollapseAll" href="javascript:treeExpandAll(false)">收起</a>
                        </div>
                    </span>
                </div>
                <ul id="glTypeTree" class="ztree"></ul>
            </div>
            <div position="center" title="业务数据模板管理" id="defcenter">
                <iframe id="defFrame" frameborder="0" scrolling="no" src="${ctx}/platform/form/bpmTableTemplate/list.ht" style="width:100%;" onload="Javascript:SetWinHeight(this)"></iframe>
            </div>
        </div>
    </div>

</body>
</html>