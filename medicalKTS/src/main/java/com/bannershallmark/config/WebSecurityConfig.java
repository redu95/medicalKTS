package com.bannershallmark.config;
import org.apache.http.impl.client.CloseableHttpClient;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.*;
import org.springframework.security.config.annotation.authentication.builders.*;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.util.DefaultUriBuilderFactory;

import com.bannershallmark.serviceImpl.UserDetailsServiceImpl;
 
@Configuration
@EnableWebSecurity
@EnableWebMvcSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
 
	@Autowired
	AuthenticationSuccessHandler authenticationSuccessHandler;
	
	
    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }
     
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
     
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
         
        return authProvider;
    }
 
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
      http.authorizeRequests()
		.antMatchers("/login","/users/reset/**","/CustomerController/getReportAjaxSync","/CustomerController/getReportByDateAjaxSync").permitAll() 
      // .antMatchers("/login","/users/reset/**","/forgotpassword/**").permitAll()
        .antMatchers("/resources/**").permitAll()
        .antMatchers("/**").authenticated()
        .and().formLogin().loginPage("/login").successHandler(authenticationSuccessHandler)
        .and().logout().logoutUrl("/logout") 
        .logoutSuccessUrl("/").and().csrf().disable() ;
        //.and().exceptionHandling().accessDeniedPage("/Access_Denied");
    }
    
    
     
    
     
  
   
}
