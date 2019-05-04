package com.yyk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysEmpMapper;
import com.yyk.dao.SysOrderMapper;
import com.yyk.dao.SysUserMapper;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysOrder;
import com.yyk.entity.SysOrderCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysOrderService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysOrderService")
public class SysOrderServiceImpl implements SysOrderService{
	
	@Autowired
	private SysOrderMapper SysOrderDao;

	@Override
	public ResDataDTO<List<SysOrder>> selectSysOrderByPage(SysOrderCriteria criteria, PageInfo pageInfo) {
		List<SysOrder> sysOrderList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			sysOrderList=SysOrderDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(SysOrderDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysOrderList=SysOrderDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysOrder>> listRes=new ResDataDTO<List<SysOrder>>();
		listRes.setData(sysOrderList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertOrder(SysOrder sysOrder) {
		sysOrder.setStatus(1);
		sysOrder.setOrderId(UUIDGenerator.create32Key());
		return SysOrderDao.insertSelective(sysOrder);
	}

	@Override
	public int updateOrder(SysOrderCriteria criteria,SysOrder sysOrder) {
		return SysOrderDao.updateByExampleSelective(sysOrder,criteria);
	}

	@Override
	public List<SysOrder> selectInfoOrder(SysOrderCriteria criteria) {
		return SysOrderDao.selectByExample(criteria);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
