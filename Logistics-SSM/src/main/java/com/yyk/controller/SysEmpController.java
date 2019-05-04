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
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysInvoiceService;
import com.yyk.service.SysUserService;


/**
 * 
 * @author YYK
 * @version 5.2.0
 * @since 
 * 创建时间：2019年5月3日
 * 功能描述：
 */
@Controller
@RequestMapping(Url.EMP_MANAGE)
public class SysEmpController {
	
	
	@Autowired
	@Qualifier("sysEmpService")
	private SysEmpService sysEmpService;
	
	@Autowired
	@Qualifier("sysInvoiceService")
	private  SysInvoiceService sysInvoiceService;
	
	
	/**
	 * 
	* @author yyk  
	* @Title: get 
	* @Package com.yyk.controller  
	* @Description: TODO
	* @return
	* @return String   
	* @date 2019年5月3日 上午9:27:58     
	* @throws 
	 */
	 @RequestMapping("/")
	 public String get(){
		 System.out.println("员工");
	   return Views.EMP_VIEW;
	 }

	 /**
	  * 
	 * @author yyk  
	 * @Title: queryPages 
	 * @Package com.yyk.controller  
	 * @Description: TODO
	 * @param aoData
	 * @return
	 * @return String   
	 * @date 2019年5月3日 上午9:49:58     
	 * @throws 
	  */
	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE, method = RequestMethod.POST)
		public @ResponseBody String queryPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysEmp sysEmp=new SysEmp();
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
	            
	            if (obj.get("name").equals("empNameSearch")){
	            	sysEmp.setEmpName( obj.get("value").toString());
	            }
	            
	            if (obj.get("name").equals("empCodeSearch")){
	            	sysEmp.setEmpCode(obj.get("value").toString());
	            }
	            if (obj.get("name").equals("jobNameSearch")){
	            	sysEmp.setJobName(obj.get("value").toString());
	            }
	        }
		    SysEmpCriteria criteria = new SysEmpCriteria();
		    SysEmpCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
			if (StringUtils.isNotBlank(sysEmp.getEmpName())) { // 员工姓名查询
				cri.andEmpNameLike("%" + sysEmp.getEmpName() + "%");
			}
			if (StringUtils.isNotBlank(sysEmp.getEmpCode())) { // 员工代码查询
				cri.andEmpCodeLike("%" + sysEmp.getEmpCode() + "%");
			}
			if (StringUtils.isNotBlank(sysEmp.getJobName())) { // 员工所属职位名称查询
				cri.andJobNameLike("%" +sysEmp.getJobName() + "%");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<SysEmp>> list=sysEmpService.selectSysEmpByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
		 
	 	/**
	 	 * 
	 	* @author yyk  
	 	* @Title: insertOrUpdateEmp 
	 	* @Package com.yyk.controller  
	 	* @Description: TODO
	 	* @param sysEmp
	 	* @return
	 	* @return Map<String,Object>   
	 	* @date 2019年5月3日 上午9:59:11     
	 	* @throws 
	 	 */
	    @RequestMapping(value = Url.INSERT_OR_UPDATE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertOrUpdateEmp(SysEmp sysEmp) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	//修改
	    	SysEmpCriteria criteria = new SysEmpCriteria();
		    SysEmpCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
	    	if(StringUtils.isNotBlank(sysEmp.getEmpId())){
	 			cri.andEmpIdEqualTo(sysEmp.getEmpId());	    		
	 			int i=sysEmpService.updateEmp(criteria, sysEmp);
		    	if(i==1){
		    		flag="true";
		    		map.put("result", flag);
		    	}
		    	else{
		    		flag="false";
		    		map.put("result", flag);
		    	}
	    	}
	    	else //新增
	    	{
	    		if(StringUtils.isNotBlank(sysEmp.getEmpCode())){
	    			cri.andEmpCodeEqualTo(sysEmp.getEmpCode());
	    		}
	    		List<SysEmp> list=sysEmpService.selectInfoEmp(criteria);
	    		if(list.isEmpty() || list.size()==0){
	    			int i=sysEmpService.insertEmp(sysEmp);
			    	if(i==1){
			    		flag="true";
			    		map.put("result", flag);
			    	}
			    	else{
			    		flag="false";
			    		map.put("result", flag);
			    	}
	    		}
	    		else{
	    			flag="repeat";
		    		map.put("result", flag);
	    		}
	    		
	    	}
	    	return map;
		}
	 
	    /**
	     * 
	    * @author yyk  
	    * @Title: deleteInfoEmp 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @param empId
	    * @return
	    * @return Map<String,Object>   
	    * @date 2019年5月3日 上午9:59:07     
	    * @throws 
	     */
	    @RequestMapping(value = Url.DELETE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteInfoEmp(@RequestParam(required=false,value = "empId") String empId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	SysInvoiceCriteria criteria = new SysInvoiceCriteria();
	    	SysInvoiceCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);
 			cri.andEmpIdEqualTo(empId);
	    	List<SysInvoice> list=sysInvoiceService.selectSysInvoice(criteria);
	    	if(list.isEmpty() || list.size()==0){
	    		SysEmpCriteria criteria2 = new SysEmpCriteria();
			    SysEmpCriteria.Criteria cri2 = criteria2.createCriteria();
				cri2.andStatusEqualTo(1);// 只查询状态为1的
	 			cri2.andEmpIdEqualTo(empId);	 
				SysEmp sysEmp=new SysEmp();
				sysEmp.setStatus(0);
				int i=sysEmpService.updateEmp(criteria2, sysEmp);
				if(i==1){
					flag="true";
					map.put("result", flag);
		    	}
		    	else{
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
	    
	   /**
	    * 
	   * @author yyk  
	   * @Title: deleteListUser 
	   * @Package com.yyk.controller  
	   * @Description: TODO
	   * @param empId
	   * @return
	   * @return Map<String,Object>   
	   * @date 2019年5月3日 上午9:59:02     
	   * @throws 
	    */
	    @RequestMapping(value = Url.DELETE_LIST, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteListUser(@RequestParam(required=false,value = "idListStr") String empId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	SysEmpCriteria criteria = new SysEmpCriteria();
		    SysEmpCriteria.Criteria cri = criteria.createCriteria();
			List<String> empIds=Arrays.asList(empId.split(","));
			cri.andStatusEqualTo(1);// 只查询状态为1的
			cri.andEmpIdIn(empIds);
			SysEmp sysEmp=new SysEmp();
			sysEmp.setStatus(0);
			int i=sysEmpService.updateEmp(criteria, sysEmp);
			if(i>=1){
 			map.put("result", true);
	    	}
	    	else{
	    			map.put("result", false);
	    	}
	    	return map;
		}
	 
	 
	 
	 
	 
	 
	 
}
