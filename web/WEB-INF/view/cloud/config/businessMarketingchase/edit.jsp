<%--
	time:2013-04-16 17:21:17
	desc:edit the cloud_business_chance
--%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<%@ include file="/commons/cloud/global.jsp"%>
<%@ include file="/commons/cloud/meta.jsp"%>

<html>
<head>
<title>商机发布</title>
<%@include file="/commons/include/form.jsp"%>
<script type="text/javascript" src="${ctx}/js/hotent/CustomValid.js"></script>
<script type="text/javascript" src="${ctx}/js/hotent/formdata.js"></script>


 
<!-- ueditor -->
<script type="text/javascript" charset="utf-8" src="${ctx}/js/ueditor/page-editor/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/js/ueditor/page-editor/editor_api.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/ueditor/themes/default/ueditor.css" />
<style type="text/css">
/* 分类选择 */
.category-columns{overflow: hidden;zoom: 1;}
.category-columns .category-list{margin-left:0; padding-left:0;text-align:left;float: left;width: 150px;height: 200px;background-color: white;border: 1px solid #e0e0e0;overflow-x: hidden;overflow-y: scroll;}
.category-columns .category-list li{height: 22px;line-height: 22px;overflow: hidden;}
.category-columns .category-list a{display: block;height: 22px;padding-left: 10px;color: #454545;text-decoration: none;}
.category-columns .category-list a:hover{background-color: #d7d7d7;}
.category-columns .category-list a.select{background: #9ab8d6 !important;color: #fff !important;}

</style>
<script type="text/javascript">
var manager = null;
		$(function() {
			var editor = new baidu.editor.ui.Editor({
				minFrameHeight : 200,
				initialContent : ''
			});
			editor.render("txtHtml");
			//初始化第一级
			$.ajax({
				type : 'post',
				url : '${ctx}/cloud/config/materialclass/getClasses.ht',
				dataType: 'json',				
				success : function(data){
					var rows=data.list;
					 
					if(rows.length){
						for(var i=0;i<rows.length;i++){
							var row = rows[i];
							$('.category-list[level=1]').append('<li o-id=' + row.id + '><a href="javascript:void(0);" onclick="change(this, '+row.id+',1)" class="parent">' + row.name + '</a></li>');
						};
					}
				}
			});
			//行业
			var indus = $('#dlqy').val();
			
			
			var ind2 = $('#ind2').val();
			
			
			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '/bpmx3/cloud/config/info/getCascadeJsonData.ht',
				data : {value : indus },
				success : function(dics){
					var rows=dics;
					$('#dlqy2').html('');
					var opt ='';
					for(var i=0;i<rows.length;i++){
						var s ='';
						var iv =rows[i].itemValue + '';
						if(iv == ind2)
							s='selected';
						$('#dlqy2').append('<option ' + s + ' value="' +  rows[i].itemValue + '">' + rows[i].itemName + '</option>');
					};
				}
			});
			var options={};
			if(showResponse){
				options.success=showResponse;
			}
			var frm=$('#businessMarketingchaseForm').form();
			$("a.save").click(function() {
				frm.setData();
				$('#content').val(editor.getContent());
				frm.ajaxForm(options);
				if(frm.valid()){
					var id = $("#id").val();
				
					 var totalLevel = $('.category-list').size();
						for(var i=1; i<(totalLevel+1); i++){
							var $ul = $('.category-list[level=' + i + ']>li>a.select');
							 
							 
							  
							if($ul.text()==""){
								$.ligerMessageBox.alert("提示信息",  "有物品分类未选中!");
								return;
							}
							 
							
						}
						 
						//选中最后一级分类
						var $ul = $('.category-list[level=' + totalLevel + ']>li>a.select');
						var id = $ul.parent().attr('o-id');
						 
						document.getElementById("classid").value= id;
						
						document.getElementById("levl1").value= $('.category-list[level=1]>li>a.select').text();
						document.getElementById("levl2").value= $('.category-list[level=2]>li>a.select').text();
						document.getElementById("levl3").value= $('.category-list[level=3]>li>a.select').text();
						 document.getElementById("classid").value= $('.category-list[level=3]>li>a.select').text();
						 	manager = $.ligerDialog.waitting('正在保存中,请稍候...');
					form.submit();
				}
			});
		});
		//select选中事件
		function change(a, id,level){
			//选中背景
			$(a).parent().parent().find('.select').removeClass('select');
			$(a).toggleClass('select');
			
			//删除以后所有元素
			for(var i=(level+1); i<4; i++){
				var s = '.category-list[level=' + i + ']';	
			 
					$(s).remove();
				 
			}
			
			//判断是否有下级目录
			$.ajax({
					type : 'post',
					url : '${ctx}/cloud/config/materialclass/getClasses.ht?id='+id,
					dataType: 'json',
					success : function(data){
						var rows=data.list;
						if(rows.length){//动态生成下级目录	
							//当前元素
							var currentUL = '.category-list[level=' + level+ ']';
							//下一元素
							var nextUL = '.category-list[level=' + (level+1) + ']';
							
							//当前元素对象
							var $srcUL = $(currentUL);
							
							 
								$srcUL.after('<ul class="category-list" level="' + (level+1) + '"></ul>');
						 
							
							//目标元素对象
							var $targetUL = $(nextUL);
							$targetUL.empty();
							for(var i=0;i<rows.length;i++){
								var row = rows[i];
								 
								$targetUL.append('<li o-id=' + row.id + '><a href="javascript:void(0);" onclick="change(this, ' + row.id + ', ' +  (level+1) + ')" class="parent">' + row.name + '</a></li>');
							}
						}
						
					 
					}
				})
		}
		function showResponse(responseText) {
			var obj = new com.hotent.form.ResultMessage(responseText);
			manager.close();
			if (obj.isSuccess()) {
			$.ligerMessageBox.alert("提示信息", "商机已提交、请等待管理员审核");
			 
			} else {
				$.ligerMessageBox.error("提示信息",obj.getMessage());
			}
		}
		
		
	//上传图片	
	var dd = null;
	function selectIcon(){
		var urlShow = '${ctx}/cloud/pub/image/toUpload.ht';
		dd = $.ligerDialog.open({ url:urlShow, height: 350,width: 500, title :'图片上传器', name:"frameDialog_"});
	};

	 
		
			function _callbackImageUploadSucess(src){
			dd.close();
				$("#image").val(src);
					 var item = $('<img src="${ctx}'+src+'" width="80" height="84" />');
					$("#picView").append(item);
				 
			 
		}
	 
			
			
			
		 
		
	</script>
						
</head>
<body>
	<div class="panel">
				<div class="panel-top">
		<div class="tbar-title">
		    <c:choose>
			    <c:when test="${businessMarketingchase.id !=null}">
			        <span class="tbar-label">编辑营销商机</span>
			    </c:when>
			    <c:otherwise>
			        <span class="tbar-label">添加营销商机</span>
			    </c:otherwise>			   
		    </c:choose>
		</div>
		<div class="panel-toolbar">
			<div class="toolBar">
				<c:if test="${info.state == 2}">
					<div class="group"><a class="link save" id="dataFormSave" href="#">保存</a></div>
				 </c:if>
				 <c:if test="${info.state != 2}">
					<div class="group">你的企业还未通过审核，不允许发布商机！</div>
				 </c:if>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<form id="businessMarketingchaseForm" method="post" action="save.ht">
			<table class="table-detail" cellpadding="0" cellspacing="0" border="0" type="main">
			
			
			
			
			
				<tr>
					<th width="20%">商机名称: </th>
					<td><input type="text" id="name" name="name" value="${businessMarketingchase.name}"  class="inputText" style="width:550px;" validate="{required:true,maxlength:384}"  /></td>
				</tr>
				<tr>
					<th width="20%">开始时间: </th>
					<td><input type="text" id="startTime" name="startTime" value="<fmt:formatDate value='${businessMarketingchase.startTime}' pattern='yyyy-MM-dd'/>" class="inputText date" validate="{date:true}" /></td>
				</tr>
				<tr>
					<th width="20%">结束时间: </th>
					<td><input type="text" id="endTime" name="endTime" value="<fmt:formatDate value='${businessMarketingchase.endTime}' pattern='yyyy-MM-dd'/>" class="inputText date" validate="{date:true}" /></td>
				</tr>
				
				
				<tr>
					<th width="20%">营销物品分类: </th>
					<td>
					<div class="choose-category-way" style="">
							<div class="category-columns" id="category-columns" defaults="0">
								<ul class="category-list" level="1">
									
								</ul>
							</div>
						</div>
					
					
					</td>
				</tr>
				<tr>
					<th width="20%">图片: </th>
					<td>
					<input id="image" name="image" type="hidden"
									value="${businessMarketingchase.image}"> <a
									href="javascript:selectIcon();" class="btn-ctrl"
									id="addProductPic" js_tukubtn="true">添加图片</a>
									<div class="addproduct-pic" id="picView">
									<c:if test="${businessMarketingchase.image!=null }">
												<img src="${ctx}${businessMarketingchase.image}" onError="this.src='${ctx}/images/product_img02.jpg'"  width="80" height="84" />
											</c:if>
									</div>
					</td>
				</tr>
				
				<tr>
					<th width="20%">代理区域: </th>
					
						<td>
				 
					 <ap:selectDB name="dlqy" id="dlqy" where="parentId=10000005610078" optionValue="itemValue" style="width:140px;"
											optionText="itemName" table="SYS_DIC"
											selectedValue="${businessMarketingchase.dlqy}">
										</ap:selectDB>
					<ap:ajaxSelect srcElement="dlqy" url="${ctx}/cloud/config/info/getCascadeJsonData.ht" targetElement="dlqy2"/>
										<ap:selectDB name="dlqy2" id="dlqy2"  style="width:140px;"
											where="1!=1" optionValue="itemValue"
											optionText="itemName" table="SYS_DIC"
											selectedValue="${businessMarketingchase.dlqy2}">
										</ap:selectDB>
										<input id="ind2" type="hidden" value="${businessMarketingchase.dlqy2}">
					</td>
					
					
				</tr>
			 
				<tr>
					<th width="20%">代理时间要求: </th>
					<td>
					<textarea rows="3" cols="100"   id="dlsjyq" name="dlsjyq" style="width:550px;">${businessMarketingchase.dlsjyq}</textarea>
					</td>
				</tr>
				<tr>
					<th width="20%">营销伙伴资质要求: </th>
					
					<td>
					<textarea rows="3" cols="100"   id="yxhbzzyq" name="yxhbzzyq"  style="width:550px;">${businessMarketingchase.yxhbzzyq}</textarea>
					</td>
				</tr>
				
				
				
				
				<tr>
					<th width="20%">商机内容: </th>
					<td>
					 
					    
					    
					    <div id="editor" position="center" style="overflow: auto; height: 100%;">
						  	<textarea id="txtHtml" name="html">${fn:escapeXml(businessMarketingchase.content)}</textarea>
					    </div>
                    </td>
				</tr>
				
				
				 
				
			</table>
			
			<input type="hidden" name="id" value="${businessMarketingchase.id}" />
			<input type="hidden" id="operateTime" name="operateTime"
							value="<fmt:formatDate value='${businessMarketingchase.operateTime}' pattern='yyyy-MM-dd'/>"class="inputText date" /> 
			 
			<input type="hidden" id="publishState" name="publishState" value="未审核" />
			<input type="hidden" id="userId" name="userId" value="${businessMarketingchase.userId}"  />
			<input type="hidden" id="companyId" name="companyId" value="${businessMarketingchase.companyId}"  />
				<input type="hidden" id="userName" name="userName" value="${businessMarketingchase.userName}"  />
			<input type="hidden" id="companyName" name="companyName" value="${businessMarketingchase.companyName}"  />
			<input id="content" name="content" type="hidden"></input>
			<input type="hidden" id="classid" name="classid" value="${businessMarketingchase.classid}"    />
			<input type="hidden" id="levl1" name="levl1" value="">
					            	<input type="hidden" id="levl2" name="levl2" value="">
					            	<input type="hidden" id="levl3" name="levl3" value="">
		</form>
		
	</div>
 
</body>
</html>
