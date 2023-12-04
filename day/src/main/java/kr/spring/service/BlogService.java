package kr.spring.service;

import java.util.List;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_diary;
import kr.spring.entity.day_follow;

public interface BlogService {
	
	 public List<day_blog> follow(String user_id);

	public void subscribe(day_follow vo);

	public void cancle(day_follow vo);

	public day_follow getfollow(day_follow mvo);

	public void makediary(day_diary vo);

	public List<day_diary> getdiary(String user_id);
}
