package kr.spring.service;

import java.util.List;
import java.util.Map;

import kr.spring.entity.day_board;

// Service 클래스에서 사용할 기능의 이름을 정의하는 인터페이스
public interface BoardService {

      // 게시글 전체목록 보기 기능
   public List<day_board> getLifeList();

   public List<day_board> gettravelList();

   public List<day_board> getcultureList();

   public List<day_board> getitList();

   public List<day_board> getsportList();

   public List<day_board> getissueList();

   public List<day_board> getBoard(int idx);

   public List<day_board> getmodal(int idx);

   public int like(int idx);

   public int unlike(int idx);
   
   public List<day_board> best_board();

   public List<day_board> followboard(Map<String, Object> params);

   
}