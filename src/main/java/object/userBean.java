package object;


public class userBean {

		private int user_id;
		private String last_name;
		private String first_name;
		private String emailAddress;
		private String landlord_id;
		private String tenant_id;
		private boolean login_flag;
	
		public int getUser_id() {
			return user_id;
		}
		
		public void setUser_id(int user_id) {
			this.user_id = user_id;
		}
		
		public String getLastName() {
			return last_name;}
		
		public void setLastName(String last_name) {
			this.last_name = last_name;
		}
		
		public String getFirstName() {
			return first_name;
		}
		
		public void setFirstName(String first_name) {
			this.first_name = first_name;
		}
		
		public String getEmailAddress() {
			return emailAddress;
		}
		
		public void setAddress(String emailAddress) {
			this.emailAddress = emailAddress;
		}
		
		public String getLandlord_id() {
			return landlord_id;
		}

		public String getTenant_id() {
			return tenant_id;
		}

		public void setTenant_id(String tenant_id) {
			this.tenant_id = tenant_id;
		}

		public void setLandlord_id(String landlord_id) {
			this.landlord_id = landlord_id;
		}
		
		public boolean isLogin_flag() {
			return login_flag;
		}

		public void setLogin_flag(boolean login_flag) {
			this.login_flag = login_flag;
		}
		
}
