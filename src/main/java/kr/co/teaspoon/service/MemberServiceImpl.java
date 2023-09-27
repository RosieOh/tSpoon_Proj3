package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.MemberDAO;
import kr.co.teaspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member getMember(String id) throws Exception {
        return memberDAO.getMember(id);
    }

    @Override
    public int memberCount() throws Exception {
        return memberDAO.memberCount();
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        memberDAO.memberInsert(member);
    }

    @Override
    public void memberEdit(Member member) throws Exception {
        memberDAO.memberEdit(member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);
    }

    //로그인을 컨트롤러에서 처리
    @Override
    public Member signIn(String id) throws Exception {
        return memberDAO.signIn(id);
    }

    //서비스에서 로그인 처리
    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        Member member = memberDAO.loginCheck(id);

        if (member != null) {
            boolean loginSuccess = pwEncoder.matches(pw, member.getPw());
            return loginSuccess;
        } else {
            // 회원 정보를 찾지 못한 경우 또는 비밀번호가 일치하지 않는 경우에는 false를 반환
            return false;
        }
    }

    //Ajax로 로그인 처리 -> 컨트롤러
    @Override
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
    }

    @Override
    public String findByEmail(String email) throws Exception {
        return memberDAO.findIdByEmail(email);
    }

    @Override
    public String findPassword(String id, String email) throws Exception {
        return memberDAO.findPassword(id, email);
    }

    // 아이디 찾기 구현
}
