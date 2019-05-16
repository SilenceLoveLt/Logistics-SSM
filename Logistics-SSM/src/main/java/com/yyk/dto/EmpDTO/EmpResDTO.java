package com.yyk.dto.EmpDTO;

import com.yyk.entity.SysEmp;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月16日 下午7:53:12
* 类说明
*/
public class EmpResDTO extends SysEmp {
	private String jobNames;

	public String getJobNames() {
		return jobNames;
	}

	public void setJobNames(String jobNames) {
		this.jobNames = jobNames;
	}

}
