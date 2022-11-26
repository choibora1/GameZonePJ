package vo;

import org.springframework.web.multipart.MultipartFile;

import criTest.SearchCriteria;
import lombok.Data;

@Data
public class GameVO extends SearchCriteria {

   private int game_number;
   private String category; 
   private String game_name;
   private String launch;
   private String publisher;
   private String price;
   private String grade;
   private String site;
   private String game_img;
   private String intro;
   private String video;
   
   private int count; // 검색순위
   
   private MultipartFile uploadimgfile;
   
}
