package com.umc.ovalis.controllers;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umc.ovalis.models.User;
import com.umc.ovalis.repositories.UserRepository;

import ch.qos.logback.classic.Logger;

@Controller
public class LevelingController {

	private static Logger logger = (Logger) LoggerFactory.getLogger(LevelingController.class);
	private UserRepository userRepository; 

	@Autowired 
	public LevelingController(UserRepository userRepository) { 
		this.userRepository = userRepository; 
	} 	
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView Index() {
    	return new ModelAndView("redirect:/GetMDLData");
    }
    
    @RequestMapping(value = "/GetMDLData", method = RequestMethod.GET)
    public String GetMDLData(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        getAllUsers();
        return "Leveling/MDLData";
    }
    
    public List<User> getAllUsers() { 
    	return userRepository.getAll(); 
    } 
 
}
