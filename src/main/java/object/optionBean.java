package object;

import java.util.Date;

public class optionBean {
	
	private int option;
	private Date startDate;
	private Date endDate;
	private int numPeople;
	private int numBedRoom;
	private int numBath;
	private Double price;
	private int listing_ID;
	private String state;
	private int property_id;
	
	public Integer getListing_ID() {
		return listing_ID;
	}

	public void setListing_ID(Integer listing_ID) {
		this.listing_ID = listing_ID;
	}

	public Integer getOption() {
		return option;
	}
	
	public void setOption(Integer option) {
		this.option = option;
	}
	
	public Date getStartDate() {
		return startDate;
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
	
	public Integer getNumPeople() {
		return numPeople;
	}
	
	public void setNumPeople(Integer numPeople) {
		this.numPeople = numPeople;
	}
	
	public Integer getNumBedRoom() {
		return numBedRoom;
	}
	
	public void setNumBedRoom(Integer numBedRoom) {
		this.numBedRoom = numBedRoom;
	}
	public Integer getNumBath() {
		return numBath;
	}
	
	public void setNumBath(Integer numBath) {
		this.numBath = numBath;
	}
	
	public Double getPrice() {
		return price;
	}
	
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	public int getproperty() {
		return property_id;
	}

	public void setproperty(int property_id) {
		this.property_id = property_id;
	}
}
