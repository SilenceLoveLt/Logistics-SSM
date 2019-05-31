package com.yyk.dao;

import com.yyk.dto.GoodsDTO.GoodsResDTO;
import com.yyk.entity.SysGoods;
import com.yyk.entity.SysGoodsCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysGoodsMapper {
    int countByExample(SysGoodsCriteria example);

    int deleteByExample(SysGoodsCriteria example);

    int deleteByPrimaryKey(String goodsId);

    int insert(SysGoods record);

    int insertSelective(SysGoods record);

    List<SysGoods> selectByExample(SysGoodsCriteria example);

    SysGoods selectByPrimaryKey(String goodsId);

    int updateByExampleSelective(@Param("record") SysGoods record, @Param("example") SysGoodsCriteria example);

    int updateByExample(@Param("record") SysGoods record, @Param("example") SysGoodsCriteria example);

    int updateByPrimaryKeySelective(SysGoods record);

    int updateByPrimaryKey(SysGoods record);
    
    List<SysGoods> selectInGoods(List<String> goodsIdList);
    
    long countInGoods(List<String> goodsIdList);
    
    List<SysGoods> selectOutGoods(@Param("shelvesId")String shelvesId);
    
    long countOutGoods(@Param("shelvesId")String shelvesId);
    
    List<GoodsResDTO> selectByExampleNew(SysGoodsCriteria example);
    
    String selectGoodsCodeByOrderId(String type);
}