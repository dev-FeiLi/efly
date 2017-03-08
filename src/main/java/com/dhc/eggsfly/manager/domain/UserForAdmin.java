package com.dhc.eggsfly.manager.domain;

import org.springframework.stereotype.Component;

@Component
public class UserForAdmin {
	private String user_name;
	private String password;
    private String user_id;
    private String group_name;
    private String email;
    private String phone_number;
    public String getUser_name() {
        return user_name;
    }
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getGroup_name() {
        return group_name;
    }
    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone_number() {
        return phone_number;
    }
    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }
    public UserForAdmin(String user_name, String password, String user_id,
            String group_name, String email, String phone_number) {
        super();
        this.user_name = user_name;
        this.password = password;
        this.user_id = user_id;
        this.group_name = group_name;
        this.email = email;
        this.phone_number = phone_number;
    }
    public UserForAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }


}
