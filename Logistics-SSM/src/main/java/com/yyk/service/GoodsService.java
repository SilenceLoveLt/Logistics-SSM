package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dto.GoodsDTO.GoodsResDTO;
import com.yyk.dto.OrderDTO.OrderResDTO;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysGoods;
import com.yyk.entity.SysGoodsCriteria;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysOrder;
import com.yyk.entity.SysOrderCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface GoodsService {
	ResDataDTO<List<GoodsResDTO>> selectSysGoodsByPage(SysGoodsCriteria criteria,PageInfo pageInfo);
	
	List<SysGoods> selectInfoGoods(SysGoodsCriteria criteria);
	
	int insertGoods(SysGoods sysGoods);
	
	ResDataDTO<List<SysGoods>> selectInGoods(List<String> goodsIdList,PageInfo pageInfo);
	
	ResDataDTO<List<SysGoods>> selectOutGoods(String shelvesId,PageInfo pageInfo);

	List<SysGoods> selectGoods(String shelvesId);
	
	int updateExample(SysGoodsCriteria criteria,SysGoods sysGoods);
	
	 String selectGoodsCodeByOrderId(String type);

}