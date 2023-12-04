package kr.spring.service;

import java.util.List;
import java.util.Map;

import kr.spring.entity.day_sticker_temp;

public interface StickerService {

   public void sticker_upload(Map<String, Object> params);

   public void sticker_temp_upload(day_sticker_temp data);

   public List<day_sticker_temp> get_sticker_temp_title(String user_id);

   public String get_sticker_data(int sticker_temp_idx);

   public void delete_temp_Sticker(int sticker_temp_idx);

}