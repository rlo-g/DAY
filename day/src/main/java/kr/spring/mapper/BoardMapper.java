package kr.spring.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.entity.day_board;

@Mapper
public interface BoardMapper {

      public List<day_board> getLifeList();

      public List<day_board> gettravelList();

      public List<day_board> getcultureList();

      public List<day_board> getitList();

      public List<day_board> getsportList();

      public List<day_board> getissueList();

	public List<day_board> getBoard(int idx);

	public List<day_board> getmodal(int idx);

	public int like(int idx);

	public void upLike(int idx);

	public void downLike(int idx);
	
	public List<day_board> best_board();

    
	
	public List<day_board> followboard(Map<String, Object> params);
}