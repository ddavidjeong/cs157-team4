package object;

import java.util.Date;

public class listingBean {

	private int option;
	private int listingID;
	private int propertyID;
	private Date startDate;
	private Date endDate;
	private int numPeople;
	
	public int getOption() {
		return option;
	}
	
	public void setOption(int option) {
		this.option = option;
	}
	
	public int getListingID() {
		return listingID;
	}
	
	public void setListingID(int listingID) {
		this.listingID = listingID;
	}
	
	public int getPropertyID() {
		return propertyID;
	}
	
	public void setPropertyID(int propertyID) {
		this.propertyID = propertyID;
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
	
	public int getNumPeople() {
		return numPeople;
	}
	
	public void setNumPeople(int numPeople) {
		this.numPeople = numPeople;
	}
	
}
