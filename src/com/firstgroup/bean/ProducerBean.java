package com.firstgroup.bean;

public class ProducerBean {
	private String pid ;
	private String producerName ; 
	private String proPasswd ;
	private String address ;
	private String telephone ;
	private String connectionPerson ;
	private String email ;
	private String prodec ;
	private String prologo ;
	private String classify ;
	
	
	
	
	
	public ProducerBean() {
		
	}
	
	
	public ProducerBean(String pid, String producerName, String proPasswd,
			String address, String telephone, String connectionPerson,
			String email, String prodec, String prologo, String classify) {
		super();
		this.pid = pid;
		this.producerName = producerName;
		this.proPasswd = proPasswd;
		this.address = address;
		this.telephone = telephone;
		this.connectionPerson = connectionPerson;
		this.email = email;
		this.prodec = prodec;
		this.prologo = prologo;
		this.classify = classify;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getProducerName() {
		return producerName;
	}
	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}
	public String getProPasswd() {
		return proPasswd;
	}
	public void setProPasswd(String proPasswd) {
		this.proPasswd = proPasswd;
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
	public String getConnectionPerson() {
		return connectionPerson;
	}
	public void setConnectionPerson(String connectionPerson) {
		this.connectionPerson = connectionPerson;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProdec() {
		return prodec;
	}
	public void setProdec(String prodec) {
		this.prodec = prodec;
	}
	public String getPrologo() {
		return prologo;
	}
	public void setPrologo(String prologo) {
		this.prologo = prologo;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	
	

	
	
	
	
	
}
