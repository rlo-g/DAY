package kr.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.day_board;
import kr.spring.service.BoardService;

@RequestMapping("/board/*")
@RestController
public class BoardController {

   @Autowired
   private BoardService service;
   
   @GetMapping("/golife")
   public @ResponseBody List<day_board> lifeList() {
      
      List<day_board> list = service.getLifeList();
      
      
      return list;
   }
   @GetMapping("/travel")
   public @ResponseBody List<day_board> travelList() {
      
      List<day_board> list = service.gettravelList();
      
      return list;
   }
   @GetMapping("/culture")
   public @ResponseBody List<day_board> cultureList() {
      
      List<day_board> list = service.getcultureList();
      
      return list;
   }
   @GetMapping("/it")
   public @ResponseBody List<day_board> itList() {
      
      List<day_board> list = service.getitList();
      
      return list;
   }
   @GetMapping("/sport")
   public @ResponseBody List<day_board> sportList() {
      
      List<day_board> list = service.getsportList();
      
      return list;
   }
   @GetMapping("/issue")
   public @ResponseBody List<day_board> issueList() {
      
      List<day_board> list = service.getissueList();
      
      return list;
   }
   
   @RequestMapping("/getBoard")
   public List<day_board> getBoard(int idx) {
	   System.out.println(idx);
	   List<day_board> vo = service.getBoard(idx);
	  return vo;
   }
   
   @GetMapping("/followboard")
   public @ResponseBody List<day_board> getBoard(@RequestParam("id") String userId, @RequestParam("page") int page) {
       int maxpage = 12;
       int offset = (page - 1) * maxpage;
       
       Map<String, Object> params = new HashMap<>();
        params.put("userid", userId);
        params.put("offset", offset);
        params.put("maxpage", maxpage);
        
        
       List<day_board> list = service.followboard(params);
       
       return list;
   }
   
   @RequestMapping("/getmodal")
   public @ResponseBody List<day_board> getmodal(int idx) {
      List<day_board> list = service.getmodal(idx);
      return list; 
   }
   
   @RequestMapping("/like")
   public @ResponseBody int like(int idx, Boolean liked) {
	   //System.out.println(idx);
	   //System.out.println(liked);
	   if(liked) {
		   return service.unlike(idx);
	   }else {
		   return service.like(idx);
	   }
   }
   
   @RequestMapping("/best_board")
   public @ResponseBody List<day_board> best_board() {
      List<day_board> list = service.best_board();
      return list;
   }
   
   
}