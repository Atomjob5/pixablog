package com.atom.pixablog.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * @author Atom
 * @date 2019/11/20
 * @time 17:58
 */
public class SysUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private String id;
    @Column(name = "login_name")
    private String loginName;
    @Column
    private String password;
    @Column
    private String name;
    @Column
    private Integer sex;
    @Column
    private String description;
    @Column
    private String profilePhoto;
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss" , timezone = "GMT+8")
    private Date createTime;
    @Column
    private Integer role;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProfilePhoto() {
        return profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "SysUser{" +
                "id='" + id + '\'' +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", description='" + description + '\'' +
                ", profilePhoto='" + profilePhoto + '\'' +
                ", createTime=" + createTime +
                ", role=" + role +
                '}';
    }
}
