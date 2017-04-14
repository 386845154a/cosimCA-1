<%--
  Created by IntelliJ IDEA.
  User: d
  Date: 2017/3/5
  Time: 下午3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>任务看板</title>
    <link rel="stylesheet" href="${ctx}/jqwidgets/styles/jqx.base.css" type="text/css"/>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxsortable.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxkanban.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxexpander.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxinput.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxcolorpicker.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxradiobutton.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxdropdownbutton.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="${ctx}/jqwidgets/scripts/demos.js"></script>

    <style>
        html, body {
            padding: 0;
            margin: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .jqx-kanban-item-color-status {
            width: 100%;
            height: 25px;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
            position: relative;
            margin-top: 0px;
            overflow: hidden;
            top: 0px;
        }

        .jqx-kanban-item {
            padding-top: 0px;
            padding-bottom: 0px;
        }

        .jqx-kanban-item-text {
            padding-top: 6px;
            padding-bottom: 6px;
        }

        .jqx-kanban-item-avatar {
            top: 9px;
        }

        .jqx-kanban-template-icon {
            position: absolute;
            right: 3px;
            top: 12px;
        }

    </style>
    <script type="text/javascript">
        $(document).ready(function () {

            var fields = [
                {name: "id", type: "string"},
                {name: "status", map: "state", type: "string"},
                {name: "text", map: "label", type: "string"},
                {name: "tags", type: "string"},
                {name: "color", map: "hex", type: "string"},
                {name: "resourceId", type: "number"}
            ];

            var source =
                {
                    localData: [
                        {
                            id: "1161",
                            state: "new",
                            label: "Make a new Dashboard",
                            tags: "dashboard",
                            hex: "#36c7d0",
                            resourceId: 3
                        },
                        {
                            id: "1645",
                            state: "work",
                            label: "Prepare new release",
                            tags: "release",
                            hex: "#ff7878",
                            resourceId: 1
                        },
                        {
                            id: "9213",
                            state: "new",
                            label: "One item added to the cart",
                            tags: "cart",
                            hex: "#96c443",
                            resourceId: 3
                        },
                        {
                            id: "6546",
                            state: "done",
                            label: "Edit Item Price",
                            tags: "price, edit",
                            hex: "#ff7878",
                            resourceId: 4
                        },
                        {id: "9034", state: "new", label: "Login 404 issue", tags: "issue, login", hex: "#96c443"}
                    ],
                    dataType: "array",
                    dataFields: fields
                };

            var dataAdapter = new $.jqx.dataAdapter(source);

            var resourcesAdapterFunc = function () {
                var resourcesSource =
                    {
                        localData: [
                            {id: 0, name: "No name", image: "../../jqwidgets/styles/images/common.png", common: true},
                            {id: 1, name: "Andrew Fuller", image: "../../images/andrew.png"},
                            {id: 2, name: "Janet Leverling", image: "../../images/janet.png"},
                            {id: 3, name: "Steven Buchanan", image: "../../images/steven.png"},
                            {id: 4, name: "Nancy Davolio", image: "../../images/nancy.png"},
                            {id: 5, name: "Michael Buchanan", image: "../../images/Michael.png"},
                            {id: 6, name: "Margaret Buchanan", image: "../../images/margaret.png"},
                            {id: 7, name: "Robert Buchanan", image: "../../images/robert.png"},
                            {id: 8, name: "Laura Buchanan", image: "../../images/Laura.png"},
                            {id: 9, name: "Laura Buchanan", image: "../../images/Anne.png"}
                        ],
                        dataType: "array",
                        dataFields: [
                            {name: "id", type: "number"},
                            {name: "name", type: "string"},
                            {name: "image", type: "string"},
                            {name: "common", type: "boolean"}
                        ]
                    };

                var resourcesDataAdapter = new $.jqx.dataAdapter(resourcesSource);
                return resourcesDataAdapter;
            }

            var getIconClassName = function () {
                switch (theme) {
                    case "darkblue":
                    case "black":
                    case "shinyblack":
                    case "ui-le-frog":
                    case "metrodark":
                    case "orange":
                    case "darkblue":
                    case "highcontrast":
                    case "ui-sunny":
                    case "ui-darkness":
                        return "jqx-icon-plus-alt-white ";
                }
                return "jqx-icon-plus-alt";
            }

            $('#kanban').jqxKanban({
                template: "<div class='jqx-kanban-item' id=''>"
                + "<div class='jqx-kanban-item-color-status'></div>"
                + "<div style='display: none;' class='jqx-kanban-item-avatar'></div>"
                + "<div class='jqx-icon jqx-icon-close jqx-kanban-item-template-content jqx-kanban-template-icon'></div>"
                + "<div class='jqx-kanban-item-text'></div>"
                + "<div style='display: none;' class='jqx-kanban-item-footer'></div>"
                + "</div>",
                resources: resourcesAdapterFunc(),
                source: dataAdapter,
                width: '100%',
                height: '100%',
                // render items.
                itemRenderer: function (item, data, resource) {
                    $(item).find(".jqx-kanban-item-color-status").html("<span style='line-height: 23px; margin-left: 5px;'>" + resource.name + "</span>");
                    $(item).find(".jqx-kanban-item-text").css('background', item.color);
                    item.on('dblclick', function (event) {
                        var input = $("<textarea placeholder='(No Title)' style='border: none; width: 100%;' class='jqx-input'></textarea>");
                        var addToHeader = false;
                        var header = null;
                        if (event.target.nodeName == "SPAN" && $(event.target).parent().hasClass('jqx-kanban-item-color-status')) {
                            var input = $("<input placeholder='(No Title)' style='border: none; background: transparent; width: 80%;' class='jqx-input'/>");
                            // add to header
                            header = event.target;
                            header.innerHTML = "";
                            input.val($(event.target).text());
                            $(header).append(input);
                            addToHeader = true;
                        }
                        if (!addToHeader) {
                            var textElement = item.find(".jqx-kanban-item-text");
                            input.val(textElement.text());
                            textElement[0].innerHTML = "";
                            textElement.append(input);
                        }

                        input.mousedown(function (event) {
                            event.stopPropagation();
                        });
                        input.mouseup(function (event) {
                            event.stopPropagation();
                        });

                        input.blur(function () {
                            var value = input.val();
                            if (!addToHeader) {
                                $("<span>" + value + "</span>").appendTo(textElement);
                            }
                            else {
                                header.innerHTML = value;
                            }
                            input.remove();
                        });
                        input.keydown(function (event) {
                            if (event.keyCode == 13) {
                                if (!header) {
                                    $("<span>" + $(event.target).val() + "</span>").insertBefore($(event.target));
                                    $(event.target).remove();
                                }
                                else {
                                    header.innerHTML = $(event.target).val();
                                }
                            }
                        });
                        input.focus();
                    });
                },
                columns: [
                    {text: "新建子任务", iconClassName: getIconClassName(), dataField: "new", maxItems: 50},
                    {text: "发布子任务", iconClassName: getIconClassName(), dataField: "publish", maxItems: 50},
                    {text: "待审核子任务", iconClassName: getIconClassName(), dataField: "verify", maxItems: 50},
                    {text: "已完成子任务", iconClassName: getIconClassName(), dataField: "done", maxItems: 50}
                ],
                // render column headers.
                columnRenderer: function (element, collapsedElement, column) {
                    var columnItems = $("#kanban").jqxKanban('getColumnItems', column.dataField).length;
                    // update header's status.
                    element.find(".jqx-kanban-column-header-status").html(" (" + columnItems + "/" + column.maxItems + ")");
                    // update collapsed header's status.
                    collapsedElement.find(".jqx-kanban-column-header-status").html(" (" + columnItems + "/" + column.maxItems + ")");
                }
            });

            // handle item clicks.
            $('#kanban').on("itemAttrClicked", function (event) {
                var args = event.args;
                if (args.attribute == "template") {
                    $('#kanban').jqxKanban('removeItem', args.item.id);
                }
            });
            // handle column clicks.
            var itemIndex = 0;
            $('#kanban').on('columnAttrClicked', function (event) {
                var args = event.args;
                if (args.attribute == "button") {
                    args.cancelToggle = true;
                    if (!args.column.collapsed) {
                        var colors = ['#f19b60', '#5dc3f0', '#6bbd49', '#dddddd']
                        $('#kanban').jqxKanban('addItem', {
                            status: args.column.dataField,
                            text: "<textarea placeholder='(No Title)' style='width: 96%; margin-top:2px; border-radius: 3px; border:none; line-height:20px; height: 50px;' class='jqx-input' id='newItem" + itemIndex + "' value=''></textarea>",
                            tags: "new task",
                            color: colors[Math.floor(Math.random() * 4)],
                            resourceId: null
                        });
                        var input = $("#newItem" + itemIndex);
                        input.mousedown(function (event) {
                            event.stopPropagation();
                        });
                        input.mouseup(function (event) {
                            event.stopPropagation();
                        });

                        input.keydown(function (event) {
                            if (event.keyCode == 13) {
                                $("<span>" + $(event.target).val() + "</span>").insertBefore($(event.target));
                                $(event.target).remove();
                            }
                        });
                        input.focus();
                        itemIndex++;
                    }
                }
            });
        });
    </script>
</head>
<body>
<div id="kanban"></div>
</body>
</html>
