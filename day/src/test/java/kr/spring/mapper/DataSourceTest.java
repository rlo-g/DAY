package kr.spring.mapper;

import java.sql.Connection;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import kr.spring.entity.day_user;
import kr.spring.service.DayServiceImpl;
import lombok.extern.log4j.Log4j;

@Log4j // 테스트 실행결과를 콘솔창에 나오게 하기 위함
@RunWith(SpringJUnit4ClassRunner.class) //실행하기위해 스프링컨테이너에 올리는 코드
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
// root-context.xml 경로를 잡아주는 과정
@WebAppConfiguration 
// Servlet 컨테이너를 사용하기 위한 어노테이션
public class DataSourceTest {
	// root-context.xml이 이상없는지
	// test하는 클래스
	
	// Connection이 잘 되는지 테스트
	@Autowired //root-context.xml에 있는 id가 dataSource인 녀석을 사용하겠다.
	private DataSource dataSource;
	@Autowired
	private DayMapper mapper;
	@Autowired
	private DayServiceImpl test;
	@Autowired
	private WebApplicationContext ctx; //Spring Container 메모리 공간 객체 
	
	private MockMvc mockMvc; // 가상의 MVC환경 만들어주는 객체, 뷰, 핸들러, 맵핑 등등 실행해줌
	
	@Before
	public void setup() {
		 this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testController() throws Exception{
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/modify?idx=5"))//요청하다
//				.andReturn() //리턴값을 받아오겠다.
//				.getModelAndView() // controller 의 model값과 view경로를 다 받아오겠다.
//				);
//	}
//	
	
//	@Test
//	public void testConnection() {
//		try(Connection conn = dataSource.getConnection()){
//			log.info(conn);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
//	@Test
//	public void testinsert() {
//		Board vo = new Board();
//		vo.setMemid("정처기");
//		vo.setTitle("시험 이번주 토요일");
//		vo.setContent("합격가능?? 불가능???");
//		vo.setWriter("편승훈");
//		mapper.insertSelectKey(vo);
//		
//		
//	}
//	@Test
//	public void testGetList() {
//		
//		Criteria cri = new Criteria();
//		
//		List<Board> list = test.getList(cri);
//		for(Board vo : list) {
//			System.out.println(vo.toString());
//		}
//	}	
	
/*	@Test
	public void testLogin() {
		DayUser vo = new DayUser();
		vo.setUsername("admin");
	}*/
	
	
}
