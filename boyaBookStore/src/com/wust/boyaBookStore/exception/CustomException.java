package com.wust.boyaBookStore.exception;

/**
 * 
 * @ClassName CustomException
 * @Description TODO( 系统自定义的异常类型)
 * @author hujingpin
 * @Date 2017年3月27日 上午11:23:47
 * @version 1.0.0
 */
public class CustomException extends Exception {
	  
	//异常信息
	private String message;
	
	public CustomException(String message){
		super(message);
		this.message = message;
		
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
