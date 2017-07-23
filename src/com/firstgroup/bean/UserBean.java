package com.firstgroup.bean;

public class UserBean {
	private String userName;
	private String passwd;
	private String sex;
	private String address;
	private String telephone;
	private String email;
	private String postcode;
	private String userPicture;
	
	
	
	
	
	
	
	public UserBean() {
		super();
	}
	public UserBean(String userName, String passwd, String sex, String address,
			String telephone, String email, String postcode, String userPicture) {
		super();
		this.userName = userName;
		this.passwd = passwd;
		this.sex = sex;
		this.address = address;
		this.telephone = telephone;
		this.email = email;
		this.postcode = postcode;
		this.userPicture = userPicture;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getUserPicture() {
		return userPicture;
	}
	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}
	
	
	
	
	
	
}
