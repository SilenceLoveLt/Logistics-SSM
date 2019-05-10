package com.yyk.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import com.yyk.entity.SysEmpJob;
import com.yyk.entity.SysEmpJobCriteria;
import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysEmpJobService;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysInvoiceService;
import com.yyk.service.SysJobService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;


/**
 * 
 * @author YYK
 * @version 5.2.0
 * @since 
 * 创建时间：2019年5月3日
 * 功能描述：
 */
@Controller
@RequestMapping(Url.EMP_JOB_MANAGE)
public class EmpJobController {
	
	
	@Autowired
	@Qualifier("sysEmpService")
	private SysEmpService sysEmpService;
	
	@Autowired
	@Qualifier("sysJobService")
	private SysJobService sysJobService;
	
	@Autowired
	@Qualifier("sysEmpJobService")
	private SysEmpJobService sysEmpJobService;
	
	
	@Autowired
	@Qualifier("sysInvoiceService")
	private  SysInvoiceService sysInvoiceService;
	
	
	 

	    @RequestMapping(value = Url.ON_JOB_MANAGE, method = RequestMethod.POST)
		public @ResponseBody String selectOnJobList(@RequestParam(required=false,value = "aoData") String aoData) {
	    	JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
	    	SysEmpJob sysEmpJob=new SysEmpJob();
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
	            if (obj.get("name").equals("empIdSearch")){
	            	sysEmpJob.setEmpId( obj.get("value").toString());
	            }
	        }
	    	SysEmpJobCriteria criteria = new SysEmpJobCriteria();
	    	SysEmpJobCriteria.Criteria cri = criteria.createCriteria();
	    	cri.andStatusEqualTo(1);
	    	if (StringUtils.isNotBlank(sysEmpJob.getEmpId())) { // 员工姓名查询
				cri.andEmpIdEqualTo(sysEmpJob.getEmpId());
			}
	    	if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
	    	List<SysEmpJob> empList=sysEmpJobService.selectInfoEmpJob(criteria);
	    	List<String> jobIds=new ArrayList<String>();
	    	if(!empList.isEmpty() && empList.size()>0){
	    		for(SysEmpJob jobId:empList){
	    			jobIds.add(jobId.getJobId());
	    		}
	    	}
	    	SysJobCriteria criteria2 = new SysJobCriteria();
	    	SysJobCriteria.Criteria cri2 = criteria2.createCriteria();
	    	cri2.andStatusEqualTo(1);
	    	if(!jobIds.isEmpty() &&jobIds.size()>0){
	    		cri2.andJobIdIn(jobIds);
	    	}
	    	else{
	    		cri2.andJobIdEqualTo("");
	    	}
			ResDataDTO<List<SysJob>> list=sysJobService.selectSysJobByPage(criteria2, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
	 
	    @RequestMapping(value = Url.OFF_JOB_MANAGE, method = RequestMethod.POST)
		public @ResponseBody String selectOffJobList(@RequestParam(required=false,value = "aoData") String aoData) {
	    	JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
	    	SysEmpJob sysEmpJob=new SysEmpJob();
			String sEcho = null;
			PageInfo pageInfo=new PageInfo();
			for (int i = 0; i < jsonarray.size(); i++) {
	            JSONObject obj = (JSONObject) jsonarray.get(i);
	            if (obj.get("name").equals("empIdSearch")){
	            	sysEmpJob.setEmpId( obj.get("value").toString());
	            }
	        }
	    	SysEmpJobCriteria criteria = new SysEmpJobCriteria();
	    	SysEmpJobCriteria.Criteria cri = criteria.createCriteria();
	    	cri.andStatusEqualTo(1);
	    	if (StringUtils.isNotBlank(sysEmpJob.getEmpId())) { // 员工Id查询
				cri.andEmpIdEqualTo(sysEmpJob.getEmpId());
			}
	    	List<SysEmpJob> empList=sysEmpJobService.selectInfoEmpJob(criteria);
	    	List<String> jobIds=new ArrayList<String>();
	    	if(!empList.isEmpty() && empList.size()>0){
	    		for(SysEmpJob jobId:empList){
	    			jobIds.add(jobId.getJobId());
	    		}
	    	}
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
	        }
	    	if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
	    	SysJobCriteria criteria2 = new SysJobCriteria();
	    	SysJobCriteria.Criteria cri2 = criteria2.createCriteria();
	    	cri2.andStatusEqualTo(1);
	    	if(!jobIds.isEmpty() &&jobIds.size()>0){
	    		cri2.andJobIdNotIn(jobIds);
	    	}
			ResDataDTO<List<SysJob>> list=sysJobService.selectSysJobByPage(criteria2, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
	 
	    @RequestMapping(value = Url.INSERT_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertEmpJob(@RequestParam(required=false,value = "empId") String empId,
				@RequestParam(required=false,value = "idListStr") String idListStr) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	//批量新增
	    	List<SysEmpJob> list=new ArrayList<SysEmpJob>();
	    	List<String> jobIds=Arrays.asList(idListStr.split(","));
	    	for(String jobId:jobIds){
	    		SysEmpJob sysEmpJob=new SysEmpJob();
	    		sysEmpJob.setCreateTime(new Date());
	    		sysEmpJob.setUpdateTime(new Date());
	    		sysEmpJob.setStatus(1);
	    		sysEmpJob.setEmpId(empId);
	    		sysEmpJob.setEmpJobId(UUIDGenerator.create32Key());
	    		sysEmpJob.setJobId(jobId);
	    		SysJobCriteria criteria = new SysJobCriteria();
				SysJobCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);// 只查询状态为1的
				List<SysJob> jodlist=sysJobService.selectInfoJob(criteria);
				sysEmpJob.setJobCode(jodlist.get(0).getJobCode());
	    		list.add(sysEmpJob);
	    	}
	    	int i=sysEmpJobService.insertEmpJob(list);
	    	if(i<=0){
	    		map.put("result", false);
	    		return map;
	    	}
	 		map.put("result", true);
	    	return map;
		}
	    
	    
	 
	    @RequestMapping(value = Url.DELETE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteInfoEmpJob(@RequestParam(required=false,value = "empId") String empId,
				@RequestParam(required=false,value = "idListStr") String idListStr) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	SysEmpJobCriteria criteria = new SysEmpJobCriteria();
	    	SysEmpJobCriteria.Criteria cri = criteria.createCriteria();
	    	List<String> jobIds=Arrays.asList(idListStr.split(","));
	    	cri.andEmpIdEqualTo(empId);
	    	cri.andJobIdIn(jobIds);
	    	SysEmpJob sysEmpJob=new SysEmpJob();
	    	sysEmpJob.setStatus(0);
	    	int i=sysEmpJobService.updateEmpJob(criteria, sysEmpJob);
	    	if(i!=jobIds.size()){
	    		map.put("result", false);
	    		return map;
	    	}
	 		map.put("result", true);
	    	return map;
		}
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
}
