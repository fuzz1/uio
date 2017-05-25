package com.gm.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gm.bean.PageUtil;
import com.gm.bean.User;
import com.gm.service.IUserService;

@Controller
@RequestMapping("/user")
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserController {
	@Resource
	private IUserService userService;


	@RequestMapping("/list")
	public String UserUI() {
		return "list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(@RequestBody User user) {
		userService.addUser(user);
		return null;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@RequestBody User user) {
		/*User user=new User();
		user.setId(id);
		user.setName(name);
		user.setAge(age);*/
		System.out.println(user.getId());
		userService.update(user);
		return null;
	}

	@RequestMapping("/del")
	public String deleteUser(@RequestParam(value="id") String ss) {
		Integer id=Integer.parseInt(ss);
		//System.out.println(ss);
		userService.deleteUser(id);
		return "redirect:list";
	}
	
    @RequestMapping(value="/dels",method=RequestMethod.POST)
    @ResponseBody
	public void deletes(@RequestBody int[] ids){
    	ArrayList<Integer> idList=new ArrayList<Integer>();
    	 for (int string : ids) {
    		    idList.add(string);
    	    }
	    userService.deletes(idList);
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAllUser(@RequestBody PageUtil pageUtil) {
		//Map<String, Object> result = userService.getAllUser(pageUtil);
		Map<String, Object> result = userService.queryByFuzzy(pageUtil);
		return result;
	}
}
