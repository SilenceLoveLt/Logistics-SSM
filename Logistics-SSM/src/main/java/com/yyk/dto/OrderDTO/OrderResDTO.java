package com.yyk.dto.OrderDTO;

import java.util.Date;

import com.yyk.entity.SysInvoice;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月4日 下午10:06:16
* 类说明
*/
public class OrderResDTO  extends SysInvoice{
      private String orderId;
      
      private String empName;
      
	  private String phone;
      
      private String addrNow;
      
      private Date startTime;
      
      private Date endTime;
      
      private String vehicleName;
      
      private String invoiceStatusName;
      
      private Date  lineTime;
      
      private String consigneeName;
      
      private String recePhone;
      
      
      
      
      
      public String getConsigneeName() {
		return consigneeName;
	}

	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}

	public String getRecePhone() {
		return recePhone;
	}

	public void setRecePhone(String recePhone) {
		this.recePhone = recePhone;
	}

	public String getInvoiceStatusName() {
		return invoiceStatusName;
	}

	public void setInvoiceStatusName(String invoiceStatusName) {
		this.invoiceStatusName = invoiceStatusName;
	}

	public String getVehicleName() {
		return vehicleName;
	}

	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}

	public Date getLineTime() {
		return lineTime;
	}

	public void setLineTime(Date lineTime) {
		this.lineTime = lineTime;
	}

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

      
      
}
