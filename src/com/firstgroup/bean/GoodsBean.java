package com.firstgroup.bean;

import org.omg.CORBA.PRIVATE_MEMBER;

public class GoodsBean {
	private String goodsName; 
	private String producePlace;
	private String productCode;
	private String description;
	private double price;
	private String goodsPicture;
	private int goodsNumber;
	private String pid;
	
	
	
	
	
	public GoodsBean() {

	}
	public GoodsBean(String goodsName, String producePlace, String productCode,
			String description, double price, String goodsPicture,
			int goodsNumber, String pid) {
		super();
		this.goodsName = goodsName;
		this.producePlace = producePlace;
		this.productCode = productCode;
		this.description = description;
		this.price = price;
		this.goodsPicture = goodsPicture;
		this.goodsNumber = goodsNumber;
		this.pid = pid;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getProducePlace() {
		return producePlace;
	}
	public void setProducePlace(String producePlace) {
		this.producePlace = producePlace;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getGoodsPicture() {
		return goodsPicture;
	}
	public void setGoodsPicture(String goodsPicture) {
		this.goodsPicture = goodsPicture;
	}
	public int getGoodsNumber() {
		return goodsNumber;
	}
	public void setGoodsNumber(int goodsNumber) {
		this.goodsNumber = goodsNumber;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
}
