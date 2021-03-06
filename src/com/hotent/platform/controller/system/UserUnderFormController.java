package com.hotent.platform.controller.system;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.hotent.core.annotion.Action;
import com.hotent.core.util.UniqueIdUtil;
import com.hotent.core.web.ResultMessage;
import com.hotent.core.web.controller.BaseFormController;

import com.hotent.platform.model.system.UserUnder;
import com.hotent.platform.service.system.UserUnderService;

/**
 * 对象功能:下属管理 控制器类
 * 开发公司:
 * 开发人员:ray
 * 创建时间:2012-07-05 10:08:08
 */
@Controller
@RequestMapping("/platform/system/userUnder/")
public class UserUnderFormController extends BaseFormController
{
	@Resource
	private UserUnderService userUnderService;
	
	/**
	 * 添加或更新下属管理。
	 * @param request
	 * @param response
	 * @param userUnder 添加或更新的实体
	 * @param bindResult
	 * @param viewName
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("save")
	@Action(description="添加或更新下属管理")
	public void save(HttpServletRequest request, HttpServletResponse response, UserUnder userUnder,BindingResult bindResult) throws Exception
	{
		ResultMessage resultMessage=validForm("userUnder", userUnder, bindResult, request);
		//add your custom validation rule here such as below code:
		//bindResult.rejectValue("name","errors.exist.student",new Object[]{"jason"},"重复姓名");
		if(resultMessage.getResult()==ResultMessage.Fail)
		{
			writeResultMessage(response.getWriter(),resultMessage);
			return;
		}
		String resultMsg=null;
		if(userUnder.getId()==null){
			
			userUnder.setId(UniqueIdUtil.genId());
			userUnderService.add(userUnder);
			resultMsg=getText("record.added","下属管理");
		}else{
			userUnderService.update(userUnder);
			resultMsg=getText("record.updated","下属管理");
		}
		writeResultMessage(response.getWriter(),resultMsg,ResultMessage.Success);
	}
	
	/**
	 * 在实体对象进行封装前，从对应源获取原实体
	 * @param ID
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @ModelAttribute
    protected UserUnder getFormObject(@RequestParam("id") Long id,Model model) throws Exception {
		logger.debug("enter UserUnder getFormObject here....");
		UserUnder userUnder=null;
		if(id!=null){
			userUnder=userUnderService.getById(id);
		}else{
			userUnder= new UserUnder();
		}
		return userUnder;
    }

}
