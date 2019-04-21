package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月21日 上午1:01:47
* 类说明
*/
public interface BaseCodeService {
	ResDataDTO<List<BaseCode>> selectCodeByPage(BaseCodeCriteria criteria,PageInfo pageInfo);
	
	int insertBaseCode (BaseCode baseCode);
	
	int updateBaseCode (BaseCodeCriteria criteria,BaseCode baseCode);
	
	List<BaseCode> selectInfoCode(BaseCodeCriteria criteria);
}
