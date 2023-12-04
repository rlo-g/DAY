package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class day_guestbook {
	private int gb_idx; 
    private String host;
    private String user_id;
    private String guest;
   	private String user_nick;
    private String created_at;
    private String gb_content;
}
