package kr.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.day_follow;
import kr.spring.service.BlogService;

@Controller
@RequestMapping("/follow/*")
public class followController {

	@Autowired
	private BlogService service;
	
	
	@PostMapping("/subscribe")
	public @ResponseBody void subscribe(day_follow vo) {
		//System.out.println(vo.toString());
		service.subscribe(vo);
	}
	
	@PostMapping("/unSubscribe")
	public @ResponseBody void cancle(day_follow vo) {
		service.cancle(vo);
	}
}
