package com.yyk.service;

import java.util.List;

import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface SysInvoiceService {
	List<SysInvoice> selectSysInvoice(SysInvoiceCriteria criteria);
	 
}
