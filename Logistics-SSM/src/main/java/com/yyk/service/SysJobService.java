package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface SysJobService {
	ResDataDTO<List<SysJob>> selectSysJobByPage(SysJobCriteria criteria,PageInfo pageInfo);
	
	int insertJob (SysJob sysJob);
	
	int updateJob (SysJobCriteria criteria,SysJob sysJob);
	
	List<SysJob> selectInfoJob(SysJobCriteria criteria);
}
