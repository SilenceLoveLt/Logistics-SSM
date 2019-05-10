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
import com.yyk.entity.SysEmpJob;
import com.yyk.entity.SysEmpJobCriteria;
import com.yyk.entity.SysGoods;
import com.yyk.entity.SysGoodsCriteria;
import com.yyk.entity.SysGoodsShelves;
import com.yyk.entity.SysGoodsShelvesCriteria;
import com.yyk.entity.SysShelves;
import com.yyk.entity.SysShelvesCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.GoodsService;
import com.yyk.service.GoodsShelvesService;
import com.yyk.service.ShelvesService;
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
@RequestMapping(Url.GOODS_SHELVES_MANAGE)
public class GoodsShelvesController {
	
	@Autowired
	@Qualifier("shelvesService")
	private ShelvesService shelvesService;
	
	@Autowired
	@Qualifier("goodsService")
	private GoodsService goodsService;
	
	@Autowired
	@Qualifier("goodsShelvesService")
	private GoodsShelvesService goodsShelvesService;
	
	  @RequestMapping(value = Url.IN_GOODS_SHELVES, method = RequestMethod.POST)
			public @ResponseBody Map<String, Object> inGoodsShelves(@RequestParam(required=false,value = "shelvesId") String shelvesId,
					@RequestParam(required=false,value = "idListStr") String idListStr) {
		    	Map<String, Object> map = new HashMap<String, Object>();
		    	List<SysGoodsShelves> list=new ArrayList<SysGoodsShelves>();
		    	List<String> goodsIds=Arrays.asList(idListStr.split(","));
		    	for(String goodsId:goodsIds) {
		    		SysGoodsShelves sysGoodsShelves=new SysGoodsShelves();
		    		sysGoodsShelves.setGoodsShelvesId(UUIDGenerator.create32Key());
		    		sysGoodsShelves.setCreateTime(new Date());
		    		sysGoodsShelves.setUpdateTime(new Date());
		    		sysGoodsShelves.setGoodsId(goodsId);
		    		sysGoodsShelves.setShelvesId(shelvesId);
		    		sysGoodsShelves.setStatus(1);
		    		sysGoodsShelves.setInTime(new Date());
		    		SysGoodsCriteria criteria = new SysGoodsCriteria();
		 		    SysGoodsCriteria.Criteria cri = criteria.createCriteria();
		 		    cri.andStatusNotEqualTo(0);// 只查询状态为1的。
		 		    cri.andGoodsIdEqualTo(goodsId);
		 		    List<SysGoods> goodslist=goodsService.selectInfoGoods(criteria);
		    		sysGoodsShelves.setGoodsCode(goodslist.get(0).getGoodsCode());
		    		list.add(sysGoodsShelves);
		    	}
		    	int i=goodsShelvesService.insertByBatch(list);
		    	if(i<=0){
		    		map.put("result", false);
		    		return map;
		    	}
		 		map.put("result", true);
		    	return map;
			}
	 
	    @RequestMapping(value = Url.OUT_GOODS_SHELVES, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> outGoodsShelves(@RequestParam(required=false,value = "shelvesId") String shelvesId,
				@RequestParam(required=false,value = "idListStr") String idListStr) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	SysGoodsShelvesCriteria criteria = new SysGoodsShelvesCriteria();
	    	SysGoodsShelvesCriteria.Criteria cri = criteria.createCriteria();
	    	List<String> goodsIds=Arrays.asList(idListStr.split(","));
	    	cri.andShelvesIdEqualTo(shelvesId);
	    	cri.andGoodsIdIn(goodsIds);
	    	SysGoodsShelves sysGoodsShelves=new SysGoodsShelves();
	    	sysGoodsShelves.setStatus(0);
	    	sysGoodsShelves.setUpdateTime(new Date());
	    	sysGoodsShelves.setOutTime(new Date());
	    	int i=goodsShelvesService.updateGoodsShelves(criteria, sysGoodsShelves);
	    	if(i!=goodsIds.size()){
	    		map.put("result", false);
	    		return map;
	    	}
	 		map.put("result", true);
	    	return map;
		}
	  
	  
	    @RequestMapping(value = Url.SELECT_IN_SHELVES_MANAGE, method = RequestMethod.POST)
		 public String selectInGoods(){
		   return Views.IN_SHELVES_VIEW;
		 }
	    
	    @RequestMapping(value = Url.SELECT_IN_GOODS_LIST, method = RequestMethod.POST)
		public @ResponseBody String selectInGoodsPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysShelves sysShelves=new SysShelves();
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
	            
	            if (obj.get("name").equals("shelvesCodeSearch")){
	            	sysShelves.setShelvesCode( obj.get("value").toString());
	            }
	        }
		    SysShelvesCriteria criteria1 = new SysShelvesCriteria();
		    SysShelvesCriteria.Criteria cri1 = criteria1.createCriteria();
			cri1.andStatusEqualTo(1);// 只查询状态为1的
			if (StringUtils.isNotBlank(sysShelves.getShelvesCode())) {
				cri1.andShelvesCodeEqualTo(sysShelves.getShelvesCode());
			}else{
				cri1.andShelvesCodeEqualTo("");
			}
			String shelvesId =null;
			List<SysShelves> lists=shelvesService.selectInfoShelves(criteria1);
			if(!lists.isEmpty() && lists.size()>0){
				shelvesId=lists.get(0).getShelvesId();
			}
		    SysGoodsShelvesCriteria criteria = new SysGoodsShelvesCriteria();
		    SysGoodsShelvesCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
			cri.andRemarkEqualTo("1");// 只查询记录状态状态为1的
			cri.andOutTimeIsNull();
			if (StringUtils.isNotBlank(shelvesId)) { // 货架编号查询
				cri.andShelvesIdEqualTo(shelvesId);
			}
			else{
				cri.andShelvesIdEqualTo("");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<SysGoodsShelves>> list=goodsShelvesService.selectGoodsShelvesByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	    
	    
	    @RequestMapping(value = Url.DELETE_IN_GOODS_LIST, method = RequestMethod.POST)
 		public @ResponseBody Map<String, Object> deleteInGoodsShelves(@RequestParam(required=false,value = "goodsShelvesId") String goodsShelvesId) {
 	    	Map<String, Object> map = new HashMap<String, Object>();
 			SysGoodsShelvesCriteria criteria=new SysGoodsShelvesCriteria();
 			SysGoodsShelvesCriteria.Criteria cri = criteria.createCriteria();
 			cri.andGoodsShelvesIdEqualTo(goodsShelvesId);
 			/**
 			 * remark :1可查看
 			 * remark :0删除该条记录
 			 */
 			SysGoodsShelves sysGoodsShelves=new SysGoodsShelves();
 			sysGoodsShelves.setRemark("0");
 			int i=goodsShelvesService.updateGoodsShelves(criteria, sysGoodsShelves);
 	 		if(i==1){
 	 			map.put("result", true);
 		    }
 		    else{
 		    	map.put("result", false);
 		    }
 	    	return map;
 		}
	    
	    
	    
	    
	    @RequestMapping(value = Url.SELECT_OUT_SHELVES_MANAGE, method = RequestMethod.POST)
		 public String selectOutGoods(){
		   return Views.OUT_SHELVES_VIEW;
		 }
	    
	    
	    
	    @RequestMapping(value = Url.SELECT_OUT_GOODS_LIST, method = RequestMethod.POST)
		public @ResponseBody String selectOutGoodsPages(@RequestParam(required=false,value = "aoData") String aoData) {
		 JSONArray jsonarray=(JSONArray) JSONArray.parseArray(aoData);//json格式化用的是fastjson
		 SysShelves sysShelves=new SysShelves();
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
	            
	            if (obj.get("name").equals("shelvesCodeSearch")){
	            	sysShelves.setShelvesCode( obj.get("value").toString());
	            }
	        }
		    SysShelvesCriteria criteria1 = new SysShelvesCriteria();
		    SysShelvesCriteria.Criteria cri1 = criteria1.createCriteria();
			cri1.andStatusEqualTo(1);// 只查询状态为1的
			if (StringUtils.isNotBlank(sysShelves.getShelvesCode())) {
				cri1.andShelvesCodeEqualTo(sysShelves.getShelvesCode());
			}else{
				cri1.andShelvesCodeEqualTo("");
			}
			String shelvesId =null;
			List<SysShelves> lists=shelvesService.selectInfoShelves(criteria1);
			if(!lists.isEmpty() && lists.size()>0){
				shelvesId=lists.get(0).getShelvesId();
			}
		    SysGoodsShelvesCriteria criteria = new SysGoodsShelvesCriteria();
		    SysGoodsShelvesCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
			cri.andRemarkEqualTo("1");// 只查询记录状态状态为1的
			cri.andOutTimeIsNotNull();
			if (StringUtils.isNotBlank(shelvesId)) { // 货架编号查询
				cri.andShelvesIdEqualTo(shelvesId);
			}
			else{
				cri.andShelvesIdEqualTo("");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<SysGoodsShelves>> list=goodsShelvesService.selectGoodsShelvesByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	  
	  
	  
	    @RequestMapping(value = Url.DELETE_OUT_GOODS_LIST, method = RequestMethod.POST)
 		public @ResponseBody Map<String, Object> deleteOutGoodsShelves(@RequestParam(required=false,value = "goodsShelvesId") String goodsShelvesId) {
 	    	Map<String, Object> map = new HashMap<String, Object>();
 			SysGoodsShelvesCriteria criteria=new SysGoodsShelvesCriteria();
 			SysGoodsShelvesCriteria.Criteria cri = criteria.createCriteria();
 			cri.andGoodsShelvesIdEqualTo(goodsShelvesId);
 			/**
 			 * remark :1可查看
 			 * remark :0删除该条记录
 			 */
 			SysGoodsShelves sysGoodsShelves=new SysGoodsShelves();
 			sysGoodsShelves.setRemark("0");
 			int i=goodsShelvesService.updateGoodsShelves(criteria, sysGoodsShelves);
 	 		if(i==1){
 	 			map.put("result", true);
 		    }
 		    else{
 		    	map.put("result", false);
 		    }
 	    	return map;
 		}
	  
	  
	  
	  
	  
	  
	  
		 
	 
	  
}
