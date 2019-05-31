package com.yyk.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysEmpMapper;
import com.yyk.dao.SysInvoiceMapper;
import com.yyk.dao.SysOrderMapper;
import com.yyk.dao.SysUserMapper;
import com.yyk.dto.OrderDTO.CheckOrderResDTO;
import com.yyk.dto.OrderDTO.OrderResDTO;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.entity.SysOrder;
import com.yyk.entity.SysOrderCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.InvoiceService;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysOrderService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("invoiceService")
public class InvoiceServiceImpl implements InvoiceService{
	
	@Autowired
	private SysOrderMapper sysOrderDao;
	
	@Autowired
	private SysInvoiceMapper sysInvoiceDao;


	@Override
	public int insertInvoice(SysInvoice sysInvoice) {
		/**
		 * 
		 * InvoiceStatus:
		 * 1 _已发货
		 * 2 _运输中
		 * 3 _派送中
		 * 4 _已签收
		 */
		sysInvoice.setStatus(1);
		sysInvoice.setInvoiceStatus(1);  
		sysInvoice.setCreateTime(new Date());
		sysInvoice.setUpdateTime(new Date());
		sysInvoice.setInvoiceId(UUIDGenerator.create32Key());
		return sysInvoiceDao.insertSelective(sysInvoice);
	}

	@Override
	public int updateInvoice(SysInvoiceCriteria criteria,SysInvoice sysInvoice) {
		return sysInvoiceDao.updateByExampleSelective(sysInvoice,criteria);
	}

	@Override
	public List<SysInvoice> selectInfoInvoice(SysInvoiceCriteria criteria) {
		return sysInvoiceDao.selectByExample(criteria);
	}

	@Override
	public ResDataDTO<List<OrderResDTO>> selectInvoiceByOrderId(SysInvoiceCriteria criteria, PageInfo pageInfo) {
		List<OrderResDTO> sysInvoiceList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			sysInvoiceList=sysInvoiceDao.selectByExampleNew(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(sysInvoiceDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysInvoiceList=sysInvoiceDao.selectByExampleNew(criteria);
		}
		ResDataDTO<List<OrderResDTO>> listRes=new ResDataDTO<List<OrderResDTO>>();
		listRes.setData(sysInvoiceList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
