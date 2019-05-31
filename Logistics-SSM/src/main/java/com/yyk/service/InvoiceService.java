package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
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

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface InvoiceService {
	
	ResDataDTO<List<OrderResDTO>> selectInvoiceByOrderId(SysInvoiceCriteria criteria,PageInfo pageInfo);
	
	int insertInvoice(SysInvoice sysInvoice);
	
	int updateInvoice (SysInvoiceCriteria criteria,SysInvoice sysInvoice);
	
	List<SysInvoice> selectInfoInvoice(SysInvoiceCriteria criteria);
}
