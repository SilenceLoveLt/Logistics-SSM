package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dto.BaseCodeDTO.BaseCodeDTO;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface SysLineService {
	 List<BaseCodeDTO> selectLeftTrees();
	 
	 int updateLine (SysLineCriteria criteria,SysLine sysLine);
	 
	 List<SysLine> selectLine (SysLineCriteria criteria);
	 
	 int insertLine (SysLine sysLine);
	 
	 ResDataDTO<List<SysLine>>  selectApplyTypeListPage(SysLineCriteria criteria,PageInfo pageInfo);
	 
	 ResDataDTO<List<SysLine>>  selectLineTypeListPage(SysLineCriteria criteria,PageInfo pageInfo);
	 
}
