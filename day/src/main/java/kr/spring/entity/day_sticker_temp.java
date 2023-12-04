package kr.spring.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class day_sticker_temp {
   
   // 임시저장 순번 
    private int sticker_temp_idx;

    // 작성자 아이디 
    private String user_id;

    // 임시저장 그림 
    private String sticker_temp_content;

    // 임시저장 작성일자 
    private Timestamp sticker_temp_at;
    
    // 스티커 임시저장 제목
    private String sticker_temp_title;

}