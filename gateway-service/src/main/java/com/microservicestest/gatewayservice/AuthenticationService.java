package com.microservicestest.gatewayservice;

import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.netflix.discovery.EurekaClient;

@Controller
public class AuthenticationService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private static Properties bootstrapProperties;
	static{
		try {
			InputStream is  = Thread.currentThread().getContextClassLoader().getResourceAsStream("bootstrap.properties");
			bootstrapProperties = new Properties();
			bootstrapProperties.load(is);


		}catch (Exception e) {
			throw new RuntimeException("Coudnt read applicationProperties properties from class path",e);
		}
	}
	
	private final static String DEFAULT_SERVICE = bootstrapProperties.getProperty("app.services.serviceone.appname");
	private final static String HOME_PAGE = bootstrapProperties.getProperty("server.homePage");
	
    @Autowired
    private EurekaClient eurekaClient;
    
	@GetMapping("/login")
	public ModelAndView login() {
		logger.info("GATEWAY-SERVICE --> AuthenticationService -->login()");
		return new ModelAndView("login");
	}
	@GetMapping("/loadsuccesspage")
	public ModelAndView loadSuccessPage(HttpServletRequest request , HttpServletResponse response) {
		logger.info("GATEWAY-SERVICE --> AuthenticationService -->loadSuccessPage()");
		try {
		    request.getServletContext()
		    .getRequestDispatcher("/"+DEFAULT_SERVICE+"/"+"homepage")
		    .forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		logger.info("GATEWAY-SERVICE --> AuthenticationService -->logout()");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";}

}
