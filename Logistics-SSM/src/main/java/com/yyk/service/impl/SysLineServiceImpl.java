package com.yyk.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dao.BaseCodeMapper;
import com.yyk.dao.SysLineMapper;
import com.yyk.dto.baseCodeDTO.BaseCodeDTO;
import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;
import com.yyk.entity.SysUser;
import com.yyk.service.SysLineService;
import com.yyk.util.CopyUtil;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysLineService")
public class SysLineServiceImpl implements SysLineService{
	@Autowired
	private  SysLineMapper sysLineDao;
	
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
	 cri2.andCodeTypeEqualTo("LINETYPE");	  
	 List<BaseCode> lineTypeList =baseCodeDao.selectByExample(criteria2);
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
			for (BaseCode source1 : lineTypeList) {
				BaseCodeDTO dest1 = new BaseCodeDTO();
				try {
					CopyUtil.Copy(source1, dest1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				object.setLineType(source1.getCode());
				object.setCodeType(source1.getCodeType());
				int count=sysLineDao.countByBaseCode(object);
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
	public ResDataDTO<List<SysLine>> selectApplyTypeListPage(SysLineCriteria criteria, PageInfo pageInfo) {
		List<SysLine> sysLineList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			sysLineList=sysLineDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(sysLineDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysLineList=sysLineDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysLine>> listRes=new ResDataDTO<List<SysLine>>();
		listRes.setData(sysLineList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	
	
	@Override
	public ResDataDTO<List<SysLine>> selectLineTypeListPage(SysLineCriteria criteria, PageInfo pageInfo) {
		List<SysLine> sysLineList=null;
		if(pageInfo!=null){
			PageHelper.startPage(pageInfo.getPageNum(), pageInfo.getPageSize());
			sysLineList=sysLineDao.selectByExample(criteria);
			PageHelper.clearPage();
			pageInfo.setTotal(sysLineDao.countByExample(criteria));
			int pageTotal=(int)Math.ceil(pageInfo.getTotal()/(pageInfo.getPageSize()*1.0));
			pageInfo.setPageTotal(pageTotal);
		}else{
			sysLineList=sysLineDao.selectByExample(criteria);
		}
		ResDataDTO<List<SysLine>> listRes=new ResDataDTO<List<SysLine>>();
		listRes.setData(sysLineList);
		listRes.setPageInfo(pageInfo);
		return listRes;
	}

	
	

	
}
