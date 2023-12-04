package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_diary;
import kr.spring.entity.day_follow;
import kr.spring.mapper.BlogMapper;

@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogMapper mapper;

	  @Override
	   public List<day_blog> follow(String user_id) {
	      List<day_blog> list = mapper.follow(user_id);
	      System.out.println(list.toString());
	      return list;
	   }

	@Override
	public void subscribe(day_follow vo) {
		mapper.subscribe(vo);
	}

	@Override
	public void cancle(day_follow vo) {
		mapper.cancle(vo);
	}
	
	@Override
	public day_follow getfollow(day_follow mvo) {
		day_follow follow = mapper.getfollow(mvo);
		return follow;
	}

	@Override
	public void makediary(day_diary vo) {
		mapper.diaryInSelectKey(vo);
	}

	@Override
	public List<day_diary> getdiary(String user_id) {
		List<day_diary> vo = mapper.getdiary(user_id);
		return vo;
	}
	
}
