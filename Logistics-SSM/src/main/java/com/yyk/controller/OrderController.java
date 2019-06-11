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
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysOrder;
import com.yyk.entity.SysOrderCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.BaseCodeService;
import com.yyk.service.GoodsService;
import com.yyk.service.InvoiceService;
import com.yyk.service.SysOrderService;
import com.yyk.service.SysUserService;
import com.yyk.util.JsonChangeUtil;
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
@RequestMapping(Url.ORDER_MANAGE)
public class OrderController {
	
	
	@Autowired
	@Qualifier("sysOrderService")
	private SysOrderService sysOrderService;
	
	@Autowired
	@Qualifier("goodsService")
	private GoodsService goodsService;
	
	@Autowired
	@Qualifier("sysUserService")
	private SysUserService sysUserService;
	
	
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
	* @date 2019年5月3日 上午9:27:58     
	* @throws 
	 */
	 @RequestMapping(value = Url.CHECK_ORDER_MANAGE, method = RequestMethod.POST)
	 public String checkOrder(){
		 System.out.println("订单");
	   return Views.CHECK_ORDER_VIEW;
	 }

	 
	 /**
	  * 
	 * @author yyk  
	 * @Title: selectCode 
	 * @Package com.yyk.controller  
	 * @Description: TODO
	 * @param codeType
	 * @return
	 * @return List<BaseCode>   
	 * @date 2019年5月20日 下午1:22:18     
	 * @throws 
	  */
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
	 * @Title: queryPages 
	 * @Package com.yyk.controller  
	 * @Description: TODO
	 * @param aoData
	 * @return
	 * @return String   
	 * @date 2019年5月3日 上午9:49:58     
	 * @throws 
	  */
	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE,  produces = "application/json;charset=utf-8",method = RequestMethod.POST)
		public @ResponseBody String queryPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysOrder sysOrder=new SysOrder();
		 String sEcho = null;
		 PageInfo pageInfo=new PageInfo();
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
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
	            
	            if (obj.get("name").equals("createTimeSearch")){
	            	try {
	            		if(obj.get("value").toString()!=null && !"".equals(obj.get("value").toString())){
	            			sysOrder.setCreateTime( sdf.parse(obj.get("value").toString()));
	            		}
					} catch (ParseException e) {
						e.printStackTrace();
					}
	            }
	            if (obj.get("name").equals("updteTimeSearch")){
	            	try {
	            		if(obj.get("value").toString()!=null && !"".equals(obj.get("value").toString()) ){
	            			sysOrder.setUpdateTime( sdf.parse(obj.get("value").toString()));
	            		}
					} catch (ParseException e) {
						e.printStackTrace();
					}
	            }
	        }
		    SysOrderCriteria criteria = new SysOrderCriteria();
		    SysOrderCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusNotEqualTo(0);// 只查询状态为1的。
			cri.andOrderStatusNotEqualTo(3);   //去掉已取消订单
			if (sysOrder.getCreateTime()!=null) { // 查询起止时间时间大于等于开始
				cri.andCreateTimeGreaterThanOrEqualTo(sysOrder.getCreateTime());
			}
			if (sysOrder.getUpdateTime()!=null) { // 查询结束时间小于等于结束
				cri.andUpdateTimeLessThanOrEqualTo(sysOrder.getUpdateTime());
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<CheckOrderResDTO>> list=sysOrderService.selectSysOrderByPage(criteria, pageInfo);
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
	 * @Title: checkOrder 
	 * @Package com.yyk.controller  
	 * @Description: TODO
	 * @param orderId
	 * @return
	 * @return Map<String,Object>   
	 * @date 2019年5月20日 下午1:22:10     
	 * @throws 
	  */
	 @RequestMapping(value = Url.CHECK_ORDER_LIST, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> checkOrder(@RequestParam(required=false,value = "orderId") String orderId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	/**
	    	 *  OrderStatus:1 代表待审核
	    	 *  OrderStatus:2 代表审核通过
	    	 *  OrderStatus:3代表取消订单
	    	 *  
	    	 */
	    	SysOrderCriteria criteria = new SysOrderCriteria();
		    SysOrderCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusNotEqualTo(0);   // 只查询状态为1的
			if(StringUtils.isNotBlank(orderId)){
				cri.andOrderIdEqualTo(orderId);	    
			}
			SysOrder sysOrder=new SysOrder();
			sysOrder.setOrderStatus(2);
	 		int i=sysOrderService.updateOrder(criteria, sysOrder);
		    if(i==1){
		    	flag="true";
		    	map.put("orderStatus",2);
		    	map.put("result", flag);
		    }
		    else{
		    	flag="false";
		    	map.put("result", flag);
		    }
	    	
	    	return map;
		}
	 
	 /**
	  * 
	 * @author yyk  
	 * @Title: cancelOrder 
	 * @Package com.yyk.controller  
	 * @Description: TODO
	 * @return
	 * @return String   
	 * @date 2019年5月20日 下午1:22:06     
	 * @throws 
	  */
	 @RequestMapping(value = Url.CANCEL_ORDER_MANAGE, method = RequestMethod.POST)
	 public String cancelOrder(){
		 System.out.println("订单");
	   return Views.CANCEL_ORDER_VIEW;
	 }
	 
	 
	 /**
	  * 
	 * @author yyk  
	 * @Title: chanelQueryPages 
	 * @Package com.yyk.controller  
	 * @Description: TODO
	 * @param aoData
	 * @return
	 * @return String   
	 * @date 2019年5月20日 下午1:22:02     
	 * @throws 
	  */
	 @RequestMapping(value = Url.SELECT_CANCEL_BY_PAGE,  produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public @ResponseBody String chanelQueryPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysOrder sysOrder=new SysOrder();
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
					sysOrder.setOrderId(obj.get("value").toString());
	            }
	        }
		    SysOrderCriteria criteria = new SysOrderCriteria();
		    SysOrderCriteria.Criteria cri = criteria.createCriteria();
		    cri.andStatusNotEqualTo(0);// 只查询状态为1的。
			//cri.andOrderStatusNotEqualTo(2);  //只查询出待审核
			if (StringUtils.isNotBlank(sysOrder.getOrderId())) { // 查询起止时间时间大于等于开始
				cri.andOrderIdEqualTo(sysOrder.getOrderId());
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
			ResDataDTO<List<CheckOrderResDTO>> list=sysOrderService.selectSysOrderByPage(criteria, pageInfo);
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
	   * @Title: cancelOrder 
	   * @Package com.yyk.controller  
	   * @Description: TODO
	   * @param orderId
	   * @return
	   * @return Map<String,Object>   
	   * @date 2019年5月20日 下午1:21:58     
	   * @throws 
	    */
	    @RequestMapping(value = Url.CANCEL_ORDER_LIST, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> cancelOrder(@RequestParam(required=false,value = "orderId") String orderId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	/**
	    	 *  OrderStatus:1 代表待审核
	    	 *  OrderStatus:2 代表审核通过
	    	 *  OrderStatus:3代表取消订单
	    	 *  
	    	 */
	    	SysOrderCriteria criteria = new SysOrderCriteria();
		    SysOrderCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusNotEqualTo(0);   // 只查询状态为1的
			if(StringUtils.isNotBlank(orderId)){
				cri.andOrderIdEqualTo(orderId);	    
			}
			SysOrder sysOrder=new SysOrder();
			sysOrder.setOrderStatus(3);
	 		int i=sysOrderService.updateOrder(criteria, sysOrder);
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
	 
	 
	    
	    /**
	     * 
	    * @author yyk  
	    * @Title: selectOrder 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @return
	    * @return String   
	    * @date 2019年5月20日 下午1:21:52     
	    * @throws 
	     */
	    @RequestMapping(value = Url.SELECT_ORDER_MANAGE, method = RequestMethod.POST)
		 public String selectOrder(){
			 System.out.println("订单");
		   return Views.SELECT_ORDER_VIEW;
		 }
	 
	    
	    /**
	     * 
	    * @author yyk  
	    * @Title: selectOrderByOrderId 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @param aoData
	    * @return
	    * @return String   
	    * @date 2019年5月20日 下午1:21:48     
	    * @throws 
	     */
	    @RequestMapping(value = Url.SELECT_ORDER_BY_PAGE,  produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public @ResponseBody String selectOrderByOrderId(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysOrder sysOrder=new SysOrder();
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
					sysOrder.setOrderId(obj.get("value").toString());
	            }
	            if (obj.get("name").equals("userNameSearch")){
					sysOrder.setUserName(obj.get("value").toString());
	            }
	        }
		    SysOrderCriteria criteria = new SysOrderCriteria();
		    SysOrderCriteria.Criteria cri = criteria.createCriteria();
		    cri.andStatusNotEqualTo(0);// 只查询状态为1的。
		    List<String> orderIds=new ArrayList<String>();
		    
		    if (StringUtils.isNotBlank(sysOrder.getOrderId()) && StringUtils.isBlank(sysOrder.getUserName())) { 
				cri.andOrderIdEqualTo(sysOrder.getOrderId());
			}
		    
		    if (StringUtils.isBlank(sysOrder.getOrderId()) && StringUtils.isNotBlank(sysOrder.getUserName())) { 
		    	cri.andUserNameLike("%"+sysOrder.getUserName()+"%");
			}
		    
		    if (StringUtils.isNotBlank(sysOrder.getOrderId()) && StringUtils.isNotBlank(sysOrder.getUserName())) { 
				cri.andOrderIdEqualTo(sysOrder.getOrderId());
				cri.andUserNameLike("%"+sysOrder.getUserName()+"%");
			}
		    if (StringUtils.isBlank(sysOrder.getOrderId()) && StringUtils.isBlank(sysOrder.getUserName())) { 
				cri.andOrderIdEqualTo("");
				cri.andUserNameLike("");
			}
		    List<SysOrder> sysOrders=sysOrderService.selectInfoOrder(criteria);
		    if(!sysOrders.isEmpty() && sysOrders.size()>0){
		    	for(SysOrder orderid:sysOrders){
		    		orderIds.add(orderid.getOrderId());
		    	}
		    }
		    SysInvoiceCriteria criteria1 = new SysInvoiceCriteria();
		    SysInvoiceCriteria.Criteria cri1 = criteria1.createCriteria();
		    cri1.andStatusNotEqualTo(0);// 只查询状态为1的。
			if (orderIds.size()>0 && !orderIds.isEmpty()) { 
				cri1.andOrderIdIn(orderIds);
			}
			else{
		    	cri1.andOrderIdEqualTo("");
		    }
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<OrderResDTO>> list=sysOrderService.selectOrderByOrderId(criteria1, pageInfo);
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
	    * @Title: insertOrder 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @param model
	    * @return
	    * @return String   
	    * @date 2019年5月20日 下午1:21:43     
	    * @throws 
	     */
	    @RequestMapping(value = Url.ADD_ORDER_MANAGE, method = RequestMethod.POST)
		 public String insertOrder(final ModelMap model){
	    	List<BaseCode> goodsTypeList = selectCode("GOODSTYPE");
			List<BaseCode> payMethodList = selectCode("PEYMETHOD");
			model.put("goodsTypeList", JsonChangeUtil.list2json(goodsTypeList));
			model.put("payMethodList", JsonChangeUtil.list2json(payMethodList));
		   return Views.ADD_ORDER_VIEW;
		 }
	 
	    
	    /**
	     * 
	    * @author yyk  
	    * @Title: insertOrder 
	    * @Package com.yyk.controller  
	    * @Description: TODO
	    * @param sysOrder
	    * @return
	    * @return Map<String,Object>   
	    * @date 2019年5月20日 下午1:21:36     
	    * @throws 
	     */
	    @RequestMapping(value = Url.INSERT_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertOrder(SysOrder sysOrder) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	String orderId=UUIDGenerator.create32Key();
	    	sysOrder.setOrderId(orderId);
	 		int i=sysOrderService.insertOrder(sysOrder);
	 		if(i==1)
	 		{
	 			//新增客户信息   检查该客户是否已经存在 若存在则不增加
	 			SysUserCriteria criteria = new SysUserCriteria();
	 			SysUserCriteria.Criteria cri = criteria.createCriteria();
	 		    cri.andStatusNotEqualTo(0);// 只查询状态为1的。
	 		    if(StringUtils.isNotBlank(sysOrder.getUserName())){
	 		    	cri.andUserNameEqualTo(sysOrder.getUserName());
	 		    }
	 		    if(StringUtils.isNotBlank(sysOrder.getShippPhone())){
	 		    	cri.andUserPhoneEqualTo(sysOrder.getShippPhone());
	 		    }
	 		    if(StringUtils.isNotBlank(sysOrder.getShippAddre())){
	 		    	cri.andAddrEqualTo(sysOrder.getShippAddre());
	 		    }
	 			List<SysUser> list=sysUserService.selectInfoUser(criteria);
	 			if(list.size()<=0 ||  list.isEmpty()){
	 				SysUser sysUser =new SysUser();
		 			sysUser.setUserName(sysOrder.getUserName());
		 			sysUser.setUserPhone(sysOrder.getShippPhone());
		 			sysUser.setAddr(sysOrder.getShippAddre());
		 			sysUserService.insertUser(sysUser);
	 			}
	 			flag="true";
	 			map.put("orderId",orderId);
		 		map.put("result", flag);
	 		}
	 		else
	 		{
	 			flag="false";
		 		map.put("result", flag);
	 		}
	 		
	    	return map;
		}
	 
	 
}
