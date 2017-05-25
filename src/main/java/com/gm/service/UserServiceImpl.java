package com.gm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gm.bean.PageUtil;
import com.gm.bean.User;
import com.gm.dao.IUserDao;;

@Service("userService")
public class UserServiceImpl<UserMapper> implements IUserService {

	@Resource
	private IUserDao userDao;

	public User getUserById(int userId) {
		return userDao.queryByPrimaryKey(userId);
	}

	public void insertUser(User user) {
		userDao.insertUser(user);
	}

	public void addUser(User user) {
		userDao.insertUser(user);
	}

	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	public void deleteUser(Integer id) {
		userDao.deleteByPrimaryKey(id);
	}

	public Map<String,Object> getAllUser(PageUtil pageUtil) {

		 //存储所有的信息,方面返回json串
       Map<String,Object> model = new HashMap<>();
       //开始分页,传递的参数1为请求第几页,参数2为请求条数
       PageHelper.startPage(pageUtil.getOffset()/pageUtil.getLimit()+1,pageUtil.getLimit());
       //查询       
        List<User> list = userDao.getAllUser();
       //查询结果包装到map
       PageInfo<User> pageInfo=new PageInfo<User>(list);
       model.put("total",pageInfo.getTotal());
       //查询结果包装到map
       model.put("rows",list);
       //返回json串
       return model;
	}

	@Override
	public void update(User user) {
		userDao.updateByPrimaryKey(user);
		System.out.println("2333");
	}

	@Override
	public void deletes(ArrayList<Integer> idList) {
		userDao.deleteUserByBatch(idList);
		
	}

	@Override
	public Map<String, Object> queryByFuzzy(PageUtil pageUtil) {
		 //存储所有的信息,方面返回json串
	       Map<String,Object> model = new HashMap<>();
	       //开始分页,传递的参数1为请求第几页,参数2为请求条数
	       PageHelper.startPage(pageUtil.getOffset()/pageUtil.getLimit()+1,pageUtil.getLimit());
	       //查询
	        List<User> list = userDao.queryByFuzzy(pageUtil.getSearch());
	       //查询结果包装到map
	       PageInfo<User> pageInfo=new PageInfo<User>(list);
	       model.put("total",pageInfo.getTotal());
	       //查询结果包装到map
	       model.put("rows",list);
	       //返回json串
		return model;
	}

}
