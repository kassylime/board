package com.raspberry.board.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
@Slf4j
public class SessionInterceptor implements AsyncHandlerInterceptor {
    // 로그인 전에 처리하는 메소드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("preHandle()");

        HttpSession session = request.getSession();

        if(session.getAttribute("mb") == null){
            log.info("interceptor - 로그인 안함");
            response.sendRedirect("/");
            return false;
        }
        return true;
    }
    // 로그아웃 후에 처리하는 메소드

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("postHandle()");
        if(request.getProtocol().equals("HTTP/1.1")){
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        } else {
            response.setHeader("Pragma", "no-cache");
        }
    }
}
