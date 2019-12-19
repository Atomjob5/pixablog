package com.atom.pixablog.controller;

import com.alibaba.fastjson.JSON;
import com.atom.pixablog.po.SysPicture;
import com.atom.pixablog.po.SysUser;
import com.atom.pixablog.service.PictureService;
import com.atom.pixablog.utils.FileUtils;
import com.atom.pixablog.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Atom
 * @date 2019/11/21
 * @time 16:30
 */

@Controller
@RequestMapping("picture")
public class PictureController {
    @Autowired
    PictureService pictureService;


    @RequestMapping(value = "getNextPictures",method = RequestMethod.POST)
    @ResponseBody
    public List<SysPicture> getNextPictures(@RequestParam("limit") Integer limit) {
        List<SysPicture> sysPictureList = pictureService.getNextPictures(limit);
        return sysPictureList;
    }

    @RequestMapping(value = "like",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> like(@RequestParam("id") String id){
        SysUser user = (SysUser) WebUtils.getHttpServletRequest().getSession().getAttribute("user");
        Map<String, Object> map = new HashMap<>();
        if (user == null) {
            //未登录
            map.put("status","toLogin");
            return map;
        }
        SysPicture sysPicture = pictureService.getPictureById(id);
        //点赞+1
        sysPicture.setLikes(sysPicture.getLikes()+1);
        int status = pictureService.updatePicture(sysPicture);
        map.put("status",status);
        map.put("likes",sysPicture.getLikes());
        return map;
    }


    @RequestMapping(value = "upload",method = RequestMethod.POST)
    public String upload(String userId,String description,MultipartFile file){
        System.out.println(file);
        String uploadFile = FileUtils.uploadFile(file);
        if (uploadFile!=null) {
            SysPicture sysPicture = new SysPicture();
            sysPicture.setCreateTime(new Date());
            sysPicture.setUserId(Integer.valueOf(userId));
            sysPicture.setTitle(description);
            sysPicture.setUrl(uploadFile);
            sysPicture.setLikes(0);
            pictureService.savePicture(sysPicture);
        }

        return "redirect:/page/toIndex.do";
    }
}
