package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysEmpJob;
import com.yyk.entity.SysEmpJobCriteria;
import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface SysEmpJobService {
	
	ResDataDTO<List<SysEmpJob>> selectSysEmpJobByPage(SysEmpJobCriteria criteria,PageInfo pageInfo);
	
	int updateEmpJob (SysEmpJobCriteria criteria,SysEmpJob sysEmpJob);
	 
	int insertEmpJob  (List<SysEmpJob> list);
	
	List<SysEmpJob> selectInfoEmpJob(SysEmpJobCriteria criteria);
}
