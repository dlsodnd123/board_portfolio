package kr.spring.board_portfolio.conrtoller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board_portfolio.kakaoLogin.KakaoAPI;
import kr.spring.board_portfolio.service.MemberService;
import kr.spring.board_portfolio.vo.MemberVo;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	KakaoAPI kakao;
	
	// 메인 페이지 담당
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv, String code) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		MemberVo member = null;
		if(userInfo.size() != 0) {
			// 카카오에 등록된 이메일로 가입된 아이디가 있는지 검색
			member = memberService.getMember((String)userInfo.get("email"));
			// 가입된 아이디가 없으면 DB에 등록
			if(member == null) {
				memberService.setKakaoMember((String)userInfo.get("email"));
			}
		}
		mv.addObject("member", member);
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
	// 로그인 페이지 담당
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv) {
		
		mv.setViewName("/main/login");
		return mv;
	}
	// 로그인 기능 담당
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, String mb_id, String mb_pw) {
		
		MemberVo member = memberService.getMemberId(mb_id);
		mv.addObject("member", member);
		mv.setViewName("redirect:/");
		return mv;
	}
	// 로그인 시 아이디 비밀번호 체크 담당
	@RequestMapping(value = "/idPw/check", method = RequestMethod.POST)
	@ResponseBody
	public Object idPwCheckPost(@RequestBody MemberVo member) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String result = memberService.idPwCheck(member);
		map.put("result", result);
		return map;
	}
	// 로그아웃 기능 구현
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutGet(ModelAndView mv, HttpServletRequest request) {
		request.getSession().removeAttribute("member");
		
		mv.setViewName("redirect:/");
		return mv;
	}
	
	// 닉네임 변경 페이지 담당
	@RequestMapping(value = "/popup/nickChange", method = RequestMethod.GET)
	public ModelAndView popupNickChangeGet(ModelAndView mv) {
		
		mv.setViewName("/popup/change/nicknameChange");
		return mv;
	}
	
	// 닉네임 변경 담당
	@RequestMapping(value = "/nickname/change", method = RequestMethod.POST)
	@ResponseBody
	public String nicknameChangePost(String mb_nickname, HttpServletRequest request) {
		
		// 세션에 저장되어 있는 회원정보 가져오기
		MemberVo member = memberService.getRequestMember(request);
		// 닉네임 변경하기
		memberService.nicknameChange(mb_nickname, member.getMb_id());
		return "success";
	}

}
