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
	
	public static String getNamefromemail(String email) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * from SHAIRPORT.users where email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			rs.next();
			return rs.getString("name");
			

		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return "";		
	}
	public static String getPhonefromemail(String email) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * from SHAIRPORT.userticketbridge where email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int tic = rs.getInt("ticketID");
			ps = con.prepareStatement("SELECT * from SHAIRPORT.tickets where ticketID = ?");
			ps.setInt(1, tic);
			rs = ps.executeQuery();
			rs.next();
			return rs.getString("phonenumber");
			

		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return "";		
	}
	public static ArrayList<String> getAllPhonesFromEmail(String email) {
		ArrayList<String> phones = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * from SHAIRPORT.userticketbridge where email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			ArrayList<Integer> ids = new ArrayList<Integer>();
			while (rs.next()) {
				ids.add(rs.getInt("ticketID"));
			}
			for (Integer i : ids) {
				ps = con.prepareStatement("SELECT * from SHAIRPORT.tickets where ticketID = ?");
				ps.setInt(1, i);
				rs = ps.executeQuery();	
				rs.next();
				phones.add(rs.getString("phonenumber"));
			}	

		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return phones;			
	}

	
	
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
		
		ArrayList<Ticket> ticketsToRemove = new ArrayList<Ticket>();
		for (Ticket t : returnlist) {
			if (t.getEmailonTicket().equals(tic.getEmailonTicket())) {
				ticketsToRemove.add(t);
			}
		}
		for (Ticket t : ticketsToRemove) {
			returnlist.remove(t);
		}
		
		return returnlist;
	}
	
	
	// removes from the database all tickets on this date with this email
	public static void removeSameDayTickets(String email1, String email2, String date) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement getticIDS = con.prepareStatement("SELECT * from Shairport.userticketbridge where email = ?  OR email = ?");
			getticIDS.setString(1, email1);
			getticIDS.setString(2, email2);
			ResultSet rs = getticIDS.executeQuery();
			ArrayList<Integer> ids_w_email = new ArrayList<Integer>();
			while (rs.next()) {
				ids_w_email.add(rs.getInt("ticketID"));
			}
			
			ArrayList<Integer> toDelete = new ArrayList<Integer>();
			for (Integer id : ids_w_email) {
				
				PreparedStatement ds = con.prepareStatement("Select * from Shairport.tickets where ticketID = ? AND pickupdate = ?");
				ds.setInt(1, id);	
				ds.setString(2, date);
				rs = ds.executeQuery();
				while (rs.next()) {
					toDelete.add(rs.getInt("ticketID"));
				}
			}
				
			for (Integer id: toDelete) {
				System.out.println("ID being Deleted: " + id);
				PreparedStatement ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 0;");		
				ds.executeUpdate();
				
				
				ds = con.prepareStatement("Delete from Shairport.tickets where ticketID = ?");
				ds.setInt(1, id);	
				ds.executeUpdate();
				
				
				
				ds = con.prepareStatement("Delete from Shairport.userticketbridge where ticketID = ?");
				ds.setInt(1, id);	
				ds.executeUpdate();
				
				ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 1;");	
				ds.executeUpdate();
				
			}
			

		} catch (SQLException e) {
			System.out.println("Problem Here!!!");
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println("Problem Here!!!");
			System.out.println(e);
		}		
		
	}
	
	
}