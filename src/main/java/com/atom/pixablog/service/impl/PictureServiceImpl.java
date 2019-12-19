package com.atom.pixablog.service.impl;

import com.atom.pixablog.mapper.PictureMapper;
import com.atom.pixablog.po.SysPicture;
import com.atom.pixablog.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

/**
 * @author Atom
 * @date 2019/11/21
 * @time 22:50
 */

@Service
public class PictureServiceImpl implements PictureService {
    @Autowired
    PictureMapper pictureMapper;


    @Override
    public List<SysPicture> getNextPictures(Integer limit) {
        int count = 6;
        List<SysPicture> sysPictureList = pictureMapper.selectByLimit(limit, count);
        return sysPictureList;
    }

    @Override
    public List<SysPicture> getMostLikesPictures() {
        List<SysPicture> mostLikeList = pictureMapper.selectMostLike();
        return mostLikeList;
    }

    @Override
    public List<SysPicture> getAllPictures() {
        List<SysPicture> sysPictureList = pictureMapper.selectAll();
        return sysPictureList;
    }

    @Override
    public List<SysPicture> getHistoryMostLikesPictures() {
        List<SysPicture> historyMostLikesList = pictureMapper.selectHistoryMostLike();
        return historyMostLikesList;
    }

    @Override
    public SysPicture getPictureById(String id) {
        return pictureMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updatePicture(SysPicture sysPicture) {
        return pictureMapper.updateByPrimaryKeySelective(sysPicture);
    }

    @Override
    public void savePicture(SysPicture sysPicture) {
        pictureMapper.insert(sysPicture);
    }

    @Override
    public int getAllPicturesCount() {
        int instagramCount = pictureMapper.selectCount(new SysPicture());
        return instagramCount;
    }
}
