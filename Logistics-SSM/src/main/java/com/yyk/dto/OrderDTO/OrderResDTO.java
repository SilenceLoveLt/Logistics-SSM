package com.yyk.dto.OrderDTO;

import java.util.Date;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月4日 下午10:06:16
* 类说明
*/
public class OrderResDTO {
      private String orderId;
      
      private String empName;
      
	  private String phone;
      
      private String addrNow;
      
      private Date startTime;
      
      private Date endTime;
      
      private String invoiceStatus;
      
      
      public String getEmpName() {
  		return empName;
  	}

  	public void setEmpName(String empName) {
  		this.empName = empName;
  	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddrNow() {
		return addrNow;
	}

	public void setAddrNow(String addrNow) {
		this.addrNow = addrNow;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getInvoiceStatus() {
		return invoiceStatus;
	}

	public void setInvoiceStatus(String invoiceStatus) {
		this.invoiceStatus = invoiceStatus;
	}
      
      
}
