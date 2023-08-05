package sql;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import object.orderBean;
public class order {
	public List<orderBean> getOrderHistory(String tenant_id) throws FileNotFoundException{
		
		String order_sql = "select * from shortterm_release.orders join listing using by (listing_id) "
				+ "join property using by (property_id) " 
						+ "where tenant_id = ?";
		
		List<orderBean> orderHistory = new ArrayList<orderBean>();
		
		String user = "root";
	    String password = "Hazuki_0824";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortterm_release", user, password)) {
			PreparedStatement stmt= conn.prepareStatement(order_sql);
			
			stmt.setString(1,  tenant_id); //set the tenant_id instead of ? in the sql statement
			ResultSet rs = stmt.executeQuery(); //execute sql statement
			
			while(rs.next()) {
				orderBean order = new orderBean();
				order.setOrder_id(rs.getInt("order_id"));
				order.setListing_id(rs.getInt("listing_id"));
				order.setTenant_id(tenant_id);
				order.setNumPeople(rs.getInt("number_people"));
				order.setPrice(rs.getInt("price"));
				order.setRoomType(rs.getString("type"));
				order.setStartDate(rs.getDate("start_date"));
				order.setEndDate(rs.getDate("end_date"));
				
				orderHistory.add(order); //add this order to list of the order history
			}
		} catch (SQLException e) {
			System.out.println("close the connection");
			e.printStackTrace();
			}
		return orderHistory; //return the class that has order information
	}
}
