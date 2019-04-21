package com.yyk.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.BaseCodeMapper;
import com.yyk.dao.BaseCodeTypeMapper;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.BaseCodeType;
import com.yyk.service.BaseCodeService;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月21日 上午1:02:18
* 类说明
*/
@Service("baseCodeService")
public class BaseCodeServiceImpl implements BaseCodeService{
	@Autowired
	private BaseCodeMapper baseCodeDao;

	@Override
	public ResDataDTO<List<BaseCode>> selectCodeByPage(BaseCodeCriteria criteria, PageInfo pageInfo) {
		List<BaseCode> baseCodeList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			baseCodeList=baseCodeDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(baseCodeDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			baseCodeList=baseCodeDao.selectByExample(criteria);
		}
		ResDataDTO<List<BaseCode>> listRes=new ResDataDTO<List<BaseCode>>();
		listRes.setData(baseCodeList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public int insertBaseCode(BaseCode baseCode) {
		baseCode.setStatus(1);
		baseCode.setCreateTime(new Date());
		baseCode.setUpdateTime(new Date());
		return baseCodeDao.insert(baseCode);
	}

	@Override
	public int updateBaseCode(BaseCodeCriteria criteria, BaseCode baseCode) {
		baseCode.setUpdateTime(new Date());
		return baseCodeDao.insert(baseCode);
	}

	@Override
	public List<BaseCode> selectInfoCode(BaseCodeCriteria criteria) {
		return baseCodeDao.selectByExample(criteria);
	} 
}
