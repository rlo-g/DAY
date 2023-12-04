package kr.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.day_diary;
import kr.spring.entity.day_sticker;
import kr.spring.entity.day_temp;
import kr.spring.mapper.EditMapper;

@Service
public class EditServiceImpl implements EditService {

	@Autowired
	private EditMapper mapper;
	
	@Override
	   public List<day_diary> getdiaryname(String user_id) {
	      
	      
	      List<day_diary>diaryname = mapper.getdiaryname(user_id);
	      
	      
	      return diaryname;
	   }
	   
	@Override
	   public void upload(Map<String, Object> params) {
	      
	      mapper.upload(params);
	      
	   }

	   @Override
	   public void temp_upload(day_temp data) {
	      
	      mapper.temp_upload(data);
	      
	   }

	   @Override
	   public List<day_temp> get_temp_title(String user_id) {

	      List<day_temp>list = mapper.get_temp_title(user_id);
	      
	      return list;
	   }

	   @Override
	   public void delete_temp(int temp_idx) {
	      
	      mapper.delete_temp(temp_idx);
	      
	   }

	   @Override
	   public String get_temp_content(int temp_idx) {

	      String temp_content = mapper.get_temp_content(temp_idx);
	      
	      return temp_content;
	   }
	   
	   @Override
	   public List<day_sticker> getsticker(String user_id) {
	      List<day_sticker> sticker = mapper.getsticker(user_id);
	      return sticker;
	   }
}
