package com.yyk.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.BaseCodeTypeMapper;
import com.yyk.entity.BaseCodeType;
import com.yyk.entity.BaseCodeTypeCriteria;
import com.yyk.entity.SysUser;
import com.yyk.service.BaseCodeService;
import com.yyk.service.BaseCodeTypeService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月21日 上午1:02:18
* 类说明
*/
@Service("baseCodeTypeService")
public class BaseCodeTypeServiceImpl implements BaseCodeTypeService{

	@Autowired
	private BaseCodeTypeMapper baseCodeTypeDao;

	@Override
	public ResDataDTO<List<BaseCodeType>> selectCodeTypeByPage(BaseCodeTypeCriteria criteria, PageInfo pageInfo) {
		List<BaseCodeType> baseCodeTypeList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			baseCodeTypeList=baseCodeTypeDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(baseCodeTypeDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			baseCodeTypeList=baseCodeTypeDao.selectByExample(criteria);
		}
		ResDataDTO<List<BaseCodeType>> listRes=new ResDataDTO<List<BaseCodeType>>();
		listRes.setData(baseCodeTypeList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertBaseCodeType(BaseCodeType baseCodeType) {
		baseCodeType.setStatus(1);
		baseCodeType.setCreateTime(new Date());
		baseCodeType.setUpdateTime(new Date());
		return baseCodeTypeDao.insert(baseCodeType);
	}

	@Override
	public int updateBaseCodeType(BaseCodeTypeCriteria criteria, BaseCodeType baseCodeType) {
		baseCodeType.setUpdateTime(new Date());
		return baseCodeTypeDao.updateByExampleSelective(baseCodeType, criteria);
	}

	@Override
	public List<BaseCodeType> selectInfoCodeType(BaseCodeTypeCriteria criteria) {
		return baseCodeTypeDao.selectByExample(criteria);
	} 
}
