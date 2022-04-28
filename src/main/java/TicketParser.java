import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;


public class TicketParser {
	public static HashMap<Integer, Ticket> ticID_to_tic = new HashMap<Integer, Ticket>();
	
	
	public ArrayList<Ticket> getTicketstoDisplay(Ticket tic) {
		ArrayList<Ticket> returnlist = new ArrayList<Ticket>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= JDBCUtil.getConnection();
			PreparedStatement getSameDay = con.prepareStatement("SELECT ticketID from SHAIRPORT.tickets where pickupdate = ?");
			ResultSet rs = getSameDay.executeQuery();
			while (rs.next()) {
				returnlist.add(ticID_to_tic.get(rs.getInt("ticketID")));
			}
			
			for (Ticket t : returnlist) {
				if (t == tic) {
					continue;
				}
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
}