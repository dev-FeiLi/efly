package com.dhc.eggsfly.manager_notice_board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.manager_notice_board.domain.NoticeBoard;
import com.dhc.eggsfly.manager_notice_board.persistence.NoticeBoardDao;

@Service
public class NoticeBoardService {
    @Autowired
    private NoticeBoardDao NoticeBoardDao;

    public ArrayList<NoticeBoard> getNoticeBoardInfo() {
        ArrayList<NoticeBoard> NoticeBoard = NoticeBoardDao
                .getNoticeBoardInfo();
        return NoticeBoard;
    }

    public void setupdateannouncementInfo(String announcement) {
        NoticeBoardDao.setUpdateNoticeBoardInfo(announcement);
    }
}
