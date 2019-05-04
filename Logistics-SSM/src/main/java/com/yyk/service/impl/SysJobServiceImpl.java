package com.yyk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysEmpMapper;
import com.yyk.dao.SysJobMapper;
import com.yyk.dao.SysUserMapper;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysJobService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysJobService")
public class SysJobServiceImpl implements SysJobService{
	
	@Autowired
	private SysJobMapper SysJobDao;

	@Override
	public ResDataDTO<List<SysJob>> selectSysJobByPage(SysJobCriteria criteria, PageInfo pageInfo) {
		List<SysJob> sysJobList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			sysJobList=SysJobDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(SysJobDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysJobList=SysJobDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysJob>> listRes=new ResDataDTO<List<SysJob>>();
		listRes.setData(sysJobList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertJob(SysJob sysJob) {
		sysJob.setStatus(1);
		sysJob.setJobId(UUIDGenerator.create32Key());
		return SysJobDao.insertSelective(sysJob);
	}

	@Override
	public int updateJob(SysJobCriteria criteria,SysJob sysJob) {
		return SysJobDao.updateByExampleSelective(sysJob,criteria);
	}

	@Override
	public List<SysJob> selectInfoJob(SysJobCriteria criteria) {
		return SysJobDao.selectByExample(criteria);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
