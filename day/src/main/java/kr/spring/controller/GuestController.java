package kr.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.day_guestbook;
import kr.spring.service.DayService;

@Controller
@RequestMapping("/visit/*")
public class GuestController {

	@Autowired
	private DayService service;
	
	@RequestMapping("/visit")
	public String guestBook(day_guestbook vo) {
		
		service.visitIn(vo);
		
		return "redirect:/blog/" + vo.getUser_id();
	}
	
	@RequestMapping("/delete/{gb_idx}")
	public String delete(@PathVariable("gb_idx") int idx) {
		String hostId = service.delGet(idx);
		return "redirect:/blog/"+hostId;
	}
}
