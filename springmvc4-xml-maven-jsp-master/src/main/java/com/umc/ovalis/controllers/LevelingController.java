package com.umc.ovalis.controllers;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    
    @RequestMapping(value = "/GetMDLData", method = RequestMethod.GET)
    public String GetMDLData(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
        User user = new User((long)1,"Xian");
        
    	model.addAttribute("name", user);
        //getAllUsers();
        return "Leveling/MDLData";
    }
    
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
	
	
	private char[] codeSequence = { 'A', '1','B', 'C', '2','D','3', 'E','4', 'F', '5','G','6', 'H', '7','I', '8','J',  
            'K',   '9' ,'L', '1','M',  '2','N',  'P', '3', 'Q', '4', 'R', 'S', 'T', 'U', 'V', 'W',  
            'X', 'Y', 'Z'};  
      
    @RequestMapping("/code")  
    public void getCode(HttpServletResponse response,HttpSession session) throws IOException{  
        int width = 63;  
        int height = 37;  
        Random random = new Random();  
	        //設置response頭資訊  
	        //禁止緩存  
	        response.setHeader("Pragma", "No-cache");  
	        response.setHeader("Cache-Control", "no-cache");  
	        response.setDateHeader("Expires", 0);  
	  
	        //生成緩衝區image類  
	        BufferedImage image = new BufferedImage(width, height, 1);  
	        //產生image類的Graphics用於繪製操作  
	        Graphics g = image.getGraphics();  
	        //Graphics類的樣式  
	        g.setColor(this.getColor(200, 250));  
	        g.setFont(new Font("Times New Roman",0,28));  
	        g.fillRect(0, 0, width, height);  
	        //繪製干擾線  
	        for(int i=0;i<40;i++){  
	            g.setColor(this.getColor(130, 200));  
	            int x = random.nextInt(width);  
	            int y = random.nextInt(height);  
	            int x1 = random.nextInt(12);  
	            int y1 = random.nextInt(12);  
	            g.drawLine(x, y, x + x1, y + y1);  
	        }  
	  
	        //繪製字元  
	        String strCode = "";  
	        for(int i=0;i<4;i++){  
	            String rand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);  
	            strCode = strCode + rand;  
	            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));  
	            g.drawString(rand, 13*i+6, 28);  
	        }  
	        //將字元保存到session中用於前端的驗證  
	        session.setAttribute("authCode", strCode.toLowerCase());  
	        g.dispose();  
	  
	        ImageIO.write(image, "JPEG", response.getOutputStream());  
	        response.getOutputStream().flush();  
	    }  
	      
	    public  Color getColor(int fc,int bc){  
	        Random random = new Random();  
	        if(fc>255)  
	            fc = 255;  
	        if(bc>255)  
	            bc = 255;  
	        int r = fc + random.nextInt(bc - fc);  
	        int g = fc + random.nextInt(bc - fc);  
	        int b = fc + random.nextInt(bc - fc);  
	        return new Color(r,g,b);  
	    }  	      	
}
