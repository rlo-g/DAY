package kr.spring.service;

import java.util.List;

import kr.spring.entity.day_blog;
import kr.spring.entity.day_diary;
import kr.spring.entity.day_follow;
import kr.spring.entity.day_guestbook;
import kr.spring.entity.day_user;


// Service 클래스에서 사용할 기능의 이름을 정의하는 인터페이스
public interface DayService {

	public day_user login(day_user vo);

	public int join(day_user vo);

	public Boolean idCheck(String username);

	public Boolean nickCheck(String nickname);

	public List<day_guestbook> getVisit(String id);

	public day_blog getBlog(String username);

	public void profileUpdate(day_blog mvo);

	public void visitIn(day_guestbook vo);

	public void makeBlog(day_blog vo);

	public String delGet(int idx);

	public void modify(day_user vo);

	public void deleteDiary(int idx);

	public boolean isUserIdExists(day_user vo);

	public List<day_blog> findId(String term);

	public void modifydiary(day_diary vo);

}
