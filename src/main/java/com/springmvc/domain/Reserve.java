package com.springmvc.domain;

public class Reserve 
{	
	private String num;	
	private String title;
	private String mem_id;
	private String name;
	private String tel;	
	private String date;
	private String contentSeq;
	
	public Reserve() 
	{
		super();
	}		

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}		

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContentSeq() {
		return contentSeq;
	}

	public void setContentSeq(String contentSeq) {
		this.contentSeq = contentSeq;
	}

	
	
}
