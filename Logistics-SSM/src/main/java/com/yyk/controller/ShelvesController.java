package com.yyk.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import com.yyk.dto.ShelvesDTO.ShelvesResDTO;
import com.yyk.dto.UserDTO.SysUserListReqDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysGoods;
import com.yyk.entity.SysGoodsShelves;
import com.yyk.entity.SysGoodsShelvesCriteria;
import com.yyk.entity.SysShelves;
import com.yyk.entity.SysShelvesCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.BaseCodeService;
import com.yyk.service.GoodsService;
import com.yyk.service.GoodsShelvesService;
import com.yyk.service.ShelvesService;
import com.yyk.service.SysUserService;
import com.yyk.util.JsonChangeUtil;
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
@RequestMapping(Url.SHELVES_MANAGE)
public class ShelvesController {
	
	@Autowired
	@Qualifier("shelvesService")
	private ShelvesService shelvesService;
	
	@Autowired
	@Qualifier("goodsService")
	private GoodsService goodsService;
	
	@Autowired
	@Qualifier("goodsShelvesService")
	private GoodsShelvesService goodsShelvesService;
	
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
	 public String get(final ModelMap model){
		List<BaseCode> shelvesTypeList = selectCode("SHELVESTYPE");
		model.put("shelvesTypeList", JsonChangeUtil.list2json(shelvesTypeList));
	   return Views.SHELVES_VIEW;
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
	 @RequestMapping(value = Url.SELECT_LIST_BY_PAGE, produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public @ResponseBody String queryPages(@RequestParam(required=false,value = "aoData") String aoData) {
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
	            
	            if (obj.get("name").equals("shelvesNameSearch")){
	            	sysShelves.setShelvesName( obj.get("value").toString());
	            }
	            
	            if (obj.get("name").equals("shelvesCodeSearch")){
	            	sysShelves.setShelvesCode(obj.get("value").toString());
	            }
	        }
		    SysShelvesCriteria criteria = new SysShelvesCriteria();
		    SysShelvesCriteria.Criteria cri = criteria.createCriteria();
			cri.andStatusEqualTo(1);// 只查询状态为1的
			if (StringUtils.isNotBlank(sysShelves.getShelvesName())) { // 货架姓名查询
				cri.andShelvesNameLike("%" + sysShelves.getShelvesName() + "%");
			}
			if (StringUtils.isNotBlank(sysShelves.getShelvesCode())) { // 货架代码查询
				cri.andShelvesCodeLike("%" + sysShelves.getShelvesCode() + "%");
			}
			if(pageInfo!=null)
			{
				if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
					
				}
			}
			ResDataDTO<List<ShelvesResDTO>> list=shelvesService.selectSysShelvesByPage(criteria, pageInfo);
			PageInfo page=list.getPageInfo();
			JSONObject getObj = new JSONObject();
		    getObj.put("sEcho", sEcho);// DataTable前台必须要的
		    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
		    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
		    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
		    return getObj.toString();
		}
	 
		 
	 
	    @RequestMapping(value = Url.INSERT_OR_UPDATE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> insertOrUpdateShelves(SysShelves sysShelves) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	//修改
	    	SysShelvesCriteria criteria = new SysShelvesCriteria();
  		    SysShelvesCriteria.Criteria cri = criteria.createCriteria();
  			cri.andStatusEqualTo(1);// 只查询状态为1的
	    	if(StringUtils.isNotBlank(sysShelves.getShelvesId())){
	 			cri.andShelvesIdEqualTo(sysShelves.getShelvesId());	    		
	 			int i=shelvesService.updateShelves(criteria, sysShelves);
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
	    		if(StringUtils.isNotBlank(sysShelves.getShelvesCode())){
	    			cri.andShelvesCodeEqualTo(sysShelves.getShelvesCode());
	    		}
	    		List<SysShelves> list=shelvesService.selectInfoShelves(criteria);
	    		if(list.isEmpty() || list.size()<=0){
	    			int i=shelvesService.insertShelves(sysShelves);
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
	 
	 
	    @RequestMapping(value = Url.DELETE_INFO, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteInfoShelves(@RequestParam(required=false,value = "shelvesId") String shelvesId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	String flag=null;
	    	//如果该货下面存在商品 则不允许删除
			SysGoodsShelvesCriteria criteria2=new SysGoodsShelvesCriteria();
			SysGoodsShelvesCriteria.Criteria cri2 = criteria2.createCriteria();
			cri2.andShelvesIdEqualTo(shelvesId);
			List<SysGoodsShelves> list=goodsShelvesService.selectInfoGoodsShelves(criteria2);
			if(list.size()<=0 ||list.isEmpty()){
				SysShelvesCriteria criteria = new SysShelvesCriteria();
		    	SysShelvesCriteria.Criteria cri = criteria.createCriteria();
	 			cri.andStatusEqualTo(1);// 只查询状态为1的
	 			cri.andShelvesIdEqualTo(shelvesId);	
	 			SysShelves sysShelves=new SysShelves();
	 			sysShelves.setStatus(0);
	 			int i=shelvesService.updateShelves(criteria, sysShelves);
	 			if(i==1){
	 				flag="true";
	    			map.put("result", flag);
		    	}
		    	else{
		    		flag="false";
		    		map.put("result", flag);
		    	}
			}
			else
			{
				flag="repeat";
	    		map.put("result", flag);
			}
	    	return map;
		}
	    
	    /**
	     * 批量删除
	     * @param userId
	     * @return
	     */
	 
	    @RequestMapping(value = Url.DELETE_LIST, method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> deleteListShelves(@RequestParam(required=false,value = "idListStr") String shelvesId) {
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	SysShelvesCriteria criteria = new SysShelvesCriteria();
	    	SysShelvesCriteria.Criteria cri = criteria.createCriteria();
 			List<String> shelvesIds=Arrays.asList(shelvesId.split(","));
 			cri.andStatusEqualTo(1);// 只查询状态为1的
 			cri.andShelvesIdIn(shelvesIds);
 			SysShelves sysShelves=new SysShelves();
 			sysShelves.setStatus(0);
 			int i=shelvesService.updateShelves(criteria, sysShelves);
 			if(i>=1){
    			map.put("result", true);
	    	}
	    	else{
	    			map.put("result", false);
	    	}
	    	return map;
		}
	 
	 
	 
	    @RequestMapping(value = Url.SELECT_OUT_GOODS,  produces = "application/json;charset=utf-8",method = RequestMethod.POST)
		public @ResponseBody String selectOutGoods(@RequestParam(required=false,value = "aoData") String aoData) {
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
		            
		            if (obj.get("name").equals("shelvesIdSearch")){
		            	if(StringUtils.isNotBlank(obj.get("value").toString())){
		            		sysShelves.setShelvesId( obj.get("value").toString());
		            	}
		            	else{
		            		sysShelves.setShelvesId(null);
		            	}
		            	
		            }
		            
		        }
				if(pageInfo!=null)
				{
					if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
						
					}
				}
				ResDataDTO<List<SysGoods>> list=goodsService.selectOutGoods(sysShelves.getShelvesId(), pageInfo);
				PageInfo page=list.getPageInfo();
				JSONObject getObj = new JSONObject();
			    getObj.put("sEcho", sEcho);// DataTable前台必须要的
			    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
			    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
			    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
			    return getObj.toString();
	    }
	    
	    
	    
	    
	    
	    @RequestMapping(value = Url.SELECT_IN_GOODS, produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public @ResponseBody String selectInGoods(@RequestParam(required=false,value = "aoData") String aoData) {
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
		            
		            if (obj.get("name").equals("shelvesIdSearch")){
		            	if(StringUtils.isNotBlank(obj.get("value").toString())){
		            		sysShelves.setShelvesId( obj.get("value").toString());
		            	}
		            	else{
		            		sysShelves.setShelvesId(null);
		            	}
		            	
		            }
		            
		        }
				if(pageInfo!=null)
				{
					if(pageInfo.getPageNum()==null || pageInfo.getPageSize()==null || pageInfo.getPageNum()<1 ||pageInfo.getPageSize()<1){
						
					}
				}
				List<String> goodsIds=new ArrayList<String>();
				SysGoodsShelvesCriteria criteria = new SysGoodsShelvesCriteria();
		    	SysGoodsShelvesCriteria.Criteria cri = criteria.createCriteria();
		    	if (StringUtils.isNotBlank(sysShelves.getShelvesId())){
		    		cri.andShelvesIdEqualTo(sysShelves.getShelvesId());
		    	}
				List<SysGoodsShelves> outGoods=goodsShelvesService.selectInfoGoodsShelves(criteria);
				if(!outGoods.isEmpty() && outGoods.size()>0){
					for(SysGoodsShelves goodsId:outGoods){
						goodsIds.add(goodsId.getGoodsId());
					}
				}
				ResDataDTO<List<SysGoods>> list=goodsService.selectInGoods(goodsIds, pageInfo);
				PageInfo page=list.getPageInfo();
				JSONObject getObj = new JSONObject();
			    getObj.put("sEcho", sEcho);// DataTable前台必须要的
			    getObj.put("iTotalRecords",list.getData().size()); //返回总记录数
			    getObj.put("iTotalDisplayRecords",page.getTotal()); //过滤后的记录数
			    getObj.put("aaData", list.getData());//把查到数据装入aaData,要以JSON格式返回
			    return getObj.toString();
	    }
	    
	    
	    
	    
	    
}
