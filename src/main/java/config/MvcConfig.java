package config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import env.로그인확인자;

@Import(value= {MyBatisConfig.class})
@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.stone")
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/",".jsp");
	
	}
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/img/**").addResourceLocations("/img/");
	    registry.addResourceHandler("/css/**").addResourceLocations("/css/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new 로그인확인자())
				.addPathPatterns("/orders");
		        /*.addPathPatterns("/**")
		        .excludePathPatterns("/main")
		        .excludePathPatterns("/boards/*")
		        .excludePathPatterns("/boards")
		        .excludePathPatterns("/board/*")
		        .excludePathPatterns("/board")
		        .excludePathPatterns("/login")
		        .excludePathPatterns("/css/**")
				.excludePathPatterns("/img/**");*/
		//Test 할 것 -로그인 없이 /member 요청하면 -> 로그인 창이 뜨며 로그인을 요청함  
		
	}
	
}
