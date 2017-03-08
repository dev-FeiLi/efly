package com.dhc.eggsfly.manager_notice_board.persistence;

import java.util.ArrayList;

import com.dhc.eggsfly.manager_notice_board.domain.NoticeBoard;


public interface NoticeBoardDao {
    public ArrayList <NoticeBoard> getNoticeBoardInfo();
    
    public void setUpdateNoticeBoardInfo(String announcement);
    
    public void setNoticeBoardInfo(NoticeBoard NoticeBoard);
}
