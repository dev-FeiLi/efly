package com.dhc.eggsfly.manager_notice_board.domain;

import org.springframework.stereotype.Component;


@Component
public class NoticeBoard {
    //公告信息
    private String announcement;

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    public void NoticeBoardEntity(String announcement) {
        this.announcement = announcement;
    }

}
