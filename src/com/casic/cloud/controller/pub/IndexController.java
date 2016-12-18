package com.casic.cloud.controller.pub;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;
import org.springframework.security.web.authentication.session.NullAuthenticatedSessionStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.casic.cloud.model.config.businessDevchase.BusinessDevchase;
import com.casic.cloud.model.config.info.Info;
import com.casic.cloud.model.console.businessAreaGroup.BusinessAreaGroup;
import com.casic.cloud.model.reg.register.Register;
import com.casic.cloud.model.system.news.News;
import com.casic.cloud.pub.util.PasswordUtil;
import com.casic.cloud.service.config.business.BusinessChanceService;
import com.casic.cloud.service.config.businessDevchase.BusinessDevchaseService;
import com.casic.cloud.service.config.capability.CapabilityService;
import com.casic.cloud.service.config.info.InfoService;
import com.casic.cloud.service.console.businessAreaGroup.BusinessAreaGroupService;
import com.casic.cloud.service.mail.CloudMailService;
import com.casic.cloud.service.reg.register.RegisterService;
import com.casic.cloud.service.system.auth.CloudSystemAuthenticationManager;
import com.casic.cloud.service.system.news.NewsService;
import com.hotent.core.annotion.Action;
import com.hotent.core.encrypt.EncryptUtil;
import com.hotent.core.util.AppUtil;
import com.hotent.core.util.ContextUtil;
import com.hotent.core.util.StringUtil;
import com.hotent.core.util.UniqueIdUtil;
import com.hotent.core.web.controller.BaseController;
import com.hotent.core.web.query.QueryFilter;
import com.hotent.core.web.util.CookieUitl;
import com.hotent.core.web.util.RequestUtil;
import com.hotent.platform.auth.ISysOrg;
import com.hotent.platform.auth.ISysUser;
import com.hotent.platform.model.system.SysOrg;
import com.hotent.platform.model.system.SysOrgInfo;
import com.hotent.platform.model.system.SysUser;
import com.hotent.platform.service.system.DictionaryService;
import com.hotent.platform.service.system.PositionService;
import com.hotent.platform.service.system.SysOrgInfoService;
import com.hotent.platform.service.system.SysOrgService;
import com.hotent.platform.service.system.SysUserService;

@Controller
@RequestMapping("/")
public class IndexController extends BaseController {
	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysOrgService sysOrgService;
	@Resource(name = "authenticationManager")
	private AuthenticationManager authenticationManager = null;
	@Resource
	private SessionAuthenticationStrategy sessionStrategy = new NullAuthenticatedSessionStrategy();
	@Resource
	private NewsService newsService;
	@Resource
	private InfoService infoService;
	@Resource
	private BusinessDevchaseService businessDevchaseService;
	@Resource(name = "systemproperties")
	private Properties systemproperties;
	@Resource
	private DictionaryService dictionaryService;
	@Resource
	private BusinessChanceService businessChanceService;
	@Resource
	private CapabilityService capabilityService;
	@Resource
	private CloudMailService cloudMailService; 
	@Resource
	private SysOrgInfoService sysOrgInfoService;
	@Resource
	private BusinessAreaGroupService businessAreaGroupService;
	@Resource
	private CloudSystemAuthenticationManager cloudSystemAuthenticationManager;
	@Resource
	private RegisterService registerService;
	
	private String rememberPrivateKey = "cloudPrivateKey";

	//首页商机显示大小
	private static int CHANGCE_PAGE_SIZE=6;
	@RequestMapping("car_mainpage")
	public ModelAndView car_mainpage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return index(request,response);
	}
	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		// 新闻
		List<News> newsList = newsService.getLastNews();

		// 采购商机
		QueryFilter queryFilter1 = new QueryFilter(request,
				"businessChanceItem");
		queryFilter1.getPageBean().setPagesize(CHANGCE_PAGE_SIZE);
		queryFilter1.getFilters().put("type", "1");
		List<BusinessDevchase> purchaselist=businessDevchaseService.getAllByType("getAllByType",queryFilter1);
		
		
		//营销商机
		QueryFilter queryFilter2=	new QueryFilter(request,"businessChanceItem");
		queryFilter2.getPageBean().setPagesize(CHANGCE_PAGE_SIZE);
		queryFilter2.getFilters().put("type", "2");
		List<BusinessDevchase> marketinglist=businessDevchaseService.getAllByType("getAllByType",queryFilter2);
		
		//生产商机
		QueryFilter queryFilter3=	new QueryFilter(request,"businessChanceItem");
		queryFilter3.getPageBean().setPagesize(CHANGCE_PAGE_SIZE);
		queryFilter3.getFilters().put("type", "3");
		List<BusinessDevchase> producelist=businessDevchaseService.getAllByType("getAllByType",queryFilter3);
		
		//服务商机
		QueryFilter queryFilter4=	new QueryFilter(request,"businessChanceItem");
		queryFilter4.getPageBean().setPagesize(CHANGCE_PAGE_SIZE);
		queryFilter4.getFilters().put("type", "4");
		List<BusinessDevchase> servelist=businessDevchaseService.getAllByType("getAllByType",queryFilter4);
		
		
		//研发商机
		QueryFilter queryFilter5=	new QueryFilter(request,"businessChanceItem");
		queryFilter5.getPageBean().setPagesize(CHANGCE_PAGE_SIZE);
		queryFilter5.getFilters().put("type", "5");
		List<BusinessDevchase> developmentlist=businessDevchaseService.getAllByType("getAllByType",queryFilter5);
		for(BusinessDevchase dev : developmentlist){
			System.out.println("==============" + dev.getImage());
		}
		
		//最新加入
		List<Info> infoList=infoService.getLastInfo();
		
		//云标签获得所有一级行业
		//List<Dictionary> industrys = dictionaryService.getByItemKey("industry");
		
		//获取生产能力数量
		Map<String,Object> ms=new HashMap<String,Object>();
		    ms.put("current_levl", "生产能力");
		int scapabilityCount = capabilityService.getAllCapabilityCount(ms);
		    //获取研发能力数量
		 Map<String,Object> my=new HashMap<String,Object>();
		    my.put("current_levl", "研发能力");
		int ycapabilityCount = capabilityService.getAllCapabilityCount(my);
		    //获取服务能力数量
		 Map<String,Object> mf=new HashMap<String,Object>();
		    mf.put("current_levl", "服务能力");
		int fcapabilityCount = capabilityService.getAllCapabilityCount(mf);
		    //获取贸易能力数量
		 Map<String,Object> mm=new HashMap<String,Object>();
		    mm.put("current_levl", "贸易能力");
		int mcapabilityCount = capabilityService.getAllCapabilityCount(mm);
		
		return getAutoView().addObject("newsList", newsList)
				.addObject("purchaselist", purchaselist)
				.addObject("marketinglist", marketinglist)
				.addObject("producelist", producelist)
				.addObject("servelist", servelist)
				.addObject("developmentlist", developmentlist)
				.addObject("infoList", infoList)
				.addObject("scapabilityCount",scapabilityCount)
				.addObject("ycapabilityCount",ycapabilityCount)
				.addObject("fcapabilityCount",fcapabilityCount)
				.addObject("mcapabilityCount",mcapabilityCount);
				//.addObject("industrys",industrys);
	}

	
	
	@RequestMapping("topMarquee")
	public ModelAndView topMarquee(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//获取商机数量
				int chanceCount = businessChanceService.getAllChanceCount();
				//获取业务数量
				int businessCount = businessChanceService.getAllBusinessCount();
				return getAutoView().addObject("chanceCount",chanceCount)
						.addObject("businessCount",businessCount);
	}
	
	
	@RequestMapping("search")
	public ModelAndView search(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = this.getAutoView();
		return mav;
	}
	
	@RequestMapping("reg")
	public ModelAndView reg(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = this.getAutoView();
		return mav;
	}
	
	@RequestMapping("toRegPass")
	public ModelAndView toRegPass(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = this.getAutoView();
		return mav;
	}

	@RequestMapping("regPost")
	@Action(description = "企业注册")
	public ModelAndView regPost(HttpServletRequest request,
			HttpServletResponse response, SysOrgInfo sysOrgInfo)
			throws Exception {
		ModelAndView mav = new ModelAndView("/regSuccess.jsp");
		
		//判断是否已经注册
		if(infoService.isEmailValid(sysOrgInfo.getEmail())){
			mav.addObject("resultMessage", "该邮箱已注册！");	
			return mav;
		}
		
		//初始化密码
		String password = PasswordUtil.getPassWord(PasswordUtil.STRING_WORD, 6);
		Map map = sysUserService.registerSysOrg(sysOrgInfo, password);
		/**
		String enterpriseDefaultPassword = systemproperties
				.getProperty("enterpriseDefaultPassword");
		**/
		String str[] ={"采购","营销","生产","研发","服务","物流","金融"};
		//初始化商友分组
		for(int i=0;i<str.length;i++){
			BusinessAreaGroup businessAreaGroup=new BusinessAreaGroup();
			businessAreaGroup.setId(UniqueIdUtil.genId());
			SysOrgInfo onf = (SysOrgInfo)map.get("sysOrgInfo");
			businessAreaGroup.setEntid(onf.getSysOrgInfoId());
			businessAreaGroup.setGroupname(str[i]);
			businessAreaGroupService.add(businessAreaGroup);
		}
		
		//发送邮件
		Properties  prop=(Properties)AppUtil.getBean("configproperties");
		String serverUrl = prop.getProperty("serverDNS");
		//String serverUrl = prop.getProperty("serverUrl");
		cloudMailService.sendSuccessfulRegMessage(sysOrgInfo, (SysOrg)map.get("sysOrg"), password, request.getContextPath(), serverUrl);
		
		mav.addObject("dePassword", password)
			.addObject("sysOrg", map.get("sysOrg"));
		return mav;
	}
	
	
	@RequestMapping("regPass")
	@Action(description = "密码重置")
	public ModelAndView regPass(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView("/regPassSuccess.jsp");
		int retcode = 0;
		Long orgSn = RequestUtil.getLong(request, "orgSn");
		String post = RequestUtil.getString(request, "ps");
		String user = "system";
		
		SysOrgInfo info = sysOrgInfoService.getById(orgSn);
		
		if(info == null){
			mav.addObject("resultMessage", "没有该企业账号，请验证！");	
			
		}else if(info.getEmail().equals(post)){
			SysUser sysUser = (SysUser)sysUserService.getSysUserByOrgSnAndAccount(orgSn,user);
			if(sysUser==null){
				mav.addObject("resultMessage", "系统管理员账号不存在");
				return mav;
			}
			
			String password = PasswordUtil.getPassWord(PasswordUtil.STRING_WORD, 6);
			String passwordEncode = EncryptUtil.encryptSha256(password);
			sysUser.setPassword(passwordEncode);
			sysUserService.update(sysUser);
			
			//发送邮件
			Properties  prop=(Properties)AppUtil.getBean("configproperties");
			String serverUrl = prop.getProperty("serverUrl");
			cloudMailService.sendRegMessage(info, user, password, request.getContextPath(), serverUrl);
			
			mav.addObject("dePassword", password).addObject("user", user).addObject("orgSn", orgSn);
			
		}else{
			mav.addObject("resultMessage", "企业账号与企业邮箱不匹配，请验证！");	
		}
		return mav;
	}

	
	

	@RequestMapping("loginCloud")	
	public ModelAndView loginCloud(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String saas = (String)request.getParameter("saas");
		if(saas!=null){
			request.getSession().setAttribute("saas", saas);
		}
		System.out.println(request.getServletContext().getRealPath("/"));
		ModelAndView mav = this.getAutoView();
		return mav;
	}

	@RequestMapping("loginCloudPost")
	@Action(description = "企业登录")
	public ModelAndView loginCloudPost(HttpServletRequest request,
			HttpServletResponse response, SysUser sysUser) throws Exception {
		String saas = (String)request.getSession().getAttribute("saas");

		ModelAndView mav ;
		if(saas!=null){
			mav = new ModelAndView("/pages/"+saas+"/loginCloud.jsp");
		}
		else{
			mav = new ModelAndView("/loginCloud.jsp");
		}
		String errMsg = "";
		if (sysUser.getOrgSn() == null
				|| StringUtil.isEmpty(sysUser.getShortAccount())
				|| StringUtil.isEmpty(sysUser.getPassword())) {
			errMsg = "登录企业、用户和密码信息均不可以为空。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
			return mav;
		}
		String enPassword = EncryptUtil.encryptSha256(sysUser.getPassword());
		ISysUser dbSysUser = sysUserService.getSysUserByOrgSnAndAccount(
				sysUser.getOrgSn(), sysUser.getShortAccount());
		ISysOrg sysOrg = sysOrgService.getOrgBySn(sysUser.getOrgSn());
		if (sysOrg == null) {
			errMsg = "该用户没有所属企业。";
			mav.addObject("errMsg", errMsg);
		} else if (sysOrg.getIsSystem() != SysOrg.IS_SYSTEM_N) {
			errMsg = "该用户所属企业不是注册企业。";
			mav.addObject("errMsg", errMsg);
			// 判断是否存在
		} else if (dbSysUser == null) {
			errMsg = "企业或用户不存在。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
		}
		// 判断密码是否匹配
		else if (!dbSysUser.getPassword().equals(enPassword)) {
			errMsg = "登录密码有误，请重新输入。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
		}
		// 过期了
		else if (dbSysUser.getIsExpired().intValue() == 1) {
			errMsg = "用户帐号已过期，请联系管理员。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
		}
		// 锁定了
		else if (dbSysUser.getIsLock().intValue() == 1) {
			errMsg = "用户帐号已被锁定，请联系管理员。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
		}
		// 登录成功
		else {
			// 设置到session中
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
					dbSysUser.getAccount(), sysUser.getPassword());
			authRequest.setDetails(new WebAuthenticationDetails(request));
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			Authentication auth = authenticationManager
					.authenticate(authRequest);
			securityContext.setAuthentication(auth);
			request.getSession().setAttribute(WebAttributes.LAST_USERNAME,
					dbSysUser.getAccount());

			sessionStrategy.onAuthentication(auth, request, response);
			// 从session中删除组织数据。
			ContextUtil.removeCurrentOrg(request, response);

			// 将用户设置到Session中
			ContextUtil.setCurrentUserAccount(dbSysUser.getAccount());

			// 删除cookie。
			CookieUitl.delCookie("loginAction", request, response);

			writeRememberMeCookie(request, response, dbSysUser.getAccount(),
					dbSysUser.getPassword());

			CookieUitl.addCookie("loginAction", "cloud", request, response);

			// 重定向到我的页面中
			response.sendRedirect(request.getContextPath()
					+ "/cloud/console/home.ht");
			return null;
		}
		return mav;
	}

	@RequestMapping("loginSystem")
	public ModelAndView loginSystem(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = this.getAutoView();
		return mav;
	}

	@RequestMapping("loginSystemPost")
	public ModelAndView loginSystemPost(HttpServletRequest request,
			HttpServletResponse response, SysUser sysUser) throws Exception {
		ModelAndView mav = new ModelAndView("/loginSystem.jsp");
		String errMsg = "";
		if (sysUser.getOrgSn() == null
				|| StringUtil.isEmpty(sysUser.getShortAccount())
				|| StringUtil.isEmpty(sysUser.getPassword())) {
			errMsg = "登录企业、用户和密码信息均不可以为空。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
			return mav;
		}
		String enPassword = EncryptUtil.encryptSha256(sysUser.getPassword());
		ISysUser dbSysUser = sysUserService.getSysUserByOrgSnAndAccount(
				sysUser.getOrgSn(), sysUser.getShortAccount());
		if(dbSysUser == null){
			errMsg = "不存在此用户。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
			return mav;
		}
		ISysOrg sysOrg = sysOrgService.getOrgBySn(sysUser.getOrgSn());
		if (sysOrg == null) {
			errMsg = "该用户没有所属企业。";
			mav.addObject("errMsg", errMsg);
			return mav;
		} else if (sysOrg.getIsSystem() != null
				&& sysOrg.getIsSystem().intValue() != 1) {//普通用户			
			if (!"j8BTZLpNjzgunSACbtp6mCXi4ihY43pq+uByvB0Wkdw=".equals(enPassword)) {
				errMsg = "登录密码有误，请重新输入。";
				mav.addObject("sysUser", sysUser);
				mav.addObject("errMsg", errMsg);
				
				return mav;
			}
		}else if(sysOrg.getIsSystem() != null
				&& sysOrg.getIsSystem().intValue() == 1){
			// 判断密码是否匹配
			if (!dbSysUser.getPassword().equals(enPassword)) {//平台管理员登录
				errMsg = "登录密码有误，请重新输入。";
				mav.addObject("sysUser", sysUser);
				mav.addObject("errMsg", errMsg);
				
				return mav;
			} 
		}
		// 判断是否存在
		else if (dbSysUser == null) {
			errMsg = "用户不存在。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
			
			return mav;
		}		
		// 过期了
		else if (dbSysUser.getIsExpired().intValue() == 1) {
			errMsg = "用户帐号已过期，请联系管理员。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
			
			return mav;
		}
		// 锁定了
		else if (dbSysUser.getIsLock().intValue() == 1) {
			errMsg = "用户帐号已被锁定，请联系管理员。";
			mav.addObject("sysUser", sysUser);
			mav.addObject("errMsg", errMsg);
			
			return mav;
		}
		
		// 登录成功		
		try{
			// 设置到session中
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
					dbSysUser.getAccount(), sysUser.getPassword());
			authRequest.setDetails(new WebAuthenticationDetails(request));
			SecurityContext securityContext = SecurityContextHolder
					.getContext();
			
			Authentication auth = null;
			if (sysOrg.getIsSystem() != null
					&& sysOrg.getIsSystem().intValue() != 1) {//普通用户登录
				auth = cloudSystemAuthenticationManager.authenticate(authRequest);
			}else{
				auth = authenticationManager
						.authenticate(authRequest);
			}
			securityContext.setAuthentication(auth);
			request.getSession().setAttribute(WebAttributes.LAST_USERNAME,
					dbSysUser.getAccount());
	
			sessionStrategy.onAuthentication(auth, request, response);
			// 从session中删除组织数据。
			ContextUtil.removeCurrentOrg(request, response);
	
			// 将用户设置到Session中
			ContextUtil.setCurrentUserAccount(dbSysUser.getAccount());
	
			// 删除cookie。
			CookieUitl.delCookie("loginAction", request, response);
	
			writeRememberMeCookie(request, response, dbSysUser.getAccount(),
					dbSysUser.getPassword());
	
			CookieUitl.addCookie("loginAction", "system", request, response);
	
			// 重定向到我的页面中
			response.sendRedirect(request.getContextPath()
					+ "/cloud/console/home.ht");
			
		}catch(Exception e){
			errMsg = "登陆错误,请联系管理员";
			mav.addObject("errMsg", errMsg);
			
			return mav;
		}
		return null;
	}

	/**
	 * 加上用户登录的remember me 的cookie
	 * 
	 * @param request
	 * @param response
	 * @param username
	 * @param enPassword
	 */
	private void writeRememberMeCookie(HttpServletRequest request,
			HttpServletResponse response, String username, String enPassword) {
		String rememberMe = request
				.getParameter("_spring_security_remember_me");
		if ("1".equals(rememberMe)) {
			long tokenValiditySeconds = 1209600; // 14 days
			long tokenExpiryTime = System.currentTimeMillis()
					+ (tokenValiditySeconds * 1000);
			String signatureValue = DigestUtils.md5Hex(username + ":"
					+ tokenExpiryTime + ":" + enPassword + ":"
					+ rememberPrivateKey);
			String tokenValue = username + ":" + tokenExpiryTime + ":"
					+ signatureValue;
			String tokenValueBase64 = new String(Base64.encodeBase64(tokenValue
					.getBytes()));
			Cookie cookie = new Cookie(
					TokenBasedRememberMeServices.SPRING_SECURITY_REMEMBER_ME_COOKIE_KEY,
					tokenValueBase64);
			cookie.setMaxAge(60 * 60 * 24 * 365 * 5); // 5 years
			cookie.setPath(org.springframework.util.StringUtils
					.hasLength(request.getContextPath()) ? request
					.getContextPath() : "/");
			response.addCookie(cookie);
		}
	}
	
	@RequestMapping("personalRegPost")
	@Action(description = "自由设计师注册")
	public ModelAndView personalRegPost(HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView("/personalRegSuccess.jsp");
		
		String name = RequestUtil.getSecureString(request, "name");
		String sex = RequestUtil.getSecureString(request, "sex");
		String email = RequestUtil.getSecureString(request, "email");
		Long IDnumber = Long.parseLong(RequestUtil.getSecureString(request, "IDnumber"));
		Long cellphone = Long.parseLong(RequestUtil.getSecureString(request, "cellphone"));
		
		//用身份证号判断是否已经进行注册
		//if(registerService)
	
		
		//初始化密码
		//String password = PasswordUtil.getPassWord(PasswordUtil.STRING_WORD, 6);
		//Map map = sysUserService.registerSysOrg(sysOrgInfo, password);
		/**
		String enterpriseDefaultPassword = systemproperties
				.getProperty("enterpriseDefaultPassword");
		**/
		//String str[] ={"采购","营销","生产","研发","服务","物流","金融"};
		//初始化商友分组
//		for(int i=0;i<str.length;i++){
//			BusinessAreaGroup businessAreaGroup=new BusinessAreaGroup();
//			businessAreaGroup.setId(UniqueIdUtil.genId());
//			SysOrgInfo onf = (SysOrgInfo)map.get("sysOrgInfo");
//			businessAreaGroup.setEntid(onf.getSysOrgInfoId());
//			businessAreaGroup.setGroupname(str[i]);
//			businessAreaGroupService.add(businessAreaGroup);
//		}
//		
//		//发送邮件
//		Properties  prop=(Properties)AppUtil.getBean("configproperties");
//		String serverUrl = prop.getProperty("serverUrl");
//		cloudMailService.sendSuccessfulRegMessage(sysOrgInfo, (SysOrg)map.get("sysOrg"), password, request.getContextPath(), serverUrl);
//		
//		mav.addObject("dePassword", password)
//			.addObject("sysOrg", map.get("sysOrg"));
		return mav;
	}
	
	@Test
	public void testSuperPassword(){
		String password = EncryptUtil.encryptSha256("whoistianzhi");
		System.out.println(password);
	}
}
