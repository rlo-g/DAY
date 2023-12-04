package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class day_user {
	
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_email;
	private String user_role;
	private String joined_at;
	
}
