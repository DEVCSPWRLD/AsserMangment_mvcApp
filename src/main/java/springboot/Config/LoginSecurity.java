package springboot.Config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
public class LoginSecurity extends WebSecurityConfigurerAdapter {
	
	@Autowired
	AuthenticationSuccessHandler successHandler;
	
	@Autowired    
	private DataSource dataSource;
    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().passwordEncoder(new BCryptPasswordEncoder())
            .dataSource(dataSource)
            .usersByUsernameQuery("select email,password,'true' as enabled from user where email = ?")
            .authoritiesByUsernameQuery("select email, role from user where email=?")
        ;
    }

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeRequests()
			.antMatchers("/admin/dashboard").hasAnyRole("ADMIN")
			.antMatchers("/user/openinfo").hasAnyRole("USER")
			.antMatchers("user/asset").access("hasRole('USER')")
			.antMatchers("/user").access("hasRole('USER')")
			.antMatchers("/admin/report").access("hasRole('ADMIN')")
			.antMatchers("/user/changepass").access("hasRole('ADMIN') or hasRole('USER') ")
			.and()
			.formLogin()
			.loginPage("/login")
			.failureUrl("/loginerror")
			.successHandler(successHandler)
			.permitAll()
			.and().logout();
	}
	
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}
	 
	
	
	
	
}	