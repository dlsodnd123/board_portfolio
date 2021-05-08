package kr.spring.board_portfolio.conrtoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board_portfolio.service.MemberService;
import kr.spring.board_portfolio.vo.MemberVo;

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
	// 회원 등록 담당
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVo member) {
		memberService.signup(member);
		
		mv.setViewName("redirect:/");
		return mv;
	}
	// 아이디 중복 체크 담당
	@RequestMapping(value = "/id/check", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String mb_id) {
		String existID = memberService.idCheck(mb_id);
		if(existID == null) {
			return "possible";
		}
		return "impossible";
	}
	// 닉네임 중복 체크 담당
	@RequestMapping(value = "/nickname/check", method = RequestMethod.POST)
	@ResponseBody
	public String nicknameCheck(String mb_nickname) {
		String existNickname = memberService.nicknameCheck(mb_nickname);
		if(existNickname == null) {
			return "possible";
		}
		return "impossible";
	}
}
