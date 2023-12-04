package kr.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_diary;
import kr.spring.entity.day_guestbook;
import kr.spring.entity.day_user;
import kr.spring.service.AwsService;
import kr.spring.service.BlogService;
import kr.spring.service.DayService;

@Controller
@RequestMapping("/myblog/*")
public class MydiaryController {
	// 마이블로그 관련 컨트롤러 
	@Autowired
	private AwsService aws;
	
	@Autowired
	private DayService service;
	
	@Autowired
	private BlogService blogService;
	
	// 페이지 이동
	
	//TODO
	@RequestMapping("in")
	public String in(HttpSession session, Model model) {
		System.out.println("마이블로그 페이지 이동");
		day_user mvo = (day_user)session.getAttribute("mvo");
        
	        // DB에서 블로그 정보 싹다 가져오기 (아이디 기준)
	    day_blog myblog = service.getBlog(mvo.getUser_id());
	    //System.out.println(myblog.toString());
	     List<day_diary> diary = blogService.getdiary(mvo.getUser_id());
	     
	     
	     
	     model.addAttribute("myblog",myblog);
	     model.addAttribute("diary", diary);
		return "blog/mydiary";
	}
	
	// 방명록 전체 띄우기
	@RequestMapping("getVisit")
	public @ResponseBody List<day_guestbook> getVisit(String id) {
		List<day_guestbook> list = service.getVisit(id);
		return list;
	}
	
	// 내 블로그 생성폼 이동
	@RequestMapping("/makeForm")
	public String makeForm() {
		return "blog/make";
	}
	
	// 내블로그 생성
	@RequestMapping("/makemyblog")
	public String makemyblog(HttpServletRequest request, HttpSession session, 
			@RequestParam("user_id") String userId,
		    @RequestParam("user_nick") String userNick,
		    @RequestParam("blog_title") String blogTitle,
		    @RequestParam("blog_greetings") String blogGreetings,
		    @RequestParam("blog_sidebar") String blogSidebar,
		    @RequestParam("blog_main") String blogMain,
		    @RequestParam("blog_profile") MultipartFile blogProfile,
		    @RequestParam("blog_header") MultipartFile blogHeader) {
		System.out.println("블로그 만들기 실행");
		
		//System.out.println(userNick);

		long name = System.currentTimeMillis();
		
		
		day_blog vo = new day_blog();
		
		try {
		
		if (!blogProfile.isEmpty()) {

			String filename = name +".png";
			 String url = aws.uploadfile(blogProfile,filename);
			 System.out.println(url);
			vo.setBlog_profile(url);
		}else {
			System.out.println("프로필 없어");
			vo.setBlog_profile("https://daydayday.s3.ap-northeast-2.amazonaws.com/day/main/defaultProfile.png");
		}
		
		
		
		if (!blogHeader.isEmpty()) {
			String filename = name + "hd.png";
			 String url = aws.uploadfile(blogHeader,filename);
			 System.out.println(url);
			vo.setBlog_header(url);
		}else {
			//블로그 헤더 설정
			vo.setBlog_header("https://daydayday.s3.ap-northeast-2.amazonaws.com/day/main/defaultHeader.jpg");
		}

		if(blogGreetings.isEmpty()) {
			vo.setBlog_greetings(userNick + "님의 블로그입니다.");
		}else {
			vo.setBlog_greetings(blogGreetings);		
		}
		if(blogGreetings.isEmpty()) {
			vo.setBlog_title(userNick+"'s DIARY");
		}else {
			vo.setBlog_title(blogTitle);
		}
		vo.setUser_id(userId);
		vo.setUser_nick(userNick);
		vo.setBlog_sidebar(blogSidebar);
		vo.setBlog_main(blogMain);
		
		// insert해라 서비스야
		service.makeBlog(vo);
		  } catch (IOException e) {
	           System.out.println("Error during image saving: " + e.getMessage());
	           e.printStackTrace();
	           
	       }
		session.setAttribute("profile", vo.getBlog_profile());
		return "redirect:/";
	}

	// 블로그 관리(내블로그 정보 수정)
	@RequestMapping("/blogUpdate")
	public String imgUpdate(HttpServletRequest request, HttpSession session,
			@RequestParam("user_id") String userId,
		    @RequestParam("blog_title") String blogTitle,
		    @RequestParam("blog_greetings") String blogGreetings,
		    @RequestParam("blog_sidebar") String blogSidebar,
		    @RequestParam("blog_main") String blogMain,
		    @RequestParam("blog_profile") MultipartFile blogProfile,
		    @RequestParam("blog_header") MultipartFile blogHeader) {
		

		
		long name = System.currentTimeMillis();
		
		day_blog oldInfo = service.getBlog(userId);

		day_blog vo = new day_blog();
		
		try {
		if (blogProfile.isEmpty()) {
			//System.out.println("여기 실행됨");
			vo.setBlog_profile(oldInfo.getBlog_profile());
			
		}else {

			String filename = name +".png";
			 String url = aws.uploadfile(blogProfile,filename);
			 //System.out.println(url);
			vo.setBlog_profile(url);
			
		}
		
		if (blogHeader.isEmpty()) {
			vo.setBlog_header(oldInfo.getBlog_header());
		}else {
			String filename = name + "hd.png";
			 String url = aws.uploadfile(blogHeader,filename);
			// System.out.println(url);
			vo.setBlog_header(url);
		}

		// 업로드한 파일의 이름을 가져오는 코드 : (key값) -> key값의 이름을 가져올 수 있음
		
		// System.out.println(memId + "/" + newProfile);
		
		
		
		vo.setUser_id(userId);
		//vo.setUser_nick(usernick);
		
		vo.setBlog_sidebar(blogSidebar);
		vo.setBlog_title(blogTitle);
		vo.setBlog_greetings(blogGreetings);
		vo.setBlog_main(blogMain);
		//System.out.println(vo.toString());
		
		// 새로운 프로필로 바꿔라 서비스야
		service.profileUpdate(vo);
		
	  } catch (IOException e) {
          System.out.println("Error during image saving: " + e.getMessage());
          e.printStackTrace();
          
      }
		session.setAttribute("profile", vo.getBlog_profile());
		return "redirect:/myblog/in";
	}
	
	@RequestMapping("/makediary")
	public String makediary(day_diary vo) {
		//System.out.println("다이어리생성 실행");
		//System.out.println(vo.toString());
		blogService.makediary(vo);
		return "redirect:/myblog/in";
	}
	
	@RequestMapping("/diaryDelete")
	public String deleteDiary(@RequestParam("idx") int idx) {
		System.out.println(idx);
		service.deleteDiary(idx);
		return "redirect:/myblog/in";
	}
	
	@RequestMapping("/modifydiary")
	   public String modifydiary(day_diary vo) {
	      System.out.println(vo.toString());
	      service.modifydiary(vo);
	      return "redirect:/myblog/in";
	   }

	
	
	
	@RequestMapping("/mydiaryCheck")
	public @ResponseBody Boolean diaryCheck(@RequestParam("id") String id) {
		System.out.println(id);
		Boolean test = false;
		List<day_diary> diary = blogService.getdiary(id);
		if (diary.size()!= 0) {
			test = true;
		}
		return test;
	}
	
	
}
