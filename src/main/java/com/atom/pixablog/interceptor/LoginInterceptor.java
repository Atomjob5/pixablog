package com.atom.pixablog.interceptor;

import com.atom.pixablog.po.SysUser;
import com.atom.pixablog.utils.WebUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Atom
 * @date 2019/12/4
 * @time 16:51
 */

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        SysUser user = (SysUser) WebUtils.getHttpServletRequest().getSession().getAttribute("user");
        if (user == null) {
            System.out.println("=> 用户未登录,跳转到登录界面");
            response.sendRedirect(request.getContextPath()+"/page/toLogin.do");
            return false;
        }else {
            System.out.println("=> 用户已登录,跳转到主页");
            response.sendRedirect(request.getContextPath()+"/page/toIndex.do");
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("LoginInterceptor.postHandle");
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("LoginInterceptor.afterCompletion");
        super.afterCompletion(request, response, handler, ex);
    }
}
