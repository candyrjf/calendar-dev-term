package com.mycompany.myapp.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private CalendarService calendarService;

	//메인화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(Locale locale, ModelAndView mav) {
		//mav.addObject("message", "myCalendar 서비스에 오신 것을 환영합니다.");
		mav.setViewName("index"); // 인덱스를 호출함
		return mav;
	}
	
	// 회원가입 컨트롤러
	@RequestMapping(value = "/users/signup", method = RequestMethod.GET)
	public String viewRegistration(Model model) {
		CalendarUser userForm = new CalendarUser();
		model.addAttribute("userForm", userForm);
		return "users/signup";
	}

	//post형식으로 웹페이지로부터 입력받은 정보를 바탕으로 서비스를 통해 createUser()에 접근 후 DB에 정보를 저장한다.
	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public String processRegistration(
			@ModelAttribute("userForm") CalendarUser user, Model model) {
		this.calendarService.createUser(user);
		return "users/signupSuccess";
	}

	// 로그인 컨트롤러
	@RequestMapping(value = "/users/signin", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("users/signin");

		return model;

	}
}
