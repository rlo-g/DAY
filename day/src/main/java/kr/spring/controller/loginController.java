package kr.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_user;
import kr.spring.service.DayService;

@Controller
@RequestMapping("/login/*")
public class loginController {
	
	@Autowired
	private DayService service;
	

	
	@RequestMapping("in")
	public String in() {
		System.out.println("로그인 페이지 이동");
		return "main/login";
	}
	
	@RequestMapping("loginProcess")
	   public String login(day_user vo, HttpSession session, RedirectAttributes redirectAttributes) {
	      
	      day_user mvo = service.login(vo);
	      
	      if(mvo != null) {
	           session.setAttribute("mvo", mvo);
	           day_blog info = service.getBlog(mvo.getUser_id());
	           if(info != null) {
	               session.setAttribute("profile", info.getBlog_profile());
	           }
	           
	           
	           return "redirect:/";
	       } else {
	           redirectAttributes.addFlashAttribute("loginStatus", "failure");
	           return "redirect:/login/in"; // Assuming /login is your login page
	       }
	   }

	

	
	@RequestMapping("logoutProcess")
	public String logout(HttpSession session){
		
			session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("join")
	   public String join(day_user vo, RedirectAttributes redirectAttributes) {
	      
	      if(vo.getUser_id()==null || vo.getUser_pw().equals("") || vo.getUser_nick()==null || vo.getUser_email().equals("") ) {
	            
	         redirectAttributes.addFlashAttribute("registrationStatus", "failure");
	         return "redirect:/login/in";
	         
	      }else if (service.isUserIdExists(vo)) {
	           // 중복된 아이디가 있을 경우
	           redirectAttributes.addFlashAttribute("registrationStatus", "failure");
	           return "redirect:/login/in";
	       }
	      else {
	         
	         int cnt = service.join(vo);
	         if(cnt==1) {
	            
	            // 회원가입 성공 시 로그인 처리까지 시키기
	            redirectAttributes.addFlashAttribute("registrationStatus", "success");
	            return "redirect:/login/in";
	         }else {
	            
	            redirectAttributes.addFlashAttribute("registrationStatus", "failure");
	            return "redirect:/login/in";
	         }
	      }
	      
	      
	      
	      
	   }
	
	@RequestMapping("idCheck")
	public @ResponseBody Boolean idCheck(String user_id){
		Boolean result = service.idCheck(user_id);
		//System.out.println(result);
		return result;
	}
	
	@RequestMapping("nickCheck")
	public @ResponseBody Boolean nickCheck(String user_nick){
		Boolean result = service.nickCheck(user_nick);
		//System.out.println(result);
		return result;
	}
	
	@RequestMapping("/modifyForm")
	public String modiForm() {
		return "member/update";
	}
	
	@RequestMapping("/modify")
	public String modify(day_user vo, HttpSession session) {
		service.modify(vo);
		return "redirect:/";
	}
}
