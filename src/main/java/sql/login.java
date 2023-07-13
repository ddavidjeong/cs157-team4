package sql;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import object.userBean;

public class login {

	public userBean check(String user_id, String email) throws FileNotFoundException {

		//sql statement
		String login_sql = "select * from shortterm_release.users "
				+ "where user_id = ? AND email_address = ?";
		
		//create userBean object
		userBean userInfo = new userBean();


		// connect to database
	    String user = "root";
	    String password = "Hazuki_0824";
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortterm_release", user, password)) {
			PreparedStatement stmt= conn.prepareStatement(login_sql);

			stmt.setString(1, user_id);
			stmt.setString(2, email);
			// execute sql statement and get result
			ResultSet rs = stmt.executeQuery();

			//set the values to user object
			if(rs.next()) {
				userInfo.setUser_id(rs.getInt("user_id"));
				userInfo.setAddress(rs.getString("email_address"));
				userInfo.setFirstName(rs.getString("first_name"));
				userInfo.setLastName(rs.getString("last_name"));
				userInfo.setLandlord_id(rs.getString("landlord_id"));
				userInfo.setTenant_id(rs.getString("tenant_id"));
				userInfo.setLogin_flag(true);
			} else {
				userInfo.setLogin_flag(false);
			}
		} catch (SQLException e) {
			System.out.println("close the connection");
			e.printStackTrace();
			}
		//return the class that has user information
		return userInfo;
	}
}
