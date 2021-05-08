package kr.spring.board_portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.board_portfolio.dao.MemberDao;
import kr.spring.board_portfolio.vo.MemberVo;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 아이디 중복 여부 확인
	@Override
	public String idCheck(String mb_id) {		
		return memberDao.idCheck(mb_id);
	}
	
	// 닉네임 중복 여부 확인
	@Override
	public String nicknameCheck(String mb_nickname) {
		return memberDao.nicknmaeCheck(mb_nickname);
	}
	
	// DB에 회원 등록 하기
	@Override
	public void signup(MemberVo member) {
		String enPw = passwordEncoder.encode(member.getMb_pw());
		member.setMb_pw(enPw);
		memberDao.insertMember(member);
	}

}
