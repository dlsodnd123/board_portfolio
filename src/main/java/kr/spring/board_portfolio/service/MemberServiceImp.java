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

	// 로그인시 아이디 비밀번호 체크 하기
	@Override
	public String idPwCheck(MemberVo member) {
		MemberVo oriMember = memberDao.selectMemberId(member.getMb_id());
		if(oriMember == null)
			return "notId";
		else if(!passwordEncoder.matches(member.getMb_pw(), oriMember.getMb_pw()))
			return "notSamePw";
		return "Same";
	}

	// 아이디로 회원 정보 가져오기
	@Override
	public MemberVo getMemberId(String mb_id) {
		return memberDao.selectMemberId(mb_id);
	}

	// kakao 회원 정보 등록하기
	@Override
	public void setKakaoMember(String email) {
		MemberVo member = new MemberVo();
		// 랜덤한 비밀번호 만들어서 넣어주기
		String pw = "";
		for(int i=0; i<8; i++) {
			int r = (int)(Math.random() * 62);
			if(r <= 9)
				pw += (char)('0' + r);
			else if(r <= 35)
				pw += (char)('a' + r - 10);
			else
				pw += (char)('A' + r - 36);
		}
		String enPw = passwordEncoder.encode(pw);
		// 랜덤한 닉네임 만들어서 넣어주기(중복되지 않게)
		String nickname = "";
		String nicknameCheck = "";
		do {
			for(int i=0; i<8; i++) {
				int r = (int)(Math.random() * 62);
				if(r <= 9)
					nickname += (char)('0' + r);
				else if(r <= 35)
					nickname += (char)('a' + r - 10);
				else
					nickname += (char)('A' + r - 36);
			}
			System.out.println(nickname);
			nicknameCheck = memberDao.nicknmaeCheck(nickname);
		}while(nicknameCheck != null);
		
		member.setMb_nickname(nickname);
		member.setMb_pw(enPw);
		member.setMb_id(email);
		member.setMb_division("kakao");
		System.out.println(member);
		
		memberDao.insertMember(member);
	}

	// 아이디와 일치하는 회원정보 가져오기
	@Override
	public MemberVo getMember(String id) {
		return memberDao.selectMember(id);
	}

}
