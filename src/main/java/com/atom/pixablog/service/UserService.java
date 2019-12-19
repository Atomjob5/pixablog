package com.atom.pixablog.service;

import com.atom.pixablog.po.SysUser;

/**
 * @author Atom
 * @date 2019/11/20
 * @time 18:05
 */
public interface UserService {
    SysUser auth(SysUser sysUser);

    SysUser getUserById(SysUser sysUser);
}
