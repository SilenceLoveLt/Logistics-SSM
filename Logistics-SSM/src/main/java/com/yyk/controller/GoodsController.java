package com.yyk.controller;

import java.math.BigDecimal;
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
import com.yyk.dto.GoodsDTO.GoodsResDTO;
import com.yyk.dto.OrderDTO.OrderResDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysGoods;
import com.yyk.entity.SysGoodsCriteria;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;
import com.yyk.entity.SysOrder;
import com.yyk.entity.SysOrderCriteria;
import com.yyk.entity.SysUser;
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
@RequestMapping(Url.GOODS_MANAGE)
public class GoodsController {
	
	
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
	 @RequestMapping("/")
	 public String checkOrder(final ModelMap model){
	   List<BaseCode> goodsStatusList = selectCode("GOODSSTATUS");
	   model.put("goodsStatusList", JsonChangeUtil.list2json(goodsStatusList));
	   return Views.GOODS_VIEW;
	 }

	 
	 

	 public List<BaseCode> selectCode(String codeType){
			BaseCodeCriteria criteria = new BaseCodeCriteria();
			BaseCodeCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1); 
			cri.andCodeTypeEqualTo(codeType);
			List<BaseCode> topicTypeList = this.baseCodeService.selectInfoCode(criteria);
		    return topicTypeList;
	}

	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE,  produces = "application/json;charset=utf-8",method = RequestMethod.POST)
		public @ResponseBody String selectGoodsByOrderId(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysGoods sysGoods=new SysGoods();
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
	            	sysGoods.setOrderId(obj.get("value").toString());
	            }
	            
	            if (obj.get("name").equals("goodsStatusSearch")){
	            	if( !"".equals(obj.get("value").toString())){
	            		sysGoods.setStatus(Integer.parseInt(obj.get("value").toString()));
	            	}
	            }
	        }
		    SysGoodsCriteria criteria = new SysGoodsCriteria();
		    SysGoodsCriteria.Criteria cri = criteria.createCriteria();
		    cri.andStatusNotEqualTo(0);// 只查询状态为1的。
			if (StringUtils.isNotBlank(sysGoods.getOrderId())) { 
				cri.andOrderIdEqualTo(sysGoods.getOrderId());
			}
			if ((sysGoods.getStatus()!=null)) { 
				cri.andStatusEqualTo(sysGoods.getStatus());
			}
			/*else
			{
				cri.andOrderIdEqualTo("");
			}*/
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<GoodsResDTO>> list=goodsService.selectSysGoodsByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
	 
	    @RequestMapping(value = Url.INSERT_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertGoods(@RequestParam(required=false,value = "str") String str) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	String strs[] = str.split(";");
			String orderId=null;
			for (int i = 0; i < strs.length; i++) {
				SysGoodsCriteria criteria = new SysGoodsCriteria();
			    SysGoodsCriteria.Criteria cri = criteria.createCriteria();
				SysGoods sysGoods=new SysGoods();
				String s[] = strs[i].split(",");
				List<SysGoods> list=new ArrayList<SysGoods>();
				orderId=s[0].substring(s[0].indexOf(":") + 1);
				if(StringUtils.isNotBlank(s[1].substring(s[1].indexOf(":") + 1)))
				{
					cri.andStatusNotEqualTo(0);// 只查询状态为1的。
					cri.andGoodsCodeEqualTo(s[1].substring(s[1].indexOf(":") + 1));
					list=goodsService.selectInfoGoods(criteria);
				}
				if(list.size()>0)
				{
					//删除该订单所有货物
					cri.andOrderIdEqualTo(orderId);
					sysGoods=new SysGoods();
					sysGoods.setStatus(0);
					goodsService.updateExample(criteria, sysGoods);
					flag = "repeat";
					map.put("result", flag);
					return map;
				}
				sysGoods.setOrderId(s[0].substring(s[0].indexOf(":") + 1));
				if(StringUtils.isNotBlank(s[1].substring(s[1].indexOf(":") + 1)))
				{
					sysGoods.setGoodsCode(s[1].substring(s[1].indexOf(":") + 1));
				}
				if(StringUtils.isNotBlank(s[2].substring(s[2].indexOf(":") + 1)))
				{
					sysGoods.setGoodsName(s[2].substring(s[2].indexOf(":") + 1));
				}
				if(StringUtils.isNotBlank(s[3].substring(s[3].indexOf(":") + 1)))
				{
					sysGoods.setGoodsType(s[3].substring(s[3].indexOf(":") + 1));
				}
				if(StringUtils.isNotBlank(s[4].substring(s[4].indexOf(":") + 1)))
				{
					sysGoods.setGoodsWeight(new Integer(s[4].substring(s[4].indexOf(":") + 1)));
				}
				if(StringUtils.isNotBlank(s[4].substring(s[4].indexOf(":") + 1)))
				{
					sysGoods.setGoodsVolume(new Integer(s[4].substring(s[4].indexOf(":") + 1)));
				}
				if(StringUtils.isNotBlank(s[5].substring(s[5].indexOf(":") + 1)))
				{
					sysGoods.setGoodsNum(new Integer(s[5].substring(s[5].indexOf(":") + 1)));
				}
				sysGoods.setRemark(s[6].substring(s[6].indexOf(":") + 1));
				int count=goodsService.insertGoods(sysGoods);
				if (count>0){
					flag = "true";
					map.put("result", flag);
					return map;
				}
				else{
					flag = "false";
					map.put("result", flag);
					return map;
				}
			}
	 		
	    	return map;
		}
	
	    
	    @RequestMapping(value = Url.SELECT_GOODS_BY_ORDER, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> selectGoodsByOrder(@RequestParam(required=false,value = "orderId") String orderId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String goodsCode=goodsService.selectGoodsCodeByOrderId(orderId);
	    	map.put("goodsCode", goodsCode);
	    	map.put("result", true);
	    	return map;
		}
	 
}
