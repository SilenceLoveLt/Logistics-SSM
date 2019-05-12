package com.yyk.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.BaseCodeMapper;
import com.yyk.dao.SysGoodsShelvesMapper;
import com.yyk.dao.SysVehicleMapper;
import com.yyk.dto.BaseCodeDTO.BaseCodeDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysGoods;
import com.yyk.entity.SysGoodsShelves;
import com.yyk.entity.SysGoodsShelvesCriteria;
import com.yyk.entity.SysVehicle;
import com.yyk.entity.SysVehicleCriteria;
import com.yyk.service.GoodsShelvesService;
import com.yyk.service.SysVehicleService;
import com.yyk.util.CopyUtil;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("goodsShelvesService")
public class GoodsShelvesServiceImpl implements GoodsShelvesService{
	@Autowired
	private  SysGoodsShelvesMapper sysGoodsShelvesDao;

	@Override
	public ResDataDTO<List<SysGoodsShelves>> selectGoodsShelvesByPage(SysGoodsShelvesCriteria criteria,
			PageInfo pageInfo) {
		List<SysGoodsShelves> sysGoodsShelvesList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			sysGoodsShelvesList=sysGoodsShelvesDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(sysGoodsShelvesDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysGoodsShelvesList=sysGoodsShelvesDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysGoodsShelves>> listRes=new ResDataDTO<List<SysGoodsShelves>>();
		listRes.setData(sysGoodsShelvesList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	@Override
	public List<SysGoodsShelves> selectInfoGoodsShelves(SysGoodsShelvesCriteria criteria) {
		return sysGoodsShelvesDao.selectByExample(criteria);
	}

	@Override
	public int insertGoodsShelves(SysGoodsShelves sysGoodsShelves) {
		sysGoodsShelves.setCreateTime(new Date());
		sysGoodsShelves.setUpdateTime(new Date());
		sysGoodsShelves.setGoodsShelvesId(UUIDGenerator.create32Key());
		return sysGoodsShelvesDao.insertSelective(sysGoodsShelves);
	}

	@Override
	public int updateGoodsShelves(SysGoodsShelvesCriteria criteria, SysGoodsShelves sysGoodsShelves) {
		sysGoodsShelves.setUpdateTime(new Date());
		return sysGoodsShelvesDao.updateByExampleSelective(sysGoodsShelves, criteria);
	}

	@Override
	public int insertByBatch(List<SysGoodsShelves> record) {
		return sysGoodsShelvesDao.insertByBatch(record);
	}

	
	
}
