package com.springmvc.domain;

public class Review 
{
	private String num; 
	private String contentSeq;
	private String star;
	private String text;
	private String mem_id;
	private String mem_nickname;
	private String rev_date;
	
	public Review() 
	{
		super();
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	
	public String getContentSeq() {
		return contentSeq;
	}

	public void setContentSeq(String contentSeq) {
		this.contentSeq = contentSeq;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getRev_date() {
		return rev_date;
	}

	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	
	
	
	
}
