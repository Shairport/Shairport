
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


@WebServlet("/declineServlet")
public class declineServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
   

    
     /* Default constructor.*/
     
    public declineServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
    	String carpoollID = request.getParameter("carpoolID");
    	String tickettID = request.getParameter("ticketID");
    	String email1 = request.getParameter("email1");
    	Integer ticketID = Integer.parseInt(tickettID);
    	Integer carpoolID = Integer.parseInt(carpoollID);
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		
    		Connection con= JDBCUtil.getConnection();

    		
			PreparedStatement ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 0;");		
			ds.executeUpdate();
					
			ds = con.prepareStatement("Delete from Shairport.carpools where ticketID = ? AND carpoolID = ?");
			ds.setInt(1, ticketID);
			ds.setInt(2, carpoolID);
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