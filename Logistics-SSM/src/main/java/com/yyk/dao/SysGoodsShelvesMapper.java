package com.yyk.dao;

import com.yyk.entity.SysGoodsShelves;
import com.yyk.entity.SysGoodsShelvesCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysGoodsShelvesMapper {
    int countByExample(SysGoodsShelvesCriteria example);

    int deleteByExample(SysGoodsShelvesCriteria example);

    int deleteByPrimaryKey(String goodsShelvesId);

    int insert(SysGoodsShelves record);

    int insertSelective(SysGoodsShelves record);

    List<SysGoodsShelves> selectByExample(SysGoodsShelvesCriteria example);

    SysGoodsShelves selectByPrimaryKey(String goodsShelvesId);

    int updateByExampleSelective(@Param("record") SysGoodsShelves record, @Param("example") SysGoodsShelvesCriteria example);

    int updateByExample(@Param("record") SysGoodsShelves record, @Param("example") SysGoodsShelvesCriteria example);

    int updateByPrimaryKeySelective(SysGoodsShelves record);

    int updateByPrimaryKey(SysGoodsShelves record);
}