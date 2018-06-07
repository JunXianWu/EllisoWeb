package com.umc.ovalis.repositories.impl;

import org.springframework.stereotype.Repository;

import com.umc.ovalis.models.MDLDetail;
import com.umc.ovalis.models.MDLParam;
import com.umc.ovalis.repositories.LevelingRepository;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class LevelingImplRepository implements LevelingRepository {
	
	@Override
	public List<MDLDetail> GetFtpData(List<MDLParam> ParamList) {
		List<MDLDetail> allMdlDetailList = new ArrayList<MDLDetail>();
		for(int i=0;i<ParamList.size();i++){
			MDLParam mdlParam = ParamList.get(i);
			String path =  mdlParam.getPath();
			
			BufferedReader fileReader = null;
			 
			try {
				MDLDetail allMdlDetail = new MDLDetail();
				allMdlDetail.setExpsId(mdlParam.getExpsId());
				allMdlDetail.setWaferId(mdlParam.getWaferId());
				allMdlDetail.setChuck(mdlParam.getChuck());
				
				List<MDLDetail> mdlDetailList = new ArrayList<MDLDetail>();
				String line = "";
				fileReader = new BufferedReader(new FileReader(path));
	 
				// Read CSV header
				fileReader.readLine();
	 
				// Read customer data line by line
				while ((line = fileReader.readLine()) != null) {
					String[] tokens = line.split(",");
					if (tokens.length > 0) {
						MDLDetail mdlDetail = new MDLDetail();
						mdlDetail.setExpsId(Long.parseLong(tokens[0]));
						mdlDetail.setWaferId(tokens[1]);
						mdlDetail.setChuck(tokens[2]);
						mdlDetail.setValue(Float.parseFloat(tokens[3]));
						mdlDetailList.add(mdlDetail);
					}
				}
				allMdlDetail.setMdlList(mdlDetailList);
				allMdlDetailList.add(allMdlDetail);
			} catch (Exception e) {
				System.out.println("Reading CSV Error!");
				e.printStackTrace();
			} finally {
				try {
					fileReader.close();
				} catch (IOException e) {
					System.out.println("Closing fileReader Error!");
					e.printStackTrace();
				}
			}
		}
		
		return allMdlDetailList;
	}
}
