package kr.spring.entity;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class day_sticker {
   
    // 스티커 순번 
    private int sticker_idx;

    // 회원 아이디 
    private String user_id;

    // 스티커 주소 
    private String sticker_url;
    
    // 스티커 제목
    private String sticker_title;
    


}