package com.gm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gm.bean.PageUtil;
import com.gm.bean.User;

public interface IUserService {
	
    public User getUserById(int userId);    
    
    public void insertUser(User user);    
    
    public void addUser(User user);
    
    public void deleteUser(Integer id);
    
    public List<User> getAllUser();   
     
    public Map<String,Object> getAllUser(PageUtil pageUtil);
    
    public void update(User user);
    
    public void deletes(ArrayList<Integer> idList);
    
    public Map<String,Object> queryByFuzzy(PageUtil pageUtil);
}
