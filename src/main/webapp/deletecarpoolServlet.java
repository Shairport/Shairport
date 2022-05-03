
import java.sql.*;
import java.io.IOException;
import java.io.Serial;

import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.JDBCUtil;


@WebServlet("/deletecarpoolServlet")
public class deletecarpoolServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
   

    
     /* Default constructor.*/
     
    public deletecarpoolServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
    	
    	 Cookie ck[] = request.getCookies();
    	 String Email = "";
    	 
    	 if (ck != null) {
    	 	for (int i = 0; i < ck.length; ++i) {
    	 		if (ck[i].getName().equals("GEmail") && !(ck[i].getValue().contentEquals(""))) {
    	 			Email = java.net.URLDecoder.decode(ck[i].getValue(), "UTF-8");
    	 		} else if (ck[i].getName().equals("Email") && !(ck[i].getValue().contentEquals(""))) {
    	 			Email = ck[i].getValue().replace("&"," " );
    	 		}
    	 	}
    	 }
    	 String pickupdate = request.getParameter("pickupdate");
    	 if (pickupdate == null) {
    		 pickupdate = "";
    	 }
    	 String pickuptime = request.getParameter("pickuptime");
    	 if (pickuptime == null) {
    		 pickuptime = "";
    	 }
    	 try {
 			Class.forName("com.mysql.cj.jdbc.Driver");
 			Connection con= JDBCUtil.getConnection();
 			PreparedStatement getcarpoolIDS = con.prepareStatement("SELECT * from Shairport.carpools where (user1_email = ? or user2_email = ?) and pickupdate = ? and pickuptime = ?");
 			getcarpoolIDS.setString(1, Email);
 			getcarpoolIDS.setString(2, Email);
 			getcarpoolIDS.setString(3, pickupdate);
 			getcarpoolIDS.setString(4, pickuptime);
 			ResultSet rs = getcarpoolIDS.executeQuery();
 			ArrayList<Integer> idstodelete = new ArrayList<Integer>();
 			while (rs.next()) {
 				idstodelete.add(rs.getInt("carpoolID"));
 			}

 			for (Integer id: idstodelete) {
 				PreparedStatement ds = con.prepareStatement("SET SQL_SAFE_UPDATES = 0;");		
 				ds.executeUpdate();
 						
 				ds = con.prepareStatement("Delete from Shairport.carpools where carpoolID = ?");
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
 		
 	
    	
		ArrayList<Carpool> myCarpools = carpoolParser.getMyTickets(Email);
		request.setAttribute("myCarpools", myCarpools);
		request.setAttribute("name", TicketParser.getNamefromemail(Email));
		request.setAttribute("major", updateprofileServlet.getMajor(Email));
		request.setAttribute("gradyear", updateprofileServlet.getGradyear(Email));
		request.setAttribute("email",Email);
		
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