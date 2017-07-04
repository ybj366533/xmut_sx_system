package com.test.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	
	private String title;
	
	private File upload;
	
	private String uploadFileName; 
	
	private String uploadContentType;
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	
	private String savePath;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getSavePath() throws Exception{
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}
	public String execute() throws Exception {
		
		FileOutputStream fos =new FileOutputStream(getSavePath()+"\\"+getUploadFileName());
		
		FileInputStream fis =new FileInputStream(getUpload());
		byte[] buffer =new byte[1024];
		int len =0;
		while((len =fis.read(buffer))>0){
			fos.write(buffer, 0, len);
		}
		System.err.println("asdas");
		fos.close();
		fis.close();
		return SUCCESS;
	}
}
