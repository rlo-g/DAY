package kr.spring.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.day_sticker_temp;

@Mapper
public interface StickerMapper {
	public void sticker_upload(Map<String, Object> params);

    public void sticker_temp_upload(day_sticker_temp data);

    public List<day_sticker_temp> get_sticker_temp_title(String user_id);

    public String get_sticker_data(int sticker_temp_idx);

    public void delete_temp_Sticker(int sticker_temp_idx);
}
