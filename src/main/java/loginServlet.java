import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.JDBCUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.*;

/**
 * Servlet implementation class RegisterDispatcher
 */

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    

    /**
     * Default constructor.
     */
   

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
   
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
//        doGet(request, response);
    	String error = "";
    	boolean alreadySent = false;
    	
//    	Cookie[] cookies = request.getCookies();
//	  	for(Cookie cookie: cookies){
//		  	if(cookie.getName().equals("name")) {	
//	  			System.out.println(cookie.getName() + " " + cookie.getValue());
//		  		cookie.setMaxAge(0);
//		  		response.addCookie(cookie);
//		  	}
//	  	}
    	
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	
    	
    	
    	
        
        String regex = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" 
                + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";

        Pattern p = Pattern.compile(regex);
 
        // Find match between given string
        // and regular expression
        // uSing Pattern.matcher()
 
        Matcher m = p.matcher(email);
 
        // Return if the string
        // matched the ReGex
        
       
        if(email.equals("")) {
        	alreadySent = true;
        	error += " <div style=\"color:white; font-size:15px; background-color: #984dfa; width:100%; height:30px; text-align: center;\"> Please enter an email</div>";
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("register2.0.jsp").include(request, response);
        }
        
        else if(!m.matches() && !alreadySent) {
        	alreadySent = true;
        	error += " <div style=\"color:white; font-size:15px; background-color: #984dfa; width:100%; height:30px; text-align: center;\"> Email is not formatted correctly</div>";
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("register2.0.jsp").include(request, response);
        } 
        else
        {
        	 if(password.equals("") && !alreadySent) {
             	alreadySent = true;
        		 error += " <div style=\"color:white; font-size:15px; background-color: #984dfa; width:100%; height:30px; text-align: center;\"> Please enter a password</div>";
             	request.setAttribute("error", error);
             	request.getRequestDispatcher("register2.0.jsp").include(request, response);
             }
    	
	        RequestDispatcher dispatch = null;
	    	try {
		    		Class.forName("com.mysql.cj.jdbc.Driver");
					Connection connect = new JDBCUtil().getConnection();
					
					PreparedStatement ps = connect.prepareStatement("select * from users where email = ? and password = ?");
					ps.setString(1, email);
	        		ps.setString(2, password);
	        		
	        		ResultSet rs = ps.executeQuery();
	        		if(rs.next()) {
	        			String cookie_email = rs.getString("email");
	        			String cookieName = cookie_email.replace(" ", "&");
		        		
		        		Cookie cookie = new Cookie("Email", cookieName);
		        		cookie.setMaxAge(60*60*24);
		        		response.addCookie(cookie);
	
	        		}
	        		else {
	        			PreparedStatement ps2 = connect.prepareStatement("select * from users where email = ?");
						ps2.setString(1, email);
						ResultSet rs2 = ps2.executeQuery();
						if(rs2.next()) {
							error += " <div style=\"color:white; font-size:15px; background-color: #984dfa; width:100%; height:30px; text-align: center;\">Incorrect Password</div>";
						}
						else {
							error += " <div style=\"color:white; font-size:15px; background-color: #984dfa; width:100%; height:30px; text-align: center;\"> User does not exist</div>";
						}
	        		}
					
	        		
	        		if (!error.equals("")) {
		            	if(!alreadySent) {	
		            		request.setAttribute("error", error);
		        			request.getRequestDispatcher("register2.0.jsp").include(request, response);
		            	}
	            	}
	        		else {
		        		response.sendRedirect("home.html");
	        		}
	        		
	        }
	        catch(Exception e){
	        	e.printStackTrace();
	        }
        }
	}
}