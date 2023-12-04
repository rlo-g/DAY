package kr.spring.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.day_sticker;
import kr.spring.entity.day_sticker_temp;
import kr.spring.entity.day_user;
import kr.spring.service.AwsService;
import kr.spring.service.StickerService;

@Controller
@RequestMapping("/sticker/*")
public class StickerController {

   @Autowired
      private StickerService service;
   @Autowired
      ServletContext context;
   @Autowired
   private AwsService aws;
   
   @CrossOrigin
   @PostMapping("/sticker_upload")
   public @ResponseBody void stickerUpload(
       @RequestParam("user_id") String userId,
       @RequestParam("sticker_title") String stickerTitle,
       @RequestParam("file") MultipartFile file,
       HttpServletRequest request) {
	  
	   
      long name = System.currentTimeMillis();
       try {
           // 파일이 비어있는지 확인
           if (file.isEmpty()) {
               throw new IOException("Received file is empty");
           }

           // 고유한 파일 이름 생성
           String filename = name + file.getName() + ".png";
           String url = aws.uploadfile(file,filename);
           // 파일 저장
           Map<String, Object> params = new HashMap<>();
           params.put("userid", userId);
           params.put("stickertitle", stickerTitle);
           params.put("filename", url);


           service.sticker_upload(params);
           

       } catch (IOException e) {
           System.out.println("Error during image saving: " + e.getMessage());
           e.printStackTrace();
       }
   }


    @PostMapping("/sticker_temp_upload")
    public @ResponseBody void sticker_temp_upload(@RequestBody day_sticker_temp data){
       
       service.sticker_temp_upload(data);
   
    }
    @GetMapping("get_sticker_temp_title")
    public @ResponseBody List<day_sticker_temp> get_sticker_temp_title(HttpSession session) {
       
       day_user mvo = (day_user)session.getAttribute("mvo");
      
       List<day_sticker_temp>list = service.get_sticker_temp_title(mvo.getUser_id());
       
       return list;
       
    }
    @GetMapping("/get_sticker_temp_content/{sticker_temp_idx}")
       public @ResponseBody String get_sticker_data(@PathVariable("sticker_temp_idx") int sticker_temp_idx) {
          
        
       String sticker_content = service.get_sticker_data(sticker_temp_idx);
          
       return sticker_content;
       }
    
    @PostMapping("/delete_temp_Sticker/{sticker_temp_idx}")
    public @ResponseBody void delete_temp_Sticker(@PathVariable("sticker_temp_idx") int sticker_temp_idx) {
          
        
          System.out.println(sticker_temp_idx);
          service.delete_temp_Sticker(sticker_temp_idx);
             
          
          }
    
    
}