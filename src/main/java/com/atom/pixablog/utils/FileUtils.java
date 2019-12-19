package com.atom.pixablog.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author Atom
 * @date 2019/11/24
 * @time 16:31
 */
public class FileUtils {
    //照片上传根目录
    //调试模式
//    private static String fileUploadPath = "D:\\project\\java web\\pixablog\\src\\main\\webapp\\img\\picture\\";
    //上线模式
//    private static String fileUploadPath = "D:\\Program Files\\tomcat\\webapps\\pixablog_war\\img\\picture\\";
    private static String fileUploadPath = WebUtils.getHttpServletRequest().getServletContext().getRealPath("/") + "img/picture/";

    public static String uploadFile(MultipartFile multipartFile) {
        //创建目录
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(new Date());
        File parentFile = new File(fileUploadPath + format + "/");
        if (!parentFile.exists()) {
            //如果不存在，则创建父目录
            parentFile.mkdirs();
            String absolutePath = parentFile.getAbsolutePath();
        }

        //创建文件
        String originalFilename = multipartFile.getOriginalFilename();
        String substring = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileName = UUID.randomUUID().toString() + substring;
        File file = null;
        try {
            file = new File(parentFile.getPath() + "/" + fileName);
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }



        return "/img/picture/" + format + "/" + fileName;
    }
}
