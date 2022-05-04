
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


@WebServlet("/updateprofileServlet")
public class updateprofileServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
   

    
     /* Default constructor.*/
     
    public updateprofileServlet() {
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
    	
    	
    	
    	
    	
    	String major = request.getParameter("major");
    	if (major == null) major = "";
    	
    	String gradyear = request.getParameter("gradyear");
    	if (gradyear == null) gradyear = "";
    	

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con= JDBCUtil.getConnection();
			
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS total FROM Shairport.additionalinfo where email = ?");
			ps.setString(1, Email);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt("total");
			if (count > 0) {
				PreparedStatement addinfo = con.prepareStatement("Delete from Shairport.additionalinfo where email = ?");
				addinfo.setString(1, Email);
				addinfo.executeUpdate();
			}
			PreparedStatement addinfo = con.prepareStatement("INSERT INTO SHAIRPORT.additionalinfo(email, gradyear, major) VALUES (?, ?, ?)");
			addinfo.setString(1, Email);
			addinfo.setString(2, gradyear);
			addinfo.setString(3, major);
			addinfo.executeUpdate();

			
		} catch(SQLException e) {
			System.out.println(e);
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);    			
		}

		ArrayList<Carpool> myCarpools = carpoolParser.getMyTickets(Email);
		request.setAttribute("myCarpools", myCarpools);
		request.setAttribute("name", TicketParser.getNamefromemail(Email));
		request.setAttribute("major", getMajor(Email));
		request.setAttribute("gradyear", getGradyear(Email));
		request.setAttribute("email",Email);
		request.setAttribute("phone",TicketParser.getPhonefromemail(Email));
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
    
    public static String getMajor(String email) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con= JDBCUtil.getConnection();

			PreparedStatement info = con.prepareStatement("SELECT * from SHAIRPORT.additionalinfo where email =?");
			info.setString(1, email);
			ResultSet rs = info.executeQuery();
			rs.next();
			
			return rs.getString("major");
			
			
		} catch(SQLException e) {
			System.out.println(e);
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);    			
		}
		return "";
    }
    public static String getGradyear(String email) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con= JDBCUtil.getConnection();

			PreparedStatement info = con.prepareStatement("SELECT * from SHAIRPORT.additionalinfo where email =?");
			info.setString(1, email);
			ResultSet rs = info.executeQuery();
			rs.next();
			return rs.getString("gradyear");
			
		} catch(SQLException e) {
			System.out.println(e);
		}
		catch(ClassNotFoundException e) {
			System.out.println(e);    			
		}
		return "";    	
    }
}