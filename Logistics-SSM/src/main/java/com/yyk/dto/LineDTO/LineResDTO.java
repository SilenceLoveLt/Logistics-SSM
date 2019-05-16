package com.yyk.dto.LineDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yyk.entity.SysLine;

public class LineResDTO extends SysLine{
	
	

	private Map<String, Object> state;
    private String code;
	private String codetype;
	private Integer pageNo;
	private Integer pageSize;
    private String lineTypeName;
    
    
    
	public String getLineTypeName() {
		return lineTypeName;
	}

	public void setLineTypeName(String lineTypeName) {
		this.lineTypeName = lineTypeName;
	}

	public String getCodetype() {
		return codetype;
	}

	public void setCodetype(String codetype) {
		this.codetype = codetype;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public static Map<String, Object> getStateMap() {
		return stateMap;
	}

	public static void setStateMap(Map<String, Object> stateMap) {
		LineResDTO.stateMap = stateMap;
	}

	public void setState(Map<String, Object> state) {
		this.state = state;
	}

	public void setCode(String code) {
		this.code = code;
	}


	private static Map<String, Object> stateMap = new HashMap<String, Object>();

    static {
        stateMap.put("checked", true);
    } 
    
	public Map<String, Object> getState() {
		return state;
	}
	
	public void setState() {
		this.state = stateMap;
	}
	
	
	
	public String getCode() {
		return code;
	}

}
