import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import util.JDBCUtil;

public class TicketParser {
	
	
	
	public static ArrayList<Ticket> getTicketstoDisplay(Ticket tic) {
		ArrayList<Ticket> returnlist = new ArrayList<Ticket>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement getSameDay = con.prepareStatement("SELECT * from SHAIRPORT.tickets where pickupdate = ?");
			getSameDay.setString(1, tic.getPickupdate());
			ResultSet rs = getSameDay.executeQuery();
			while (rs.next()) {
				returnlist.add(new Ticket(rs.getInt("ticketID"),rs.getString("pickupdate"),
						rs.getString("airport"), rs.getString("pickuptime"),
						rs.getString("location"), rs.getString("phonenumber")));
			}
			
			
			
			for (Ticket t : returnlist) {
				System.out.println("t EmailonTicket: " + t.getEmailonTicket());
				t.setSortingtime(Math.abs(tic.getPickuptime() - t.getPickuptime()));
				
			}

			Collections.sort(returnlist, new Comparator<Ticket>() {
				  @Override
				  public int compare(Ticket t1, Ticket t2) {
				    return t1.getSortingtime().compareTo(t2.getSortingtime());
				  }
			});
			

		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return returnlist;
	}
	
	
	// removes from the database all tickets on this date with this email
	public static void removeSameDayTickets(String email, String date) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement getticIDS = con.prepareStatement("SELECT * from Shairport.userticketbridge where email = ?");
			getticIDS.setString(1, email);
			ResultSet rs = getticIDS.executeQuery();
			ArrayList<Integer> idstodelete = new ArrayList<Integer>();
			while (rs.next()) {
				idstodelete.add(rs.getInt("ticketID"));
			}

			for (Integer id: idstodelete) {
				PreparedStatement ds = con.prepareStatement("Delete from Shairport.tickets where ticketID = ? ");
				ds.setInt(1, id);	
				ds.executeUpdate();
				
				ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 0;");
				ds.setInt(1, id);	
				ds.executeUpdate();
				
				ds = con.prepareStatement("Delete from Shairport.userticketbridge where ticketID = ?");
				ds.setInt(1, id);	
				ds.executeUpdate();
				
				ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 1;");
				ds.setInt(1, id);	
				ds.executeUpdate();
				
			}
			

		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}		
		
	}
	
	
}