package com.yyk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyk.dao.SysInvoiceMapper;
import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.service.SysInvoiceService;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysInvoiceService")
public class SysInvoiceServiceImpl implements SysInvoiceService{
	@Autowired
	private  SysInvoiceMapper sysInvoiceDao;

	@Override
	public List<SysInvoice> selectSysInvoice(SysInvoiceCriteria criteria) {
		return sysInvoiceDao.selectByExample(criteria);
	}
	

	
	

	
}
