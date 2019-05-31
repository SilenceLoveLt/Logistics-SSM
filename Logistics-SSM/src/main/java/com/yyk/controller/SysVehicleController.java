package com.yyk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
import com.yyk.dto.BaseCodeDTO.BaseCodeDTO;
import com.yyk.dto.VehicleDTO.VehicleResDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysVehicle;
import com.yyk.entity.SysVehicleCriteria;
import com.yyk.service.BaseCodeService;
import com.yyk.service.InvoiceService;
import com.yyk.service.SysVehicleService;
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
@RequestMapping(Url.VHEICLE_MANAGE)
public class SysVehicleController {
	
	@Autowired
	@Qualifier("sysVehicleService")
	private  SysVehicleService sysVehicleService;
	
	@Autowired
	@Qualifier("invoiceService")
	private  InvoiceService invoiceService;
	
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
	 public String indexPage(final ModelMap model){
		List<BaseCode> applyTypeList = selectCode("APPLYTYPE");
		List<BaseCode> vehicleTypeList = selectCode("VEHICLETYPE");
		model.put("applyTypeList", JsonChangeUtil.list2json(applyTypeList));
		model.put("vehicleTypeList", JsonChangeUtil.list2json(vehicleTypeList));
	    return Views.VEHICLE_VIEW;
	 }
	 
	 public List<BaseCode> selectCode(String codeType){
			BaseCodeCriteria criteria = new BaseCodeCriteria();
			BaseCodeCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1); 
			cri.andCodeTypeEqualTo(codeType);
			List<BaseCode> topicTypeList = this.baseCodeService.selectInfoCode(criteria);
		    return topicTypeList;
	}
	
	/**
	 * 
	* @author yyk  
	* @Title: selectLeftTrees 
	* @Package com.yyk.controller  
	* @Description: TODO
	* @return
	* @return String   
	* @date 2019年5月2日 下午8:52:27     
	* @throws 
	 */
	 @RequestMapping(value = Url.SELECT_LEFT_TREE,  produces = "application/json;charset=utf-8",method = RequestMethod.POST)
		public @ResponseBody String selectLeftTrees() {
		    List<BaseCodeDTO> baselistdto=sysVehicleService.selectLeftTrees();
			return JsonChangeUtil.list2json(baselistdto);
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
	 * @date 2019年5月2日 下午8:52:32     
	 * @throws 
	  */
	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE, produces = "application/json;charset=utf-8", method = RequestMethod.POST)
	 public @ResponseBody String queryPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 ResDataDTO<List<VehicleResDTO>>  list =new ResDataDTO<List<VehicleResDTO>>();
		 SysVehicle sysVehicle=new SysVehicle();
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
	            		sysVehicle.setApplyType(obj.get("value").toString());
	            	}
	            }
	            
	            if (obj.get("name").equals("childerCode")){
	            	if(!"".equals(obj.get("value")) && obj.get("value")!=null){
	            		sysVehicle.setVehicleType(obj.get("value").toString());
	            	}
	            }
	        }
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			SysVehicleCriteria criteria = new SysVehicleCriteria();
			SysVehicleCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);
			//查询该适用类别下的所有线路
			if("".equals(sysVehicle.getApplyType()) ||sysVehicle.getApplyType()==null ){
				if (StringUtils.isNotBlank(sysVehicle.getVehicleType())) { 
					cri.andApplyTypeEqualTo(sysVehicle.getVehicleType());
				}
				list=sysVehicleService.selectApplyTypeListPage(criteria, pageInfo);
			}
			//查询该线路类别下的所有线路
			else
			{
				if (StringUtils.isNotBlank(sysVehicle.getApplyType())) { 
					cri.andApplyTypeEqualTo(sysVehicle.getApplyType());
				}
				if (StringUtils.isNotBlank(sysVehicle.getVehicleType())) { 
					cri.andVehicleTypeEqualTo(sysVehicle.getVehicleType());
				}
			    list=sysVehicleService.selectVehicleTypeListPage(criteria, pageInfo);
			}
			
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
	 	* @Title: updateVehicle 
	 	* @Package com.yyk.controller  
	 	* @Description: TODO
	 	* @param sysVehicle
	 	* @return
	 	* @return Map<String,Object>   
	 	* @date 2019年5月2日 下午8:52:40     
	 	* @throws 
	 	 */
	    @RequestMapping(value = Url.UPDATE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> updateVehicle(SysVehicle sysVehicle) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	//修改
	    	if(StringUtils.isNotBlank(sysVehicle.getVehicleId())){
				SysVehicleCriteria criteria = new SysVehicleCriteria();
				SysVehicleCriteria.Criteria cri = criteria.createCriteria();
				cri.andStatusEqualTo(1);
	 			cri.andVehicleIdEqualTo(sysVehicle.getVehicleId());	
	 			int i=sysVehicleService.updateVehicle(criteria, sysVehicle);
		    	if(i==1){
		    			map.put("result", true);
		    	}
		    	else{
		    			map.put("result", false);
		    	}
	    	}
	    	return map;
		}
	 
	 
	    /**
	     * 
	    * @author yyk  
	    * @Title: deleteInfoVehicle 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @param vehicleId
	    * @return
	    * @return Map<String,Object>   
	    * @date 2019年5月2日 下午8:52:45     
	    * @throws 
	     */
	    @RequestMapping(value = Url.DELETE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteInfoVehicle(@RequestParam(required=false,value = "vehicleId") String vehicleId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	SysInvoiceCriteria criteria = new SysInvoiceCriteria();
	    	SysInvoiceCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);
 			cri.andVehicleIdEqualTo(vehicleId);
 			cri.andInvoiceStatusNotEqualTo(4);//不考虑配送状态为 “已签收”
	    	List<SysInvoice> list=invoiceService.selectInfoInvoice(criteria);
	    	if(list.isEmpty() || list.size()==0){
	    		SysVehicleCriteria criteria2 = new SysVehicleCriteria();
				SysVehicleCriteria.Criteria cri2 = criteria2.createCriteria();
				cri2.andStatusEqualTo(1);
				cri2.andVehicleIdEqualTo(vehicleId);
	 			SysVehicle sysVehicle=new SysVehicle();
	 			sysVehicle.setStatus(0);
				int i=sysVehicleService.updateVehicle(criteria2, sysVehicle);
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
	    * @Title: addLinePage 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @return
	    * @return String   
	    * @date 2019年5月2日 下午8:52:51     
	    * @throws 
	     */
	    @RequestMapping(value = Url.ADD_VEHICLE_PAGE, method = RequestMethod.POST)
		 public String addVehiclePage(final ModelMap model){
	    	List<BaseCode> vehicleTypeList = selectCode("VEHICLETYPE");
			List<BaseCode> applyTypeList = selectCode("APPLYTYPE");
			model.put("vehicleTypeList", JsonChangeUtil.list2json(vehicleTypeList));
			model.put("applyTypeList", JsonChangeUtil.list2json(applyTypeList));
		   return Views.ADD_VEHICLE_VIEW;
		 }
	 
	    
	    /**
	     * 
	    * @author yyk  
	    * @Title: insertVehicle 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @param sysVehicle
	    * @return
	    * @return Map<String,Object>   
	    * @date 2019年5月2日 下午8:52:55     
	    * @throws 
	     */
	    @RequestMapping(value = Url.INSERT_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertVehicle(SysVehicle sysVehicle) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	//新增
	    	SysVehicleCriteria criteria = new SysVehicleCriteria();
			SysVehicleCriteria.Criteria cri = criteria.createCriteria();
	 		cri.andVehicleCodeEqualTo(sysVehicle.getVehicleCode());	
	 		List<SysVehicle> list=sysVehicleService.selectVehicle(criteria);
	 		if(list.isEmpty() || list.size()==0){
	 			int i=sysVehicleService.insertVehicle(sysVehicle);
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
