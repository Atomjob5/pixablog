package com.atom.pixablog.mapper;

import com.atom.pixablog.po.SysPicture;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @author Atom
 * @date 2019/11/21
 * @time 22:51
 */
public interface PictureMapper extends Mapper<SysPicture> {
    List<SysPicture> selectByLimit(@Param("limit") Integer limit, @Param("count") Integer count);

    List<SysPicture> selectMostLike();

    List<SysPicture> selectHistoryMostLike();
}
