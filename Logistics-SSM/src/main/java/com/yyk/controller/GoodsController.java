package com.yyk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.yyk.dto.GoodsDTO.GoodsResDTO;
import com.yyk.dto.OrderDTO.OrderResDTO;
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
import com.yyk.service.GoodsService;
import com.yyk.service.SysInvoiceService;
import com.yyk.service.SysOrderService;
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
	 public String checkOrder(){
		 System.out.println("订单");
	   return Views.GOODS_VIEW;
	 }

	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE, method = RequestMethod.POST)
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
	        }
		    SysGoodsCriteria criteria = new SysGoodsCriteria();
		    SysGoodsCriteria.Criteria cri = criteria.createCriteria();
		    cri.andStatusNotEqualTo(0);// 只查询状态为1的。
			if (StringUtils.isNotBlank(sysGoods.getOrderId())) { 
				cri.andOrderIdEqualTo(sysGoods.getOrderId());
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
	
	 
}
