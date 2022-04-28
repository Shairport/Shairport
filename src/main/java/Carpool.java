
public class Carpool {
	private Ticket originalTicket;
	private String user1_email;
	private String user1_name;
	private String user1_phonenumber;
	private String user2_email;
	private String user2_name;
	private String user2_phonenumber;	
	
	public Carpool(Ticket tic, String email1, String name1, String phone1, String email2, String name2, String phone2) {
		originalTicket = tic;
		user1_email = email1;
		user1_name = name1;
		user1_phonenumber = phone1;
		user2_email = email2;
		user2_name = name2;
		user2_phonenumber = phone2;
	}
	public String getUser1_email() {
		return user1_email;
	}
	public String getUser1_name() {
		return user1_name;
	}
	public String getUser1_phonenumber() {
		return user1_phonenumber;
	}
	public String getUser2_email() {
		return user2_email;
	}
	public String getUser2_name() {
		return user2_name;
	}
	public String getUser2_phonenumber() {
		return user2_phonenumber;
	}
	public String getLocation() {
		return originalTicket.getLocation();
	}
	public int getpickuptime() {
		return originalTicket.getPickuptime();
	}
	public String getDisplayPickupTime() {
		return originalTicket.getDisplayPickupTime();
	}
	public int getSortingtime() {
		return originalTicket.getSortingtime();
	}
	public String getAirport() {
		return originalTicket.getAirport();
	}
	public String getPickupdate() {
		return originalTicket.getPickupdate();
	}

}