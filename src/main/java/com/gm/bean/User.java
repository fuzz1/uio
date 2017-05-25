package com.gm.bean;



public class User {


public Integer id;

public String name;

public Integer age;

public String select;

public String getSelect() {
	return select;
}

public void setSelect(String select) {
	this.select = select;
}

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public Integer getAge() {
	return age;
}

public void setAge(Integer age) {
	this.age = age;
}

public User(Integer id, String name, Integer age) {
	super();
	this.id = id;
	this.name = name;
	this.age = age;
}

public User(String name, Integer age) {
	super();
	this.name = name;
	this.age = age;
}

public User() {
	super();
}


public String toString() {
	return "User [id=" + id + ", name=" + name + ", age=" + age + "]";
}



}
