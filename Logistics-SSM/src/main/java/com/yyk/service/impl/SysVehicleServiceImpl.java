package com.yyk.service.impl;

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
import com.yyk.dao.SysVehicleMapper;
import com.yyk.dto.BaseCodeDTO.BaseCodeDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysVehicle;
import com.yyk.entity.SysVehicleCriteria;
import com.yyk.service.SysVehicleService;
import com.yyk.util.CopyUtil;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysVehicleService")
public class SysVehicleServiceImpl implements SysVehicleService{
	@Autowired
	private  SysVehicleMapper sysVehicleDao;
	
	@Autowired
	private BaseCodeMapper baseCodeDao;
	
	public @ResponseBody List<BaseCodeDTO> selectLeftTrees() {
	 List<BaseCodeDTO> baselistdto=new ArrayList<BaseCodeDTO>();
	 BaseCodeCriteria criteria2 = new BaseCodeCriteria();
	 BaseCodeCriteria.Criteria cri2 = criteria2.createCriteria();
	 cri2.andStatusEqualTo(1);// 只查询状态为1的
	 cri2.andCodeTypeEqualTo("APPLYTYPE");	  
	 List<BaseCode> applyTypeList=baseCodeDao.selectByExample(criteria2);
	 criteria2 = new BaseCodeCriteria();
	 cri2 = criteria2.createCriteria();
	 cri2.andStatusEqualTo(1);// 只查询状态为1的
	 cri2.andCodeTypeEqualTo("VEHICETYPE");	  
	 List<BaseCode> vehicleTypeList =baseCodeDao.selectByExample(criteria2);
	 for (BaseCode source : applyTypeList) {
		    BaseCodeDTO dest = new BaseCodeDTO();
		    BaseCodeDTO object =new BaseCodeDTO();
			try {
				CopyUtil.Copy(source, dest);
			} catch (Exception e) {
				e.printStackTrace();
			}
			int sum=0;
			dest.setText(source.getDataName());
			dest.setPartentCode("");
			dest.setChilderCode(source.getCode());
			dest.setLevel(0);
			baselistdto.add(dest);
			List<BaseCodeDTO> childerlist=new ArrayList<BaseCodeDTO>();
			dest.setNodes(childerlist);
			object.setApplyType(source.getCode());
			for (BaseCode source1 : vehicleTypeList) {
				BaseCodeDTO dest1 = new BaseCodeDTO();
				try {
					CopyUtil.Copy(source1, dest1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				object.setVehicleType(source1.getCode());
				object.setCodeType(source1.getCodeType());
				int count=sysVehicleDao.countByBaseCode(object);
				sum +=count;
				dest1.setTags(new String[]{"("+count+")"});
				dest1.setText(source1.getDataName());
				dest1.setLevel(1);
				dest1.setChilderCode(source1.getCode());
				dest1.setPartentCode(source.getCode());
				childerlist.add(dest1);
			}
			dest.setTags(new String[]{"("+sum+")"});
		}
	return  baselistdto;
	}

	
	
	@Override
	public ResDataDTO<List<SysVehicle>> selectApplyTypeListPage(SysVehicleCriteria criteria, PageInfo pageInfo) {
		List<SysVehicle> sysVehicleList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			sysVehicleList=sysVehicleDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(sysVehicleDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysVehicleList=sysVehicleDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysVehicle>> listRes=new ResDataDTO<List<SysVehicle>>();
		listRes.setData(sysVehicleList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	
	
	@Override
	public ResDataDTO<List<SysVehicle>> selectVehicleTypeListPage(SysVehicleCriteria criteria, PageInfo pageInfo) {
		List<SysVehicle> sysVehicleList=null;
		if(pageInfo!=null){
			PageHelper.startPage((pageInfo.getPageNum()/pageInfo.getPageSize()+1), pageInfo.getPageSize());
			sysVehicleList=sysVehicleDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(sysVehicleDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysVehicleList=sysVehicleDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysVehicle>> listRes=new ResDataDTO<List<SysVehicle>>();
		listRes.setData(sysVehicleList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}



	@Override
	public int updateVehicle(SysVehicleCriteria criteria, SysVehicle sysVehicle) {
		sysVehicle.setUpdateTime(new Date());
		return sysVehicleDao.updateByExampleSelective(sysVehicle,criteria);
	}



	@Override
	public int insertVehicle(SysVehicle sysVehicle) {
		sysVehicle.setStatus(1);
		sysVehicle.setVehicleId(UUIDGenerator.create32Key());
		sysVehicle.setCreateTime(new Date());
		sysVehicle.setUpdateTime(new Date());
		return sysVehicleDao.insertSelective(sysVehicle);
	}



	@Override
	public List<SysVehicle> selectVehicle(SysVehicleCriteria criteria) {
		return sysVehicleDao.selectByExample(criteria);
	}

	
	

	
}
