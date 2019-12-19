package com.atom.pixablog.controller;

import com.atom.pixablog.po.SysPicture;
import com.atom.pixablog.po.SysUser;
import com.atom.pixablog.service.PictureService;
import com.atom.pixablog.service.UserService;
import com.atom.pixablog.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Atom
 * @date 2019/11/20
 * @time 17:57
 */

/**
 * 页面跳转控制器
 */

@Controller
@RequestMapping("page")
public class PageController {
    @Autowired
    private UserService userService;
    @Autowired
    private PictureService pictureService;

    @RequestMapping("toIndex")
    public String toIndex() {


        //获取cookie对象
        Cookie[] cookies = WebUtils.getHttpServletRequest().getCookies();
        //从cookie对象中查找是否保存有user的cookie
        for (Cookie c : cookies) {
            if (c.getName().equals("ckUserId")) {
                String userId = c.getValue();
                SysUser sysUser = new SysUser();
                sysUser.setId(userId);
                SysUser user = userService.getUserById(sysUser);
                WebUtils.getHttpServletRequest().getSession().setAttribute("user", user);
            }
        }

        //图片数量
        int instagramCount = pictureService.getAllPicturesCount();
        //最多点赞的图片
        List<SysPicture> mostLikesList = pictureService.getMostLikesPictures();
        //获取6张最新图片
        List<SysPicture> currentList = pictureService.getNextPictures(null);
        //获取上一个月做多点赞图片
        List<SysPicture> historyMostLikesList = pictureService.getHistoryMostLikesPictures();

        HttpSession session = WebUtils.getHttpServletRequest().getSession();
        session.setAttribute("instagramCount",instagramCount);
        session.setAttribute("mostLikesList", mostLikesList);
        session.setAttribute("currentList", currentList);
        session.setAttribute("historyMostLikesList", historyMostLikesList);
        return "index";
    }


    @RequestMapping("toLogin")
    public String toLogin() {
        return "login";
    }


    @RequestMapping("testPage")
    @ResponseBody
    public String testPage() {
        System.out.println("PageController.testPage");
        return "test";
    }


}
