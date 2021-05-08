package kr.spring.board_portfolio.conrtoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board_portfolio.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	// 메인 페이지 담당
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv) {
		
		mv.setViewName("/main/home");
		return mv;
	}
	// 회원가입 페이지 담당
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		
		mv.setViewName("/main/join/signup");
		return mv;
	}
}
