package com.yyk.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.constant.Url;
import com.yyk.constant.Views;
import com.yyk.dto.UserDTO.SysUserListReqDTO;
import com.yyk.entity.SysOrderCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;


/**
 * 
 * @author YYK
 * @version 5.2.0
 * @since 
 * 创建时间：2019年4月13日
 * 功能描述：
 */
@Controller
@RequestMapping(Url.USER_MANAGE)
public class SysUserController {
	
	@Autowired
	@Qualifier("sysUserService")
	private SysUserService sysUserService;
	
	/**
	 * 
	* @author yyk  
	* @Title: get 
	* @Package com.yyk.controller  
	* @Description: TODO
	* @return
	* @return String   
	* @date 2019年4月13日 下午4:41:50     
	* @throws 
	 */
	 @RequestMapping("/")
	 public String get(){
	   return Views.USER_VIEW;
	 }
	
	 /**
	  * 
	 * @author yyk  
	 * @Title: queryPages 
	 * @Package com.yyk.controller  
	 * @Description: TODO
	 * @param page
	 * @param su
	 * @return
	 * @return BootstrapTablePageDTO   
	 * @date 2019年4月13日 下午4:42:19     
	 * @throws 
	  */
	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE, produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public @ResponseBody String queryPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysUserListReqDTO sysUserListReqDTO=new SysUserListReqDTO();
		 String sEcho = null;
		 PageInfo pageInfo=new PageInfo();
		 for (int i = 0; i < jsonarray.size(); i++) {
	            JSONObject obj = (JSONObject) jsonarray.get(i);
	            if (obj.get("name").equals("sEcho")){
	            	sEcho = obj.get("value").toString();
	            	//pageInfo.setPageNum(Integer.parseInt(sEcho));
	            }
	 
	            if (obj.get("name").equals("iDisplayStart")){
	            	pageInfo.setPageNum(Integer.parseInt(obj.get("value").toString()));
	            }
	            	
	            if (obj.get("name").equals("iDisplayLength")){
	            	pageInfo.setPageSize(Integer.parseInt(obj.get("value").toString()));
	            }
	            
	            if (obj.get("name").equals("userNameSearch")){
	            	sysUserListReqDTO.setUserName( obj.get("value").toString());
	            }
	            
	            if (obj.get("name").equals("userPhoneSearch")){
	            	sysUserListReqDTO.setUserPhone(obj.get("value").toString());
	            }
	        }
		    SysUserCriteria criteria = new SysUserCriteria();
			SysUserCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
			if (StringUtils.isNotBlank(sysUserListReqDTO.getUserName())) { // 客户姓名查询
				cri.andUserNameLike("%" + sysUserListReqDTO.getUserName() + "%");
			}
			if (StringUtils.isNotBlank(sysUserListReqDTO.getUserPhone())) { // 客户代码查询
				cri.andUserPhoneLike("%" + sysUserListReqDTO.getUserPhone() + "%");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<SysUser>> list=sysUserService.selectSysUserByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
		 
	 
	    @RequestMapping(value = Url.INSERT_OR_UPDATE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertOrUpdateUser(SysUser sysUser) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	//修改
	    	if(StringUtils.isNotBlank(sysUser.getUserId())){
	    		SysUserCriteria criteria = new SysUserCriteria();
	 			SysUserCriteria.Criteria cri = criteria.createCriteria();
	 			cri.andStatusEqualTo(1);// 只查询状态为1的
	 			cri.andUserIdEqualTo(sysUser.getUserId());	    		
	 			int i=sysUserService.updateUser(criteria, sysUser);
		    	if(i==1){
		 			
		    		map.put("result", true);
		    	}
		    	else{
		    		map.put("result", false);
		    	}
	    	}
	    	else //新增
	    	{
	    		int i=sysUserService.insertUser(sysUser);
		    	if(i==1){
		    			map.put("result", true);
		    	}
		    	else{
		    			map.put("result", false);
		    	}
	    	}
	    	return map;
		}
	 
	 
	    @RequestMapping(value = Url.DELETE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteInfoUser(@RequestParam(required=false,value = "userId") String userId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	SysUserCriteria criteria = new SysUserCriteria();
 			SysUserCriteria.Criteria cri = criteria.createCriteria();
 			cri.andStatusEqualTo(1);// 只查询状态为1的
 			cri.andUserIdEqualTo(userId);	
 			SysUser sysUser=new SysUser();
 			sysUser.setStatus(0);
 			int i=sysUserService.updateUser(criteria, sysUser);
 			if(i==1){
    			map.put("result", true);
	    	}
	    	else{
	    			map.put("result", false);
	    	}
	    	return map;
		}
	    
	    /**
	     * 批量删除
	     * @param userId
	     * @return
	     */
	 
	    @RequestMapping(value = Url.DELETE_LIST, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteListUser(@RequestParam(required=false,value = "idListStr") String userId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	SysUserCriteria criteria = new SysUserCriteria();
 			SysUserCriteria.Criteria cri = criteria.createCriteria();
 			List<String> userIds=Arrays.asList(userId.split(","));
 			cri.andStatusEqualTo(1);// 只查询状态为1的
 			cri.andUserIdIn(userIds);
 			SysUser sysUser=new SysUser();
 			sysUser.setStatus(0);
 			int i=sysUserService.updateUser(criteria, sysUser);
 			if(i>=1){
    			map.put("result", true);
	    	}
	    	else{
	    			map.put("result", false);
	    	}
	    	return map;
		}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
