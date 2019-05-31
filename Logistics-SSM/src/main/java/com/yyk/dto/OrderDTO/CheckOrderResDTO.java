package com.yyk.dto.OrderDTO;

import java.util.Date;

import com.yyk.entity.SysOrder;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月4日 下午10:06:16
* 类说明
*/
public class CheckOrderResDTO extends SysOrder{
     private String orderStatusName;
     
     private String payMethodName;
     
     
     
	public String getPayMethodName() {
		return payMethodName;
	}

	public void setPayMethodName(String payMethodName) {
		this.payMethodName = payMethodName;
	}

	public String getOrderStatusName() {
		return orderStatusName;
	}

	public void setOrderStatusName(String orderStatusName) {
		this.orderStatusName = orderStatusName;
	}
     
      
      
}
