package com.yyk.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysEmpMapper;
import com.yyk.dao.SysGoodsMapper;
import com.yyk.dao.SysInvoiceMapper;
import com.yyk.dao.SysOrderMapper;
import com.yyk.dao.SysUserMapper;
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
import com.yyk.service.GoodsService;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysOrderService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private SysGoodsMapper SysGoodsDao;
	
	@Autowired
	private SysInvoiceMapper SysInvoiceDao;

	@Override
	public ResDataDTO<List<SysGoods>> selectSysGoodsByPage(SysGoodsCriteria criteria, PageInfo pageInfo) {
		List<SysGoods> sysGoodsList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			sysGoodsList=SysGoodsDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(SysGoodsDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysGoodsList=SysGoodsDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysGoods>> listRes=new ResDataDTO<List<SysGoods>>();
		listRes.setData(sysGoodsList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}


	@Override
	public List<SysGoods> selectInfoGoods(SysGoodsCriteria criteria) {
		return SysGoodsDao.selectByExample(criteria);
	}


	@Override
	public int insertGoods(SysGoods sysGoods) {
		sysGoods.setCreateTime(new Date());
		sysGoods.setUpdateTime(new Date());
		sysGoods.setGoodsId(UUIDGenerator.create32Key());
		return SysGoodsDao.insertSelective(sysGoods);
		
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
}
