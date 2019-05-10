package com.yyk.dto.GoodsDTO;

import java.util.Date;

import com.yyk.entity.SysGoods;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月4日 下午10:06:16
* 类说明
*/
public class GoodsResDTO  extends SysGoods{
      
      private String statusName;
      
      private String goodsTypeName;

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getGoodsTypeName() {
		return goodsTypeName;
	}

	public void setGoodsTypeName(String goodsTypeName) {
		this.goodsTypeName = goodsTypeName;
	}
      
      
}
