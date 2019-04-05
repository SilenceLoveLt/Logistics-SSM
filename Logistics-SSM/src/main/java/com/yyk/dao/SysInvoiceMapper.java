package com.yyk.dao;

import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysInvoiceMapper {
    int countByExample(SysInvoiceCriteria example);

    int deleteByExample(SysInvoiceCriteria example);

    int deleteByPrimaryKey(String invoiceId);

    int insert(SysInvoice record);

    int insertSelective(SysInvoice record);

    List<SysInvoice> selectByExample(SysInvoiceCriteria example);

    SysInvoice selectByPrimaryKey(String invoiceId);

    int updateByExampleSelective(@Param("record") SysInvoice record, @Param("example") SysInvoiceCriteria example);

    int updateByExample(@Param("record") SysInvoice record, @Param("example") SysInvoiceCriteria example);

    int updateByPrimaryKeySelective(SysInvoice record);

    int updateByPrimaryKey(SysInvoice record);
}