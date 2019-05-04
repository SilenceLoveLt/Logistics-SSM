package com.yyk.dao;

import com.yyk.entity.SysOrder;
import com.yyk.entity.SysOrderCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysOrderMapper {
    int countByExample(SysOrderCriteria example);

    int deleteByExample(SysOrderCriteria example);

    int deleteByPrimaryKey(String orderId);

    int insert(SysOrder record);

    int insertSelective(SysOrder record);

    List<SysOrder> selectByExample(SysOrderCriteria example);

    SysOrder selectByPrimaryKey(String orderId);

    int updateByExampleSelective(@Param("record") SysOrder record, @Param("example") SysOrderCriteria example);

    int updateByExample(@Param("record") SysOrder record, @Param("example") SysOrderCriteria example);

    int updateByPrimaryKeySelective(SysOrder record);

    int updateByPrimaryKey(SysOrder record);
}