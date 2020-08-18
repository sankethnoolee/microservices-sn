package com.microservicestest.serviceone.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DefaultServiceController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	Environment environment;
	
	@GetMapping("/testingservicesamplecall")
	public ResponseEntity<Map<String,Object>> testingServiceSampleCall() {
		logger.info("DEFAULT SERVICE --> DefaultServiceController --> testingServiceSampleCall()");
		Map<String,Object> body = new HashMap<String,Object>();
		String sampleProperty = environment.getProperty("sample.property");
		body.put("propertyFromAppProperties", sampleProperty);
		return new ResponseEntity<Map<String,Object>>(body, HttpStatus.OK);
	}
	
	@GetMapping("/homepage")
	public ModelAndView loadHomePage(HttpServletRequest request) {
		logger.info("DEFAULT SERVICE --> DefaultServiceController --> loadHomePage()");
		ModelAndView modelAndView = new ModelAndView("homePage");
		HttpSession currentSession = request.getSession(false);
		if (currentSession != null) {
			Object userSecurityContext = currentSession.getAttribute("userSecurityContext");
			if (userSecurityContext != null) {
				User userDetails = (User) userSecurityContext;
				logger.info("DEFAULT SERVICE --> DefaultServiceController --> "+userDetails);
				modelAndView.addObject("userName", userDetails.getUsername());
				modelAndView.addObject("hasPasswordExpired",userDetails.isCredentialsNonExpired());
				modelAndView.addObject("isActive",userDetails.isEnabled());
			}
		}else {
			logger.error("DEFAULT SERVICE --> DefaultServiceController --> failed to get session details");
		}

		return modelAndView;
	}

}
