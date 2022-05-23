
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


@WebServlet("/editServlet")
public class editServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
   

    
     /* Default constructor.*/
     
    public editServlet() {
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
    	
		ArrayList<Carpool> myCarpools = carpoolParser.getMyTickets(Email);
		request.setAttribute("myCarpools", myCarpools);
		request.setAttribute("name", TicketParser.getNamefromemail(Email));
		request.setAttribute("major", updateprofileServlet.getMajor(Email));
		request.setAttribute("gradyear", updateprofileServlet.getGradyear(Email));
		request.setAttribute("email",Email);

		
		request.getRequestDispatcher("profile.jsp").forward(request, response);
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