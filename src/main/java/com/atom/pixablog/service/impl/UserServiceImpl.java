package com.atom.pixablog.service.impl;

import com.atom.pixablog.mapper.UserMapper;
import com.atom.pixablog.po.SysUser;
import com.atom.pixablog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Atom
 * @date 2019/11/20
 * @time 18:06
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;


    @Override
    public SysUser auth(SysUser sysUser) {
        return userMapper.selectOne(sysUser);
    }

    @Override
    public SysUser getUserById(SysUser sysUser) {
        return userMapper.selectByPrimaryKey(sysUser.getId());
    }
}
