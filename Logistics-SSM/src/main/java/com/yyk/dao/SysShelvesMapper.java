package com.yyk.dao;

import com.yyk.dto.ShelvesDTO.ShelvesResDTO;
import com.yyk.entity.SysShelves;
import com.yyk.entity.SysShelvesCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysShelvesMapper {
    int countByExample(SysShelvesCriteria example);

    int deleteByExample(SysShelvesCriteria example);

    int deleteByPrimaryKey(String shelvesId);

    int insert(SysShelves record);

    int insertSelective(SysShelves record);

    List<SysShelves> selectByExample(SysShelvesCriteria example);

    SysShelves selectByPrimaryKey(String shelvesId);

    int updateByExampleSelective(@Param("record") SysShelves record, @Param("example") SysShelvesCriteria example);

    int updateByExample(@Param("record") SysShelves record, @Param("example") SysShelvesCriteria example);

    int updateByPrimaryKeySelective(SysShelves record);

    int updateByPrimaryKey(SysShelves record);
    
    List<ShelvesResDTO> selectByExampleNew(SysShelvesCriteria example);
}