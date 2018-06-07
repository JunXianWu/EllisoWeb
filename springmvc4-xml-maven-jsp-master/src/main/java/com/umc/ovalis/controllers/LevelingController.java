package com.umc.ovalis.controllers;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.umc.ovalis.models.MDLDetail;
import com.umc.ovalis.models.MDLParam;
import com.umc.ovalis.models.User;
import com.umc.ovalis.repositories.LevelingRepository;

import ch.qos.logback.classic.Logger;

@Controller
public class LevelingController {

	private static Logger logger = (Logger) LoggerFactory.getLogger(LevelingController.class);
	private LevelingRepository levelingRepository; 

	@Autowired 
	public LevelingController(LevelingRepository levelingRepository) { 
		this.levelingRepository = levelingRepository; 
	} 	
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView Index() {
    	return new ModelAndView("redirect:/GetMDLData");
    }
    
//    @RequestMapping(value = "/GetMDLData", method = RequestMethod.GET)
//    public String GetMDLData(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
//        User user = new User((long)1,"Xian");
//        
//    	model.addAttribute("name", user);
//        //getAllUsers();
//        return "Leveling/MDLData";
//    }
    
	@RequestMapping(value="/GetMDLData", produces="application/json")
	public @ResponseBody List<MDLDetail> GetMDLData(Model model){		
		List<MDLParam> mdlParamList = new ArrayList<MDLParam>();
		for (int i = 0; i < 3; i++) {
			MDLParam mdlParam = new MDLParam();
			mdlParam.setExpsId((long)(i+1));
			mdlParam.setWaferId("Wafer_"+(i+1));
			mdlParam.setChuck("1");
			mdlParam.setPath("D:/FTP/home/ovalis/tool/Wafer_"+(i+1)+".csv");
			mdlParamList.add(mdlParam);
		}
		
		List<MDLDetail> mdlDetailList = levelingRepository.GetFtpData(mdlParamList);;
		
		return mdlDetailList;
	}    
    
//    public List<User> getAllUsers() { 
//    	return userRepository.getAll(); 
//    } 
 
}
