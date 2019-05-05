package com.yyk.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysUserMapper;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService{
	
	@Autowired
	private SysUserMapper SysUserDao;

	@Override
	public ResDataDTO<List<SysUser>> selectSysUserByPage(SysUserCriteria criteria, PageInfo pageInfo) {
		List<SysUser> sysUserList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			sysUserList=SysUserDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(SysUserDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysUserList=SysUserDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysUser>> listRes=new ResDataDTO<List<SysUser>>();
		listRes.setData(sysUserList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertUser(SysUser sysUser) {
		sysUser.setStatus(1);
    	sysUser.setUserId(UUIDGenerator.create32Key());
    	if(sysUser.getCreateTime()==null){
    		sysUser.setCreateTime(new Date());
    	}
    	if(sysUser.getUpdateTime()==null){
    		sysUser.setUpdateTime(new Date());
    	}
		return SysUserDao.insertSelective(sysUser);
	}

	@Override
	public int updateUser(SysUserCriteria criteria,SysUser sysUser) {
		return SysUserDao.updateByExampleSelective(sysUser,criteria);
	}

	@Override
	public List<SysUser> selectInfoUser(SysUserCriteria criteria) {
		return SysUserDao.selectByExample(criteria);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
