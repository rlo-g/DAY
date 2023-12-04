package kr.spring.service;

import java.util.List;
import java.util.Map;

import kr.spring.entity.day_diary;
import kr.spring.entity.day_sticker;
import kr.spring.entity.day_temp;

public interface EditService {
	
	public List<day_diary> getdiaryname(String user_id);
	
	public void upload(Map<String, Object> params);

	   public void temp_upload(day_temp data);

	   public List<day_temp> get_temp_title(String user_id);

	   public void delete_temp(int temp_idx);

	   public String get_temp_content(int temp_idx);
	   
	   public List<day_sticker> getsticker(String user_id);
}
