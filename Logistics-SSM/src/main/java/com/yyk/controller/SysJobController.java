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
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysEmpJob;
import com.yyk.entity.SysEmpJobCriteria;
import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import com.yyk.service.SysEmpJobService;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysJobService;

@Controller
@RequestMapping(Url.JOB_MANAGE)
public class SysJobController {
	
	@Autowired
	@Qualifier("sysJobService")
	private SysJobService sysJobService;
	
	@Autowired
	@Qualifier("sysEmpJobService")
	private SysEmpJobService sysEmpJobService;
	
	
	 @RequestMapping("/")
	 public String get(){
	   return Views.JOB_VIEW;
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
			 SysJob sysJob=new SysJob();
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
		            
		            if (obj.get("name").equals("jobCodeSearch")){
		            	sysJob.setJobCode(obj.get("value").toString());
		            }
		            if (obj.get("name").equals("jobNameSearch")){
		            	sysJob.setJobName(obj.get("value").toString());
		            }
		        }
			    SysJobCriteria criteria = new SysJobCriteria();
			    SysJobCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);// 只查询状态为1的
				if (StringUtils.isNotBlank(sysJob.getJobCode())) { // 员工代码查询
					cri.andJobCodeLike("%" + sysJob.getJobCode() + "%");
				}
				if (StringUtils.isNotBlank(sysJob.getJobName())) { // 员工所属职位名称查询
					cri.andJobNameLike("%" +sysJob.getJobName() + "%");
				}
				if(pageInfo!=null)
				{
					if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
						
					}
				}
				ResDataDTO<List<SysJob>> list=sysJobService.selectSysJobByPage(criteria, pageInfo);
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
			public @ResponseBody Map<String, Object> insertOrUpdateJob(SysJob sysJob) {
		    	Map<String, Object> map = new HashMap<String, Object>();
		    	String flag=null;
		    	//修改
		    	SysJobCriteria criteria = new SysJobCriteria();
		    	SysJobCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);// 只查询状态为1的
		    	if(StringUtils.isNotBlank(sysJob.getJobId())){
		 			cri.andJobIdEqualTo(sysJob.getJobId());	    		
		 			int i=sysJobService.updateJob(criteria, sysJob);
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
		    		if(StringUtils.isNotBlank(sysJob.getJobCode())){
		    			cri.andJobCodeEqualTo(sysJob.getJobCode());
		    		}
		    		List<SysJob> list=sysJobService.selectInfoJob(criteria);
		    		if(list.isEmpty() || list.size()==0){
		    			int i=sysJobService.insertJob(sysJob);
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
			public @ResponseBody Map<String, Object> deleteInfoJob(@RequestParam(required=false,value = "jobId") String jobId) {
		    	Map<String, Object> map = new HashMap<String, Object>();
		    	String flag=null;
		    	SysEmpJobCriteria criteria = new SysEmpJobCriteria();
		    	SysEmpJobCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);
	 			cri.andJobIdEqualTo(jobId);
		    	List<SysEmpJob> list=sysEmpJobService.selectInfoEmpJob(criteria);
		    	if(list.isEmpty() || list.size()==0){
		    		SysJobCriteria criteria2 = new SysJobCriteria();
		    		SysJobCriteria.Criteria cri2 = criteria2.createCriteria();
					cri2.andStatusEqualTo(1);// 只查询状态为1的
		 			cri2.andJobIdEqualTo(jobId);	 
		 			SysJob sysJob=new SysJob();
		 			sysJob.setStatus(0);
					int i=sysJobService.updateJob(criteria2, sysJob);
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
			public @ResponseBody Map<String, Object> deleteListUser(@RequestParam(required=false,value = "idListStr") String jobId) {
		    	Map<String, Object> map = new HashMap<String, Object>();
		    	String flag=null;
		    	List<String> jobIds=Arrays.asList(jobId.split(","));
		    	SysEmpJobCriteria criteria = new SysEmpJobCriteria();
		    	SysEmpJobCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);
	 			cri.andJobIdIn(jobIds);
		    	List<SysEmpJob> list=sysEmpJobService.selectInfoEmpJob(criteria);
		    	if(list.isEmpty() || list.size()==0){
		    		SysJobCriteria criteria2 = new SysJobCriteria();
		    		SysJobCriteria.Criteria cri2 = criteria2.createCriteria();
					cri2.andStatusEqualTo(1);// 只查询状态为1的
					cri2.andJobIdIn(jobIds);
					SysJob sysJob=new SysJob();
		 			sysJob.setStatus(0);
					int i=sysJobService.updateJob(criteria2, sysJob);
					if(i>=1){
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
		 
}
