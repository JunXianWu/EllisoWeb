package com.umc.ovalis.models;

import java.io.Serializable;
import java.util.List;

public class MDLDetail implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long ExpsId;
	private String WaferId;
	private String Chuck;
	private float Value;
	private List<MDLDetail> MdlList;
	
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
	public float getValue() {
		return Value;
	}
	public void setValue(float value) {
		Value = value;
	}
	public List<MDLDetail> getMdlList() {
		return MdlList;
	}
	public void setMdlList(List<MDLDetail> mdlList) {
		MdlList = mdlList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}	
