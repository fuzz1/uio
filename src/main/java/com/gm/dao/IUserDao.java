package com.gm.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gm.bean.User;

public interface IUserDao {
	public User queryByPrimaryKey(Integer id);    
    
    public List<User> queryUserByBatch(Map<String,Object> params);    
        
    public void insertUser(User user);    
        
    public void insertUserByBatch(List<User> list);    
        
    public void deleteByPrimaryKey(Integer id);    
        
    public void deleteUserByBatch(ArrayList<Integer> idList);    
        
    public void updateByPrimaryKey(User user);    
    
    public List<User> getAllUser(); 
    
    public List<User> queryByFuzzy(String search);
    
}
