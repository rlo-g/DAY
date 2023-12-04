package kr.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_user;
import kr.spring.service.BlogService;
import kr.spring.service.DayService;

@Controller //현재 클래스를 핸들러 맵핑이 찾기위해 컨트롤러로 등록하는 부분 (어노테이션)
public class HomeController {
	@Autowired
	private DayService service;
	@Autowired
	private BlogService blog;
	
	@Value("${ipaddress}")
	private String address;
	
		@RequestMapping("/") // 요청 url로 들어왔을때 아래 기능을 수행하겠다.
		public String home() {
			System.out.println("홈 기능 수행");
			return "main/main";
			
		}
		
		 @RequestMapping("story") // 요청 url로 들어왔을때 아래 기능을 수행하겠다.
	      public String story() {
	         return "main/story";
	         
	      }
		 
	      @RequestMapping("follow") // 요청 url로 들어왔을때 아래 기능을 수행하겠다.
	      public String follow( HttpSession session, Model model) {
	    	  day_user vo = (day_user)session.getAttribute("mvo");
	    	  List<day_blog> list = blog.follow(vo.getUser_id());
	  	    model.addAttribute("list", list);
	  	    System.out.println(list);
	         return "main/follow";
	         
	      }

	  	@RequestMapping("/blogCheck")
		public @ResponseBody Boolean blogCheck(String id) {
			day_blog blog = service.getBlog(id);
			Boolean result = true;
			if(blog == null) {
				result = false;
			}
			return result;
		}
	  	
	  	@RequestMapping("editphoto") // 요청 url로 들어왔을때 아래 기능을 수행하겠다.
	      public String editphoto(Model model) {
	  		model.addAttribute("address", address);
	         return "main/editphoto";
	         
	      }
	  	
	  	
	  	@RequestMapping("/findId")
        @ResponseBody
        public List<day_blog> findId(@RequestParam String term) {
            
            
           List<day_blog>list = service.findId(term);
        
         
            return list;
        }
}
