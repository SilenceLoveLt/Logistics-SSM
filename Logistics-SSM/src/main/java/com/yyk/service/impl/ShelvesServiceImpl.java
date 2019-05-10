package com.yyk.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.SysShelvesMapper;
import com.yyk.dao.SysUserMapper;
import com.yyk.entity.SysShelves;
import com.yyk.entity.SysShelvesCriteria;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;
import com.yyk.service.ShelvesService;
import com.yyk.service.SysUserService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("shelvesService")
public class ShelvesServiceImpl implements ShelvesService{
	
	@Autowired
	private SysShelvesMapper sysShelvesDao;

	@Override
	public ResDataDTO<List<SysShelves>> selectSysShelvesByPage(SysShelvesCriteria criteria, PageInfo pageInfo) {
		List<SysShelves> sysShelvesList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			sysShelvesList=sysShelvesDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(sysShelvesDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysShelvesList=sysShelvesDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysShelves>> listRes=new ResDataDTO<List<SysShelves>>();
		listRes.setData(sysShelvesList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertShelves(SysShelves sysShelves) {
		sysShelves.setStatus(1);
		sysShelves.setShelvesId(UUIDGenerator.create32Key());
    	if(sysShelves.getCreateTime()==null){
    		sysShelves.setCreateTime(new Date());
    	}
    	if(sysShelves.getUpdateTime()==null){
    		sysShelves.setUpdateTime(new Date());
    	}
		return sysShelvesDao.insertSelective(sysShelves);
	}

	@Override
	public int updateShelves(SysShelvesCriteria criteria,SysShelves sysShelves) {
		if(sysShelves.getUpdateTime()==null){
    		sysShelves.setUpdateTime(new Date());
    	}
		return sysShelvesDao.updateByExampleSelective(sysShelves,criteria);
	}

	@Override
	public List<SysShelves> selectInfoShelves(SysShelvesCriteria criteria) {
		return sysShelvesDao.selectByExample(criteria);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
