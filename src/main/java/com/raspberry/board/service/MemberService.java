package com.raspberry.board.service;

import com.raspberry.board.dao.MemberDao;
import com.raspberry.board.dto.MemberDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
@Log
public class MemberService {
    @Autowired
    private MemberDao mDao;

    private ModelAndView mv;

    // 비밀번호 암호화를 위한 인코더 객체
    private BCryptPasswordEncoder pEncoder = new BCryptPasswordEncoder();

    //아이디 중복 확인 메소드
    public String idCheck(String m_id) {
        // 리턴 타입과 같은 변수를 먼저 선언할 것
        String res = null;

        // 아이디가 중복이면 1, 아니면 0
        int cnt = mDao.inCheck(m_id);
        if (cnt == 0) {
            res = "ok";
        } else {
            res = "fail";
        }
        return res;
    }

    // 회원가입 처리용 메소드
    public String memberJoin(MemberDto member, RedirectAttributes rttr) {
        log.info("memberJoin()");
        String view = null;
        String msg = null;

        //비밀번호 암호화 처리
        String encpwd = pEncoder.encode(member.getM_pwd());
        log.info(encpwd);
        // 평문인 비밀번호를 암호문으로 덮어씀
        member.setM_pwd(encpwd);

        try {
            mDao.memberInsert(member);
            view = "redirect:/";
            msg = "가입 성공";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:joinForm";
            msg = "가입 실패";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    public String loginProc(MemberDto member, HttpSession session, RedirectAttributes rttr) {
        log.info("loginProc()");
        String view = null;
        String msg = null;

        // DB에서 회원의 비밀번호 구하기(암호문)
        String encPwd = mDao.selectPass(member.getM_id());
        // encPwd에 담겨 있을 수 있는 데이터 1) null, 2) 암호화된 비밀번호 문자열
        if (encPwd != null) {
            // 회원
            // matches(암호화되지 않은 비밀번호, 암호화된 비밀번호)
            if (pEncoder.matches(member.getM_pwd(), encPwd)) {
                // 비밀번호 맞는 경우, session에 로그인성공정보저장(접속자 정보)
                // (minfo)저장할 회원 정보 : id, name, point, g_name
                // controller member(id, pwd) -> dao(id, name, point, g_name) -> service member에 저장
                member = mDao.selectMember(member.getM_id());
                // session에 DTO 저장 (식별자, data)
                session.setAttribute("mb", member);
                // 로그인 성공, 게시판 목록으로 이동
                view = "redirect:list?pageNum=1";
                // 일단 첫페이지로 이동 view = "redirect:/";
                msg = "로그인 성공";
            } else {
                // 비밀번호 다른 경우
                view = "redirect:loginForm";
                msg = "비밀번호가 틀립니다.";
            }
        } else {
            // 비회원
            view = "redirect:loginForm";
            msg = "아이디가 존재하지 않습니다.";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    public String logout(HttpSession session) {
        log.info("logout()");
        session.invalidate();
        return "redirect:/";
    }
}

