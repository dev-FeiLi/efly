package com.dhc.eggsfly.manager_notice_board.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dhc.eggsfly.manager_notice_board.domain.NoticeBoard;
import com.dhc.eggsfly.manager_notice_board.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
    @Autowired
    private NoticeBoardService NoticeBoardService;

    ArrayList <NoticeBoard> NoticeBoard = new ArrayList <NoticeBoard> ();
      
    @RequestMapping(value = "/NoticeBoard")
    @ResponseBody
    public ArrayList<NoticeBoard> NoticeBoard1(HttpServletRequest request,
            HttpSession session, Model model){
    	String announcement = request.getParameter("meeting");
    	System.out.println(announcement);
        ArrayList <NoticeBoard> MeetingRoom = NoticeBoardService.getNoticeBoardInfo();
        return MeetingRoom;
    }

    @RequestMapping(value = "/announcement_insert")
    @ResponseBody
    public String NoticeBoard2(HttpServletRequest request,
            HttpSession session, Model model) {
        String announcement = request.getParameter("announcement_content");
        System.out.println(announcement);
        NoticeBoardService.setupdateannouncementInfo(announcement);
        return "1";
    }
}
