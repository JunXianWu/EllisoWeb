package com.umc.ovalis.models;

import java.io.Serializable;

public class MDLParam implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long ExpsId;
	private String WaferId;
	private String Chuck;
	private String Path;
	
	public Long getExpsId() {
		return ExpsId;
	}
	public void setExpsId(Long expsId) {
		ExpsId = expsId;
	}
	public String getWaferId() {
		return WaferId;
	}
	public void setWaferId(String waferId) {
		WaferId = waferId;
	}
	public String getChuck() {
		return Chuck;
	}
	public void setChuck(String chuck) {
		Chuck = chuck;
	}
	public String getPath() {
		return Path;
	}
	public void setPath(String path) {
		Path = path;
	}
	
	
}
