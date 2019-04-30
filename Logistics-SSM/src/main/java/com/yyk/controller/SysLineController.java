package com.yyk.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.InitBinder;
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
import com.yyk.dto.LineDTO.LineResDTO;
import com.yyk.dto.UserDTO.SysUserListReqDTO;
import com.yyk.dto.baseCodeDTO.BaseCodeDTO;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.BaseCodeService;
import com.yyk.service.SysLineService;
import com.yyk.util.JsonChangeUtil;


/**
 * 
 * @author YYK
 * @version 5.2.0
 * @since 
 * 创建时间：2019年4月13日
 * 功能描述：
 */
@Controller
@RequestMapping(Url.LINE_MANAGE)
public class SysLineController {
	
	@Autowired
	@Qualifier("sysLineService")
	private  SysLineService sysLineService;
	
	@Autowired
	@Qualifier("baseCodeService")
	private BaseCodeService baseCodeService;
	
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
	   return Views.LINE_VIEW;
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
	 @RequestMapping(value = Url.SELECT_LEFT_TREE, method = RequestMethod.POST)
		public @ResponseBody String selectLeftTrees() {
		    List<BaseCodeDTO> baselistdto=sysLineService.selectLeftTrees();
			return JsonChangeUtil.list2json(baselistdto);
		}
	 
		 
	 
	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE, method = RequestMethod.POST)
	 public @ResponseBody String queryPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 ResDataDTO<List<SysLine>>  list =new ResDataDTO<List<SysLine>>();
		 SysLine sysLine=new SysLine();
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
	            
	            if (obj.get("name").equals("parentCode")){
	            	if(!"".equals(obj.get("value")) && obj.get("value")!=null){
	            		sysLine.setApplyType(obj.get("value").toString());
	            	}
	            }
	            
	            if (obj.get("name").equals("childerCode")){
	            	if(!"".equals(obj.get("value")) && obj.get("value")!=null){
	            		sysLine.setLineType(obj.get("value").toString());
	            	}
	            }
	        }
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			SysLineCriteria criteria = new SysLineCriteria();
			SysLineCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);
			//查询该适用类别下的所有线路
			if("".equals(sysLine.getApplyType()) ||sysLine.getApplyType()==null ){
				if (StringUtils.isNotBlank(sysLine.getLineType())) { 
					cri.andApplyTypeEqualTo(sysLine.getLineType());
				}
				list=sysLineService.selectApplyTypeListPage(criteria, pageInfo);
			}
			//查询该线路类别下的所有线路
			else
			{
				if (StringUtils.isNotBlank(sysLine.getApplyType())) { 
					cri.andApplyTypeEqualTo(sysLine.getApplyType());
				}
				if (StringUtils.isNotBlank(sysLine.getLineType())) { 
					cri.andLineTypeEqualTo(sysLine.getLineType());
				}
			    list=sysLineService.selectLineTypeListPage(criteria, pageInfo);
			}
			
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	
	    @RequestMapping(value = Url.UPDATE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> UpdateLine(SysLine sysLine) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	//修改
	    	if(StringUtils.isNotBlank(sysLine.getLineId())){
	    		SysLineCriteria criteria = new SysLineCriteria();
				SysLineCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);
	 			cri.andLineIdEqualTo(sysLine.getLineId());	
	 			int i=sysLineService.updateLine(criteria, sysLine);
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
		public @ResponseBody Map<String, Object> deleteInfoLine(@RequestParam(required=false,value = "lineId") String lineId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	SysLineCriteria criteria = new SysLineCriteria();
			SysLineCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);
 			cri.andLineIdEqualTo(lineId);
 			SysLine sysLine=new SysLine();
 			sysLine.setStatus(0);
			int i=sysLineService.updateLine(criteria, sysLine);
			if(i==1){
 			map.put("result", true);
	    	}
	    	else{
	    			map.put("result", false);
	    	}
	    	return map;
		}
	    
	 
	 
	 
	    @RequestMapping(value = Url.ADD_LINE_PAGE, method = RequestMethod.POST)
		 public String addLinePage(){
		   return Views.ADD_LINE_VIEW;
		 }
	 
	    @RequestMapping(value = Url.INSERT_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertLine(SysLine sysLine) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	//新增
	    	SysLineCriteria criteria = new SysLineCriteria();
			SysLineCriteria.Criteria cri = criteria.createCriteria();
	 		cri.andLineCodeEqualTo(sysLine.getLineCode());	
	 		List<SysLine> list=sysLineService.selectLine(criteria);
	 		if(list.isEmpty() && list.size()==0){
	 			int i=sysLineService.insertLine(sysLine);
	 			if(i==1)
	 			{
	 				flag="true";
		 			map.put("result", flag);
	 			}
	 			else
	 			{
	 				flag="false";
		 			map.put("result", flag);
	 			}
	 		}
	 		else{
	 			flag="repeat";
	 			map.put("result", flag);
		    }
	    	return map;
		}
	 
	 
	 
	 
	 
}
