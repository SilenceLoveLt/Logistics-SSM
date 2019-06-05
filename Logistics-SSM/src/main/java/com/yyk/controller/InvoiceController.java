package com.yyk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.yyk.dto.OrderDTO.CheckOrderResDTO;
import com.yyk.dto.OrderDTO.OrderResDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysGoods;
import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;
import com.yyk.entity.SysOrder;
import com.yyk.entity.SysOrderCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysVehicle;
import com.yyk.entity.SysVehicleCriteria;
import com.yyk.service.BaseCodeService;
import com.yyk.service.GoodsService;
import com.yyk.service.InvoiceService;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysLineService;
import com.yyk.service.SysOrderService;
import com.yyk.service.SysUserService;
import com.yyk.service.SysVehicleService;
import com.yyk.util.JsonChangeUtil;


/**
 * 
 * @author YYK
 * @version 5.2.0
 * @since 
 * 创建时间：2019年5月3日
 * 功能描述：
 */
@Controller
@RequestMapping(Url.INVOICE_MANAGE)
public class InvoiceController {
	
	
	@Autowired
	@Qualifier("sysOrderService")
	private SysOrderService sysOrderService;
	
	@Autowired
	@Qualifier("goodsService")
	private GoodsService goodsService;

	@Autowired
	@Qualifier("sysEmpService")
	private SysEmpService sysEmpService;
	
	@Autowired
	@Qualifier("sysLineService")
	private  SysLineService sysLineService;
	
	@Autowired
	@Qualifier("sysVehicleService")
	private  SysVehicleService sysVehicleService;
	
	@Autowired
	@Qualifier("invoiceService")
	private  InvoiceService invoiceService;
	
	
	
	
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
	 @RequestMapping(value = Url.ADD_INVOICE_PAGE, method = RequestMethod.POST)
	 public String insertPage(final ModelMap model){
		SysEmpCriteria criteria = new SysEmpCriteria();
		SysEmpCriteria.Criteria cri = criteria.createCriteria();
	    cri.andStatusEqualTo(1);// 只查询状态为1的
		List<SysEmp> empList=sysEmpService.selectInfoEmp(criteria);
		SysLineCriteria lineCriteria = new SysLineCriteria();
		SysLineCriteria.Criteria lineCri = lineCriteria.createCriteria();
		lineCri.andStatusEqualTo(1);
		List<SysLine> lineList=sysLineService.selectInfoLine(lineCriteria);
		SysVehicleCriteria vehicleCriteria = new SysVehicleCriteria();
		SysVehicleCriteria.Criteria vehicleCri = vehicleCriteria.createCriteria();
		vehicleCri.andStatusEqualTo(1);
		List<SysVehicle> vehicleList=sysVehicleService.selectVehicle(vehicleCriteria);
		model.put("empList", JsonChangeUtil.list2json(empList));
		model.put("lineList", JsonChangeUtil.list2json(lineList));
		model.put("vehicleList", JsonChangeUtil.list2json(vehicleList));
	    return Views.ADD_INVOICE_VIEW;
	 }

	 
	
	 @RequestMapping(value = Url.INSERT_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertInvoice(SysInvoice sysInvoice) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	/**
	    	 *  InvoiceStatus:1  代表 已发货
	    	 *  InvoiceStatus:2  代表 运输中
	    	 *  InvoiceStatus:3  代表 派送中
	    	 *  InvoiceStatus:4  代表 已签收 
	    	 *  
	    	 */
	 		int i=invoiceService.insertInvoice(sysInvoice);
		    if(i==1){
		    	flag="true";
		    	map.put("result", flag);
		    }
		    else{
		    	flag="false";
		    	map.put("result", flag);
		    }
	    	return map;
		}
	 
	 
	 
	 @RequestMapping("/")
	 public String addVehicle(){
	   return Views.INVOICE_VIEW;
	 }
	 
	 
	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE,  produces = "application/json;charset=utf-8",method = RequestMethod.POST)
		public @ResponseBody String selectPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysInvoice sysInvoice=new SysInvoice();
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
	            
	            if (obj.get("name").equals("orderIdSearch")){
	            	sysInvoice.setOrderId(obj.get("value").toString());
	            }
	        }
		    SysInvoiceCriteria criteria = new SysInvoiceCriteria();
		    SysInvoiceCriteria.Criteria cri = criteria.createCriteria();
		    cri.andStatusEqualTo(1);
			if (StringUtils.isNotBlank(sysInvoice.getOrderId())) { // 查询起止时间时间大于等于开始
				cri.andOrderIdEqualTo(sysInvoice.getOrderId());
			}
			else
			{
				cri.andOrderIdEqualTo("");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List< OrderResDTO>> list=invoiceService.selectInvoiceByOrderId(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
	 
	 
	 
	 @RequestMapping(value = Url.UPDATE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> updateInvoice(@RequestParam(required=false,value = "invoiceId") String invoiceId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	/**
	    	 *  InvoiceStatus:1  代表 已发货
	    	 *  InvoiceStatus:2  代表 运输中
	    	 *  InvoiceStatus:3  代表 派送中
	    	 *  InvoiceStatus:4  代表 已签收 
	    	 *  
	    	 */
	    	SysInvoiceCriteria criteria = new SysInvoiceCriteria();
			SysInvoiceCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusNotEqualTo(0);   // 只查询状态为1的
			if(StringUtils.isNotBlank(invoiceId)){
				cri.andInvoiceIdEqualTo(invoiceId);	    
			}
			SysInvoice sysInvoice=new SysInvoice();
			sysInvoice.setInvoiceStatus(4);
	 		int i=invoiceService.updateInvoice(criteria, sysInvoice);
		    if(i==1){
		    	flag="true";
		    	map.put("result", flag);
		    }
		    else{
		    	flag="false";
		    	map.put("result", flag);
		    }
	    	
	    	return map;
		}
	 
	 
	 
}
