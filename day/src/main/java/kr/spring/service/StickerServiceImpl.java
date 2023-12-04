package kr.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.day_sticker_temp;
import kr.spring.mapper.StickerMapper;

@Service
public class StickerServiceImpl implements StickerService{

   @Autowired
      private StickerMapper mapper;
   
   @Override
   public void sticker_upload(Map<String, Object> params) {
      
      mapper.sticker_upload(params);
      
   }

   @Override
   public void sticker_temp_upload(day_sticker_temp data) {
      
      mapper.sticker_temp_upload(data);
      
   }

   @Override
   public List<day_sticker_temp> get_sticker_temp_title(String user_id) {
      
      List<day_sticker_temp>list = mapper.get_sticker_temp_title(user_id);
      
      return list;
   }

   @Override
   public String get_sticker_data(int sticker_temp_idx){
      
      String sticker_content = mapper.get_sticker_data(sticker_temp_idx);
       
       return sticker_content;   }

   @Override
   public void delete_temp_Sticker(int sticker_temp_idx) {

      mapper.delete_temp_Sticker(sticker_temp_idx);
      
   }

}