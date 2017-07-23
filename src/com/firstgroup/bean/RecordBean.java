package com.firstgroup.bean;

public class RecordBean {
	private String shopTime;
	private String goodsPicture;
	private String goodsName;
	private String number;
	private String producerName;
	private String price;
	
	
	public String getShopTime() {
		return shopTime;
	}
	public void setShopTime(String shopTime) {
		this.shopTime = shopTime;
	}
	public String getGoodsPicture() {
		return goodsPicture;
	}
	public void setGoodsPicture(String goodsPicture) {
		this.goodsPicture = goodsPicture;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getProducerName() {
		return producerName;
	}
	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	public void changeRow(RecordBean record) {
		String shopTime = this.getShopTime();
		String goodsPicture = this.getGoodsPicture();
		String number = this.getNumber();
		String producerName = this.getProducerName();
		String price = this.getPrice();
		this.setShopTime(record.getShopTime());
		this.setGoodsPicture(record.getGoodsPicture());
		this.setNumber(record.getNumber());
		this.setProducerName(record.getProducerName());
		this.setPrice(record.getPrice());
		record.setShopTime(shopTime);
		record.setGoodsPicture(goodsPicture);
		record.setNumber(number);
		record.setProducerName(producerName);
		record.setPrice(price);
	}
	
}
