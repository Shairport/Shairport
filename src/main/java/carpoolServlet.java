
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


@WebServlet("/carpoolServlet")
public class carpoolServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
   

    
     /* Default constructor.*/
     
    public carpoolServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
    	
    	String phone2 = request.getParameter("phone2");
    	String pickupdate = request.getParameter("pickupdate");
    	String pickuptime = request.getParameter("pickuptime");
    	String location = request.getParameter("location");
    	String airport = request.getParameter("airport");
    	
    	String email1 = request.getParameter("email1");
    	String email2 = request.getParameter("email2");
    	String name1 = request.getParameter("name1");
    	String name2 = request.getParameter("name2");
    	String phone1 = request.getParameter("phone1");
    	
    	
    	ExecutorService exe = Executors.newCachedThreadPool();
    	Mail mailThread = new Mail(email2, name1, email1, name2, phone1, pickupdate);
    	
    	textThread text = new textThread(util.textAPIHELP.getAPINumber(phone2));
    	exe.execute(text);
    	exe.execute(mailThread);
    	exe.shutdown();
    	while(!exe.isTerminated()) {
    		Thread.yield();
 
    	}
    	
    	
    	
    	
    	
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con= JDBCUtil.getConnection();

			PreparedStatement addCarpool = con.prepareStatement("INSERT INTO SHAIRPORT.carpools(user1_email, user1_name,"
					+ " user1_phonenumber, user2_email, user2_name, user2_phonenumber, pickupdate, airport, pickuptime, location)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			addCarpool.setString(1, email1);
			addCarpool.setString(2, name1);
			addCarpool.setString(3, phone1);
			addCarpool.setString(4, email2);
			addCarpool.setString(5, name2);
			addCarpool.setString(6, phone2);
			addCarpool.setString(7, pickupdate);
			addCarpool.setString(8, airport);
			addCarpool.setString(9, pickuptime);
			addCarpool.setString(10, location);
			addCarpool.executeUpdate();
			
			
			TicketParser.removeSameDayTickets(phone1, pickupdate);
			TicketParser.removeSameDayTickets(phone2, pickupdate);
			request.setAttribute("location",location);
			request.setAttribute("airport",airport);
			request.setAttribute("name1",name1);
			request.setAttribute("name2",name2);
			Random rand = new Random();
			request.setAttribute("ticnum",rand.nextInt(1000));
			request.setAttribute("pickupdate",pickupdate);
			request.setAttribute("pickuptime",Ticket.getDisplayPickupTime(pickuptime));
			request.setAttribute("email2",email2);
			request.setAttribute("phone2",phone2);
			
			request.getRequestDispatcher("pairedPage.jsp").forward(request, response);
			
		} catch(SQLException e) {
			System.out.println("YOOOO");
			System.out.println(e);
		}
		catch(ClassNotFoundException e) {
			System.out.println("nO");
			System.out.println(e);    			
		}

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