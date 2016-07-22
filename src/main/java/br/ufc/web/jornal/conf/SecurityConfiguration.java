package br.ufc.web.jornal.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.ufc.web.jornal.dao.UserDAO;

@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDAO userDao;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/editor/**").hasRole("EDITOR")
			.antMatchers("/journalist/**", "/news/delete").hasRole("JOURNALIST")
			.antMatchers("/news/edit", "/news/delete", "/news/add", "/news/addForm").hasRole("JOURNALIST")
			.antMatchers("/resources/**", "/", "/addUserForm", "/addUser", "/product/**").permitAll()
			.anyRequest().authenticated()
			.and().formLogin()
			.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDao)
			.passwordEncoder(new BCryptPasswordEncoder());
	}
	
}
