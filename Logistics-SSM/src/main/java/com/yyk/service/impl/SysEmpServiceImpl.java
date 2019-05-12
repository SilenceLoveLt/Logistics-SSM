package com.yyk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysEmpMapper;
import com.yyk.dao.SysUserMapper;
import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysEmpService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysEmpService")
public class SysEmpServiceImpl implements SysEmpService{
	
	@Autowired
	private SysEmpMapper SysEmpDao;

	@Override
	public ResDataDTO<List<SysEmp>> selectSysEmpByPage(SysEmpCriteria criteria, PageInfo pageInfo) {
		List<SysEmp> sysEmpList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			sysEmpList=SysEmpDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(SysEmpDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysEmpList=SysEmpDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysEmp>> listRes=new ResDataDTO<List<SysEmp>>();
		listRes.setData(sysEmpList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertEmp(SysEmp sysEmp) {
		sysEmp.setStatus(1);
		sysEmp.setEmpId(UUIDGenerator.create32Key());
		return SysEmpDao.insertSelective(sysEmp);
	}

	@Override
	public int updateEmp(SysEmpCriteria criteria,SysEmp sysEmp) {
		return SysEmpDao.updateByExampleSelective(sysEmp,criteria);
	}

	@Override
	public List<SysEmp> selectInfoEmp(SysEmpCriteria criteria) {
		return SysEmpDao.selectByExample(criteria);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
