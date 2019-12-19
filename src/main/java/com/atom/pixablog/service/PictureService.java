package com.atom.pixablog.service;

import com.atom.pixablog.po.SysPicture;

import java.util.List;

/**
 * @author Atom
 * @date 2019/11/21
 * @time 22:48
 */
public interface PictureService {
    List<SysPicture> getNextPictures(Integer limit);

    List<SysPicture> getMostLikesPictures();

    List<SysPicture> getAllPictures();

    List<SysPicture> getHistoryMostLikesPictures();

    SysPicture getPictureById(String id);

    int updatePicture(SysPicture sysPicture);

    void savePicture(SysPicture sysPicture);

    int getAllPicturesCount();
}
