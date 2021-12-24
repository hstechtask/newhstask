package com.springmvc;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Modaltask {

	private int id;
	private String task;
	private String taskdetail;
	private String tasktime;
	private String username;
	private String remark;
	private String filename;
	private CommonsMultipartFile file;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getTaskdetail() {
		return taskdetail;
	}

	public void setTaskdetail(String taskdetail) {
		this.taskdetail = taskdetail;
	}

	public String getTasktime() {
		return tasktime;
	}

	public void setTasktime(String tasktime) {
		this.tasktime = tasktime;
	}

}
