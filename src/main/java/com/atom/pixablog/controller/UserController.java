package com.atom.pixablog.controller;

import com.atom.pixablog.po.SysUser;
import com.atom.pixablog.service.UserService;
import com.atom.pixablog.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;

/**
 * @author Atom
 * @date 2019/11/20
 * @time 17:57
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;


    @RequestMapping("loginAuth")
    public String loginAuth(String loginName, String password,String remember) {
        SysUser sysUser = new SysUser();
        sysUser.setLoginName(loginName);
        sysUser.setPassword(password);
        SysUser authUser = userService.auth(sysUser);

        if (remember == null) {
            remember = "off";
        }

        //记住密码
        if (authUser != null && remember.equals("on")) {
            //保存用户的id到cookie，下次登录直接检测是否有cookie
            Cookie cookie = new Cookie("ckUserId", authUser.getId());
            cookie.setPath("/");
            cookie.setMaxAge(7*24*60*60); //保存7天cookie
            WebUtils.getHttpServletResponse().addCookie(cookie);
        }

        //请求转发到主页
        if (authUser != null) {
            WebUtils.getHttpServletRequest().getSession().setAttribute("user",authUser);
            return "index";
        } else {
            return "login";
        }
        //重定向到登录页面

    }


    @RequestMapping("logout")
    public String logout(){
        //移除session中的user
        WebUtils.getHttpServletRequest().getSession().removeAttribute("user");
        //如果保存有cookie，则将其移除
        Cookie[] cookies = WebUtils.getHttpServletRequest().getCookies();
        for (Cookie c : cookies) {
            if (c.getName().equals("ckUserId")) {
                c.setMaxAge(0);
                c.setPath("/");
                WebUtils.getHttpServletResponse().addCookie(c);
            }
        }
        return "redirect:/page/toIndex.do";
    }
}
