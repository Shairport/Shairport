import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.*;

import util.JDBCUtil;

public class Ticket {
	private int ticketID;
    private String pickupdate; // yyyy-mm-dd
    private String airport;
    private String pickuptime; // when they want to be at the airport
    private String location; // pickup location
    private String phonenumber;
    private Integer sortingtime;

    Ticket(int t, String pd, String a, String pt, String l, String p) {
    	ticketID = t;
    	pickupdate = pd;
    	airport = a;
    	pickuptime = pt;
    	location = l;
    	// phone
    	phonenumber = p;

    }

    public int getTicketID() {
        return ticketID;
    }
    
    public String getEmailonTicket() {
    	String email = "";
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con= JDBCUtil.getConnection();

			PreparedStatement getemail = con.prepareStatement("SELECT * from Shairport.userticketbridge where ticketID = ?");
			getemail.setInt(1, ticketID);
			ResultSet rs = getemail.executeQuery();
			rs.next();
			email = rs.getNString("email");
    		
    	} catch(SQLException e) {
			System.out.println(e);
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);    			
		}
    	return email;
    }
    
    public String getNameonTicket() {
    	String name = "";
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con= JDBCUtil.getConnection();
			
			PreparedStatement getname = con.prepareStatement("SELECT * from Shairport.users where email = ?");
			getname.setString(1, getEmailonTicket());
			ResultSet rs = getname.executeQuery();
			
			if (rs.next()) {
				name = rs.getNString("name");
			}
    	} catch(SQLException e) {
			System.out.println(e);
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);    			
		}
		return name;
    }
    
    
    public String getPickupdate() {
        return pickupdate;
    }
    public String getDisplayPickupTime() {
    	String tobereturned = "";
    	String hour = pickuptime.substring(0,2);
    	int hr = Integer.parseInt(hour);
    	boolean isPM = false;
    	if (hr > 12) {
    		hr -= 12;
    		isPM = true;
    	}
    	tobereturned += String.valueOf(hr);
    	tobereturned += pickuptime.substring(2);
    	if (isPM) {
    		tobereturned+=" PM";
    	} else {tobereturned+=" AM";}
    	return tobereturned;
    }
    
    public String getAirport() {
        return airport;
    }
    public Integer getPickuptime() {
    	String [] hourMin = pickuptime.split(":");
    	int hour = Integer.parseInt(hourMin[0]);
    	int minute = Integer.parseInt(hourMin[1]);
    	return (hour * 60 + minute);
        
    }
    public String getLocation() {
        return location;
    }
    public String getPhonenumber() {
        return phonenumber;
    }
    public Integer getSortingtime() {
    	return sortingtime;
    }
    public void setSortingtime(int x) {
    	sortingtime = x;
    }

}