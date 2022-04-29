import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import util.JDBCUtil;

public class carpoolParser {
	
	
	
	public static ArrayList<Carpool> getMyTickets(String email) {
		ArrayList<Carpool> returnlist = new ArrayList<Carpool>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * from SHAIRPORT.carpools where user1_email = ? OR user2_email=?");
			ps.setString(1, email);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Ticket t = new Ticket(0, rs.getString("pickupdate"), 
						rs.getString("airport"), rs.getString("pickuptime"), 
						rs.getString("location"), rs.getString("user2_phonenumber"));	
				returnlist.add(new Carpool(t, email,
						rs.getString("user1_name"),rs.getString("user1_phonenumber"),
						rs.getString("user2_email"),rs.getString("user2_name")));
			}

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