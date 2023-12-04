package kr.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_diary;
import kr.spring.entity.day_follow;
import kr.spring.entity.day_user;
import kr.spring.service.BlogService;
import kr.spring.service.DayService;

@Controller
@RequestMapping("/blog/*")
public class BlogController {
    // 다른 사용자의 블로그 페이지로 이동하는 URL을 처리하는 메서드
	
	@Autowired
	private DayService service;
	
	@Autowired
	private BlogService blog;
	
	@RequestMapping("/{user_id}")
	public String in(@PathVariable String user_id, Model model, HttpSession session) {
		System.out.println("남의 블로그 이동");
		System.out.println(user_id);
		day_blog vo = service.getBlog(user_id);
		if(vo == null) {
			System.out.println("에러실행");
			return "common/error";
		}
		//System.out.println(vo.toString());
		model.addAttribute("vo", vo);
		
		List<day_diary> diary = blog.getdiary(user_id);
	     
	     model.addAttribute("diary", diary);
	     
	     
		day_user user = (day_user)session.getAttribute("mvo");
		
		if(user != null) {
			day_follow mvo = new day_follow();
			mvo.setFollower(user.getUser_id());
			mvo.setFollowee(user_id);
			//System.out.println(mvo.toString());
			
			day_follow subcribe = blog.getfollow(mvo);
			//System.out.println(subcribe.toString());
			// 로그인했고
			if(subcribe != null) {
				// null이 아니면... 구독중이면
				System.out.println(subcribe.toString());
				session.setAttribute("check", 1);
			}else {
				session.setAttribute("check",0);
			}
			
		}
		return "blog/blog";
	}
	
	

}
