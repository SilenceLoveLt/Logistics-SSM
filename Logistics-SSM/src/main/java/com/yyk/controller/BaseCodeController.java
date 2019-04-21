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
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.BaseCodeType;
import com.yyk.entity.BaseCodeTypeCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.BaseCodeService;
import com.yyk.service.BaseCodeTypeService;
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
@RequestMapping(Url.BASECODE_MANAGE)
public class BaseCodeController {
	
	@Autowired
	@Qualifier("baseCodeService")
	private BaseCodeService baseCodeService;
	
	
	@Autowired
	@Qualifier("baseCodeTypeService")
	private BaseCodeTypeService baseCodeTypeService;

	 @RequestMapping("/")
	 public String get(){
	   return Views.BASECODE_VIEW;
	 }

	 
	@RequestMapping(value = Url.BASECODETYPE_LIST_BY_PAGE, method = RequestMethod.POST)
	 public @ResponseBody String codeTypePages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 BaseCodeType baseCodeType=new BaseCodeType();
		 String sEcho = null;
		 PageInfo pageInfo=new PageInfo();
		 for (int i = 0; i < jsonarray.size(); i++) {
	            JSONObject obj = (JSONObject) jsonarray.get(i);
	            if (obj.get("name").equals("sEcho")){
	            	sEcho = obj.get("value").toString();
	            }
	            if (obj.get("name").equals("iDisplayStart")){
	            	pageInfo.setPageNum(Integer.parseInt(obj.get("value").toString()));
	            }
	            if (obj.get("name").equals("iDisplayLength")){
	            	pageInfo.setPageSize(Integer.parseInt(obj.get("value").toString()));
	            }
	            if (obj.get("name").equals("codeTypeSearch")){
	            	baseCodeType.setCodeType((obj.get("value").toString()));
	            }
	            if (obj.get("name").equals("codeNameSearch")){
	            	baseCodeType.setCodeName((obj.get("value").toString()));
	            }
	        }
		    BaseCodeTypeCriteria criteria = new BaseCodeTypeCriteria();
		    BaseCodeTypeCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
			if (StringUtils.isNotBlank(baseCodeType.getCodeName())) {
				cri.andCodeNameLike("%"+baseCodeType.getCodeName()+"%");
			}
			if (StringUtils.isNotBlank(baseCodeType.getCodeType())) {
				cri.andCodeTypeLike("%"+baseCodeType.getCodeType()+"%");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<BaseCodeType>> list=baseCodeTypeService.selectCodeTypeByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	
	@RequestMapping(value = Url.BASECODE_LIST_BY_PAGE, method = RequestMethod.POST)
	 public @ResponseBody String codePages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 BaseCode baseCode=new BaseCode();
		 String sEcho = null;
		 PageInfo pageInfo=new PageInfo();
		 for (int i = 0; i < jsonarray.size(); i++) {
	            JSONObject obj = (JSONObject) jsonarray.get(i);
	            if (obj.get("name").equals("sEcho")){
	            	sEcho = obj.get("value").toString();
	            }
	            if (obj.get("name").equals("iDisplayStart")){
	            	pageInfo.setPageNum(Integer.parseInt(obj.get("value").toString()));
	            }
	            if (obj.get("name").equals("iDisplayLength")){
	            	pageInfo.setPageSize(Integer.parseInt(obj.get("value").toString()));
	            }
	            if (obj.get("name").equals("codeTypeSearch")){
	            	baseCode.setCodeType((obj.get("value").toString()));
	            }
	        }
		    BaseCodeCriteria criteria = new BaseCodeCriteria();
		    BaseCodeCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
			if (StringUtils.isNotBlank(baseCode.getCodeType())) {
				cri.andCodeTypeLike("%"+baseCode.getCodeType()+"%");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<BaseCode>> list=baseCodeService.selectCodeByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
	 @RequestMapping(value = Url.INSERT_OR_UPDATE_INFO_CODETYPE, method = RequestMethod.POST)
     public @ResponseBody Map<String, Object> insertOrUpdateCodeType(BaseCodeType baseCodeType) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	//修改
	    	if(StringUtils.isNotBlank(baseCodeType.getCodeType())){
	    		BaseCodeTypeCriteria criteria = new BaseCodeTypeCriteria();
			    BaseCodeTypeCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);// 只查询状态为1的
	 			cri.andCodeTypeEqualTo(baseCodeType.getCodeType());	    		
	 			int i=baseCodeTypeService.updateBaseCodeType(criteria, baseCodeType);
		    	if(i==1){
		    			map.put("result", true);
		    	}
		    	else{
		    			map.put("result", false);
		    	}
	    	}
	    	else //新增
	    	{
	    		int i=baseCodeTypeService.insertBaseCodeType(baseCodeType);
		    	if(i==1){
		    			map.put("result", true);
		    	}
		    	else{
		    			map.put("result", false);
		    	}
	    	}
	    	return map;
		}
	 
	 
	    
	 
	 
	 
	 
}
