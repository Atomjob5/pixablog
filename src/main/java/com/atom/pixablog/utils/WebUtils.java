package com.atom.pixablog.utils;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Atom
 * @date 2019/11/21
 * @time 15:30
 */
public class WebUtils {
    public static ServletRequestAttributes getServletRequestAttributes() {
        return (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
    }

    /**
     * 得到当前线程请求对象
     */
    public static HttpServletRequest getHttpServletRequest() {
        return getServletRequestAttributes().getRequest();
    }


    /**
     * 得到当前线程响应对象
     */
    public static HttpServletResponse getHttpServletResponse() {
        return getServletRequestAttributes().getResponse();
    }
}

