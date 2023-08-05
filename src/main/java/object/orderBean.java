package object;

import java.util.Date;

public class orderBean {
	private int order_id;
	private int listing_id;
	private String tenant_id;
	private String roomType;
	private int numPeople;
	private double price;
	private String state;
	Date startDate = new Date();
	Date endDate = new Date();
	private int option = 0;
	
	public int getOption() {
		return option;
	}
	
	public void setOption(int option) {
		this.option = option;
	}
	
	public String getRoomType() {
		return roomType;
	}
	
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	
	public int getNumPeople() {
		return numPeople;
	}
	
	public void setNumPeople(int numPeople) {
		this.numPeople = numPeople;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public int getOrder_id() {
		return order_id;
	}
	
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	
	public int getListing_id() {
		return listing_id;
	}
	
	public void setListing_id(int listing_id) {
		this.listing_id = listing_id;
	}
	
	public String getTenant_id() {
		return tenant_id;
	}
	
	public void setTenant_id(String tenant_id) {
		this.tenant_id = tenant_id;
	}
}
