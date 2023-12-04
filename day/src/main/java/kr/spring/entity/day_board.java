package kr.spring.entity;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
//게시글 
public class day_board {

 // 글 번호 
 private int bd_idx;

 // 글 제목 
 private String bd_title;

 // 글 내용 
 private String bd_content;

 // 글 첨부파일 
 private String bd_file;

 // 글 작성일자 
 private Timestamp created_at;

 // 글 조회수 
 private Integer bd_views;

 // 작성자 아이디 
 private String user_id;

 // 글 카테고리 
 private String bd_category;

 // 글 다이어리 
 private String bd_diary;
 
 // 유저 닉네임
 private String user_nick;
 
 private int diary_idx;
 
}
 