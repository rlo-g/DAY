package config;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {

	@Value("${ipaddress}")
	private String ipaddress;
	
	
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins(
                    "http://localhost:5000",// Flask 서버 주소 -> 배포후 바꿔야함
                    "https://daydayday.s3.ap-northeast-2.amazonaws.com", // AWS S3 버킷 URL,
                    "http://"+ ipaddress+":5000",
                    "http://118.40.99.195:80"
                )
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowCredentials(true);
    }
}