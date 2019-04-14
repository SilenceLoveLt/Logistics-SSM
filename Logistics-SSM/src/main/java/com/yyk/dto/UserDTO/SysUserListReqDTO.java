package com.yyk.dto.UserDTO;

import com.yyk.common.PageInfo;
import com.yyk.entity.SysUser;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:31:58
* 类说明
*/
public class SysUserListReqDTO  extends SysUser{
	private PageInfo pageInfo;

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

}
