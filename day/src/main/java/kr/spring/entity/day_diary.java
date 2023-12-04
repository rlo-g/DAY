package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class day_diary {

	private String user_id;
	private String diary_name;
	private int diary_idx;
	private int diary_num;
	private String diary_cover;
	private String maked_at;
}
