
import java.sql.*;
import java.io.IOException;
import java.io.Serial;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.JDBCUtil;


@WebServlet("/acceptServlet")
public class acceptServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
   

    
     /* Default constructor.*/
     
    public acceptServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
    	String carpoollID = request.getParameter("carpoolID");
    	String tickettID = request.getParameter("ticketID");
    	String pickupdate = request.getParameter("pickupdate");
    	String email1 = request.getParameter("email1");
    	String email2 = request.getParameter("email2");
    	String location = request.getParameter("location");
    	String airport = request.getParameter("airport");
    	String name1 = request.getParameter("name1");
    	String name2 = request.getParameter("name2");
    	String pickuptime = request.getParameter("pickuptime");
    	String phone2 = request.getParameter("phone2");
    	
    	
    	
    	Integer ticketID = Integer.parseInt(tickettID);
    	Integer carpoolID = Integer.parseInt(carpoollID);
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		
    		Connection con= JDBCUtil.getConnection();

    		PreparedStatement confirmCarpool = con.prepareStatement("Update Shairport.carpools Set Confirmed = ? WHERE carpoolID = ?");
    		confirmCarpool.setString(1, "T");
    		confirmCarpool.setInt(2, carpoolID);
    		confirmCarpool.executeUpdate();
    		
			PreparedStatement ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 0;");		
			ds.executeUpdate();
					
			ds = con.prepareStatement("Delete from Shairport.carpools where ticketID = ? AND carpoolID != ?");
			ds.setInt(1, ticketID);
			ds.setInt(2, carpoolID);
			ds.executeUpdate();
			
			ds = con.prepareStatement("Delete from Shairport.tickets where ticketID = ?");
			ds.setInt(1, ticketID);
			ds.executeUpdate();
			
			ds = con.prepareStatement("Delete from Shairport.userticketbridge where ticketID = ?");
			ds.setInt(1, ticketID);
			ds.executeUpdate();
			
			ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 1;");	
			ds.executeUpdate();	
    		
    	
		} catch(SQLException e) {
			System.out.println("YOOOO");
			System.out.println(e);
		}
		catch(ClassNotFoundException e) {
			System.out.println("nO");
			System.out.println(e);    			
		}

		TicketParser.removeSameDayTickets(email1, email2, pickupdate);

    	

		
    	/*

		ArrayList<Carpool> myCarpools = carpoolParser.getMyTickets(email1);
		ArrayList<Carpool> outgoing = carpoolParser.getOutgoingRequests(email1);
		ArrayList<Carpool> incoming = carpoolParser.getIncomingRequests(email1);
		request.setAttribute("name",TicketParser.getNamefromemail(email1));
		request.setAttribute("major", updateprofileServlet.getMajor(email1));
		request.setAttribute("gradyear", updateprofileServlet.getGradyear(email1));
		request.setAttribute("email",email1);
		request.setAttribute("myCarpools", myCarpools);
		request.setAttribute("outgoing", outgoing);
		request.setAttribute("incoming", incoming);
		request.getRequestDispatcher("myticket.jsp").forward(request, response);			
		
		*/
		request.setAttribute("location",location);
		request.setAttribute("airport",airport);
		request.setAttribute("name1",name1);
		request.setAttribute("name2",name2);
		request.setAttribute("ticnum",ticketID);
		request.setAttribute("pickupdate",pickupdate);
		request.setAttribute("pickuptime",pickuptime);
		request.setAttribute("email2",email2);
		request.setAttribute("phone2",phone2);
		
		request.getRequestDispatcher("pairedPage.jsp").forward(request, response);   	


}
	    	

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doGet(request,response);
    }


}