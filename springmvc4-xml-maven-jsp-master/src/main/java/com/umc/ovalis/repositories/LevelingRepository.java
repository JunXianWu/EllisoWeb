package com.umc.ovalis.repositories;

import java.util.List;

import com.umc.ovalis.models.MDLDetail;
import com.umc.ovalis.models.MDLParam;
import com.umc.ovalis.models.User;

public interface LevelingRepository {

	public List<MDLDetail> GetFtpData(List<MDLParam> ParamList);
}