package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_diary;
import kr.spring.entity.day_follow;

@Mapper
public interface BlogMapper {

	public List<day_blog> follow(String username);

	public void subscribe(day_follow vo);

	public void cancle(day_follow vo);

	public day_follow getfollow(day_follow mvo);

	public void diaryInSelectKey(day_diary vo);

	public List<day_diary> getdiary(String user_id);
	
}
