package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.entity.BaseCodeType;
import com.yyk.entity.BaseCodeTypeCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月21日 上午1:01:47
* 类说明
*/
public interface BaseCodeTypeService {

    ResDataDTO<List<BaseCodeType>> selectCodeTypeByPage(BaseCodeTypeCriteria criteria,PageInfo pageInfo);
	
	int insertBaseCodeType (BaseCodeType baseCodeType);
	
	int updateBaseCodeType (BaseCodeTypeCriteria criteria,BaseCodeType baseCodeType);
	
	List<BaseCodeType> selectInfoCodeType(BaseCodeTypeCriteria criteria);
}
