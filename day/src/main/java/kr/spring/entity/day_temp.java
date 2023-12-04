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
public class day_temp {

   private int temp_idx;
   private String user_id;
   private String temp_content;
   private String temp_title;
   private Timestamp temp_at;
   
   
}