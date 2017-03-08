package com.dhc.eggsfly.manager.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.manager.domain.UserForAdmin;
import com.dhc.eggsfly.manager.service.UserService;

@Controller
@RequestMapping("/manager")
public class ManagerStaffController {

    @Autowired
    private UserForAdmin user;

    @Autowired
    private UserService userService;

    @RequestMapping("/init")
    public String index(){
        return "admin/manager_staff";
    }

    
    @RequestMapping("/search")
    @ResponseBody
    public List<UserForAdmin> search(HttpServletRequest request, HttpServletResponse response, UserForAdmin user){
        List<UserForAdmin> userList = userService.getUserList(user);
        return userList;
    }

    
    @RequestMapping(value="/add", method = RequestMethod.POST)
    public String add(HttpServletRequest request, HttpServletResponse response, UserForAdmin user){
        try {
            userService.insertUser(user);
        } catch (Exception e) {
            return "redirect:/manager/error";
        }
        return "redirect:/manager/index";
    }

    
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, HttpServletResponse response, UserForAdmin user){
        try {
            userService.deleteUser(user);
        } catch (Exception e) {
            return "redirect:/manager/error";
        }
        return "redirect:/manager/index";
    }

    
    @RequestMapping("/error")
    public String error(){
        return "admin/error";
    }
}
