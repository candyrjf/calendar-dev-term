package com.mycompany.myapp.web.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.service.CalendarService;
import com.mycompany.myapp.service.UserContext;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/events")
public class EventController {
	@Autowired
	private CalendarService calendarService;
	@Autowired
    private UserContext userContext;
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView createEvent(Locale locale, ModelAndView mav, Model model) {
		mav.addObject("message", "event를 생성하세요.");
		mav.setViewName("events/create");
		return mav;
	}

	// 등록된 모든 이벤트를 볼 수 있는 컨트롤러
	@RequestMapping("/")
	public ModelAndView events() {
		return new ModelAndView("events/list", "events",
				calendarService.getAllEvents());
	}

	//my.jsp에서 로그인한 사용자가 owner로 있는 이벤트를 찾기 위해 컨트롤러에서 해당 함수를 호출한 후 결과값을 jsp에 리턴한다.
	@RequestMapping("/my")
	public ModelAndView myEvents() {
		CalendarUser currentUser = userContext.getCurrentUser();
		Integer currentUserId = currentUser.getId();
		ModelAndView result = new ModelAndView("events/my", "events",
				calendarService.getEventForOwner(currentUserId));
		result.addObject("currentUser", currentUser);
		return result;
	}

	//이벤트 생성, post형식으로 웹페이지에서 입력한 이벤트 정보들을 this.calendarService.createEvent(events);를 이용하여 db에 저장
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String createEvents(@ModelAttribute("eventForm") Event events,
			Model model, RedirectAttributes redirectAttributes) {
		this.calendarService.createEvent(events);
		redirectAttributes.addFlashAttribute("message",
				"Successfully added the new event");

		// for testing purpose:
		return "redirect:/events/my";
	}

}