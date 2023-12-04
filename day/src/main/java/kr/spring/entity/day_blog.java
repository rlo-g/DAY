package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class day_blog {
	
	private int blog_idx;
	private String user_id;
	private String user_nick;
	private String blog_profile;
	private String blog_greetings;
	private String blog_header;
	private String blog_main;
	private String blog_sidebar;
	private String blog_title;
	private String created_at;
		
	
	
}
