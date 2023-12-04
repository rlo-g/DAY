package kr.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_board;
import kr.spring.entity.day_diary;
import kr.spring.entity.day_sticker;
import kr.spring.entity.day_temp;
import kr.spring.entity.day_user;
import kr.spring.service.AwsService;
import kr.spring.service.EditService;

@Controller //현재 클래스를 핸들러 맵핑이 찾기위해 컨트롤러로 등록하는 부분 (어노테이션)
@RequestMapping("/edit/*")
public class EditController {

   @Autowired
   private EditService service;
   
   @Autowired
   ServletContext context;
   
   @Autowired
   private AwsService aws;
   
   @Value("$(ipaddress)")
   private String address;
   
   
   @GetMapping("/in")
   public String edit(HttpSession session, Model model) {
      
      day_user vo = (day_user)session.getAttribute("mvo");
      
      List<day_diary>list = service.getdiaryname(vo.getUser_id());
      
      model.addAttribute("list",list);
      
      List<day_sticker> sticker = service.getsticker(vo.getUser_id());
      
      for (day_sticker s : sticker) {
           String url = s.getSticker_url(); // URL을 가져옵니다

           // URL을 Base64로 인코딩합니다
           URL imageUrl;
         try {
            imageUrl = new URL(url);
            InputStream in = imageUrl.openStream();
              byte[] imageBytes = in.readAllBytes();
              String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
               s.setSticker_url(encodedImage);
               
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
           
       }
      
      
      model.addAttribute("sticker",sticker);
      model.addAttribute("address", address);
      
      
      
      return "blog/edit";
   }
   
   @PostMapping("/upload")
   public @ResponseBody void upload(
       @RequestParam("user_id") String userId,
       @RequestParam("bd_title") String title,
       @RequestParam("bd_category") String category,
       @RequestParam("bd_diary") String diary,
       @RequestParam("file") MultipartFile file,
       HttpServletRequest request) {

      System.out.println("title");
      long name = System.currentTimeMillis();
      
      try {
          // 파일이 비어있는지 확인
             if (file.isEmpty()) {
                 throw new IOException("Received file is empty");
             } 
         

           

          // 고유한 파일 이름 생성
              String filename = name + file.getName() + ".png";
              String url = aws.uploadfile(file,filename);
           
           
           Map<String, Object> params = new HashMap<>();
           params.put("userid", userId);
           params.put("title", title);
           params.put("category", category);
           params.put("diary", diary);
           params.put("filename", url);
           
           
           
           service.upload(params);
           
           
           
           
            
           

       } catch (IOException e) {
           System.out.println("Error during image saving: " + e.getMessage());
           e.printStackTrace();
           
       }
      
   
   }
   
    @PostMapping("/temp_upload")
       public @ResponseBody void temp_upload(@RequestBody day_temp data){
          
       
        service.temp_upload(data);
      
       }
    
    @GetMapping("get_temp_title")
       public @ResponseBody List<day_temp> get_temp_title(HttpSession session) {
          
          day_user mvo = (day_user)session.getAttribute("mvo");
         
          List<day_temp>list = service.get_temp_title(mvo.getUser_id());
          
          return list;
          
       }
       @PostMapping("/delete_temp/{temp_idx}")
       public @ResponseBody void delete_temp(@PathVariable("temp_idx") int temp_idx) {
           
             service.delete_temp(temp_idx);
             
             }

       @GetMapping("/get_temp_content/{temp_idx}")
          public @ResponseBody String get_temp_content(@PathVariable("temp_idx") int temp_idx) {
             
           
          String temp_content = service.get_temp_content(temp_idx);
             
          return temp_content;
          }

   }   
   
