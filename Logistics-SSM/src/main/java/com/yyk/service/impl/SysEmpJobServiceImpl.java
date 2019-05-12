package com.yyk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysEmpJobMapper;
import com.yyk.dao.SysEmpMapper;
import com.yyk.dao.SysUserMapper;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysEmpJob;
import com.yyk.entity.SysEmpJobCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysEmpJobService;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysEmpJobService")
public class SysEmpJobServiceImpl implements SysEmpJobService{
	
	@Autowired
	private SysEmpJobMapper SysEmpJobDao;

	@Override
	public List<SysEmpJob> selectInfoEmpJob(SysEmpJobCriteria criteria) {
		return SysEmpJobDao.selectByExample(criteria);
	}

	@Override
	public ResDataDTO<List<SysEmpJob>> selectSysEmpJobByPage(SysEmpJobCriteria criteria, PageInfo pageInfo) {
		List<SysEmpJob> sysEmpJobList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			sysEmpJobList=SysEmpJobDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(SysEmpJobDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysEmpJobList=SysEmpJobDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysEmpJob>> listRes=new ResDataDTO<List<SysEmpJob>>();
		listRes.setData(sysEmpJobList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int updateEmpJob(SysEmpJobCriteria criteria, SysEmpJob sysEmpJob) {
		return SysEmpJobDao.updateByExampleSelective(sysEmpJob, criteria);
	}

	@Override
	public int insertEmpJob(List<SysEmpJob> list) {
		return SysEmpJobDao.insertByBatch(list);
	}


	

	
	
	
	
	
	
	
}
