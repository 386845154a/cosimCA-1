/**
 * Created by 忠 on 2017/1/16.
 */
// <c:set var="ctx" value="${pageContext.request.contextPath}"/>
$(function () {

    //1.初始化Table
    new TableInit();
    // oTable.Init();

    // //2.初始化Button的点击事件
    new ButtonInit();
    // oButtonInit.Init();

});


function TableInit() {
    // var oTableInit = new Object();
    //初始化Table

    $('#tb_departments').bootstrapTable({
        classes: "table table-condensed table-hover",
        method: 'get',                      //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 15,                       //每页的记录行数（*）
        searchOnEnterKey: true,
        queryParamsType: '',
        pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
        search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: false,
        showColumns: false,                  //是否显示所有的列
        showRefresh: false,                  //是否显示刷新按钮
        minimumCountColumns: 1,             //最少允许的列数
        clickToSelect: false,                //是否启用点击选中行
        uniqueId: "ToolID",                     //每一行的唯一标识，一般为主键列
        showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: true,                   //是否显示父子表
        height: getHeight(),                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        columns: [
            {//第一列，工具名称
                field: 'ToolID',
                title: '工具ID',
                sortable: false,
                editable: false,
                align: 'center',
                visible: false
            }, {//第二列，工具地址
                field: 'ToolUrl',
                title: '工具地址',
                sortable: false,
                editable: false,
                // footerFormatter: ddDataNameFormatter,
                align: 'center',
                visible: false
            }, {//第三列，工具版本
                field: 'ToolVersion',
                title: '工具版本',
                sortable: false,
                editable: false,
                // footerFormatter: ddDataNameFormatter,
                align: 'center',
                visible: false
            }, {//第四列，ID
                field: 'ToolName',
                title: '工具名称',
                sortable: true,
                editable: false,
                // footerFormatter: ddDataNameFormatter,
                align: 'center',
                visible: true
            }, {//第五列，名称
                field: 'Toolbz',
                title: '备注',
                sortable: false,
                editable: false,
                // footerFormatter: ddDataNameFormatter,
                align: 'center',
                visible: true
            },
        ], onExpandRow: function (index, row, $detail) {
            InitSubTable(index, row, $detail);
        },
    });

    function InitSubTable(index, row, $detail) {
        var parentid = row.ToolID;
        var cur_table = $detail.html('<table></table>').find('table');
        // alert(row.ToolName);
        $(cur_table).bootstrapTable({
            url: 'showtools.ht?major=' + row.ToolName + '&son=' + 2,
            method: 'get',
            queryParams: {strParentID: parentid},
            ajaxOptions: {strParentID: parentid},
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            // pagination: true,                   //是否显示分页（*）
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            clickToSelect: true,
            detailView: false,//父子表
            uniqueId: "MENU_ID",
            pageSize: 10,
            pageList: [10, 25],
            columns: [{
                checkbox: true
            }, {
                field: 'ToolName',
                title: '工具名称',
                sortable: true,
                editable: false,
                // footerFormatter: ddDataNameFormatter,
                align: 'center',
                visible: false
            }, {
                field: 'ToolVersion',
                title: '工具版本',
                sortable: true,
                editable: false,
                // footerFormatter: ddDataNameFormatter,
                align: 'center',
                visible: true
            },
                {//第五列，名称
                    field: 'Toolbz',
                    title: '备注',
                    sortable: false,
                    editable: false,
                    // footerFormatter: ddDataNameFormatter,
                    align: 'center',
                    visible: true
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    events: operateEvents,
                    formatter: operateFormatter(),
                    visible: true
                },
            ],
            //
            //无线循环取子表，直到子表里面没有记录
            onExpandRow: function (index, row, $Subdetail) {
                InitSubTable(index, row, $Subdetail);
            },
            onClickRow: function (row, tr) {
                // alert(row.ToolUrl);
                // window.location.href="gettool.ht?major="+row.ToolUrl+"&name="+row.ToolName;
            }


        });
    };
};
//注册加载子表的事件。注意下这里的三个参数！
//原始操作按钮
function operateFormatter(value, row, index) {
    return [
        '<a id="removetr" class="remove" href="javascript:void(0)" title="删除">',
        '<i class="glyphicon glyphicon-remove"></i>',
        '</a>',
        '<a id="download0" class="download" href="javascript:void(0)" title="下载">',
        '<i class="glyphicon glyphicon-download-alt"></i>',
        '</a>'
    ].join('');
}
window.operateEvents = {
    'click .remove': function (e, value, row, index) {
        // $table.bootstrapTable('remove', {
        //     field: 'ddIndexId',
        //     values: [row.ddIndexId],
        // });
        // alert(row.ToolID);
        $.get('remove.ht?id=' + row.ToolID);
        $("#tb_departments").bootstrapTable("refresh");
        // window.location.href="remove.ht?id=" + 1;
    }
    ,

    'click .download': function (e, value, row, index) {
        window.location.href = "gettool.ht?major=" + row.ToolUrl + "&name=" + row.ToolName;
    }

};

//设置table高度
function getHeight() {
    return $(window).height() - $('.panel-heading').outerHeight(true) - 120;
}

var ButtonInit = function ButtonInit() {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件

    };

    return oInit;
};