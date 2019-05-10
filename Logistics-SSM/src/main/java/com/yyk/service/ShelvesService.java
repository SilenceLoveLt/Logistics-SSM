package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.entity.SysShelves;
import com.yyk.entity.SysShelvesCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface ShelvesService {
	ResDataDTO<List<SysShelves>> selectSysShelvesByPage(SysShelvesCriteria criteria,PageInfo pageInfo);
	
	int insertShelves (SysShelves sysShelves);
	
	int updateShelves (SysShelvesCriteria criteria,SysShelves sysShelves);
	
	List<SysShelves> selectInfoShelves(SysShelvesCriteria criteria);
}
