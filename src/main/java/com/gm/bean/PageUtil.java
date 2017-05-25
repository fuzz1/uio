package com.gm.bean;



public class PageUtil {
	public int limit = 10;//每页限制数,默认为10
    public int offset = 1;//当前页偏移,默认为1
    public String order;//排序
    public String sort;//排序列名称
    public String search;//搜索内容
    
  //这里是模糊查询,所以需要对search字段改造下
    public void setSearch(String search) {
    this.search = "%"+search+"%";
}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSearch() {
		return search;
	}

	public PageUtil(int limit, int offset, String order, String sort, String search) {
		super();
		this.limit = limit;
		this.offset = offset;
		this.order = order;
		this.sort = sort;
		this.search = search;
	}

	public PageUtil() {
		super();
	}


}
