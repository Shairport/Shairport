import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.tomcat.util.http.LegacyCookieProcessor;

import util.JDBCUtil;
/**
 * Servlet implementation class RegisterDispatcher
 */

@WebServlet("/register")
public class registerServlet extends HttpServlet {
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
    	
//    	Cookie[] cookies = request.getCookies();
//	  	for(Cookie cookie: cookies){
//		  	if(cookie.getName().equals("name")) {	
//	  			System.out.println(cookie.getName() + " " + cookie.getValue());
//		  		cookie.setMaxAge(0);
//		  		response.addCookie(cookie);
//		  	}
//	  	}
    	
    	boolean alreadySent = false;
    	String email = request.getParameter("newEmail");
    	String name = request.getParameter("newName");
    	String password = request.getParameter("newPassword");
    	String passwordConfirmed = request.getParameter("newPasswordConfirmed");
    	
    	
    	String regex = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" 
                + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(email);
        
        if(email.equals("")) {
        	error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> Please enter an email</div>";
        }
        else if(!m.matches()) {
        	error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> Email is not formatted correctly</div>";
        } 
        
        if(name.equals("")) {
        	error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> Please enter an name</div>";
        }
        
        if(password.equals("")) {
        	error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> Please enter a password</div>";
        }
        
        if(passwordConfirmed.equals("")) {
        	error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> Please confirm your password</div>";
        }
        if(!error.equals("")) {
        	alreadySent=true;
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("register.jsp").include(request, response);
        }
        

    	if(!password.equals(passwordConfirmed)) {
    		error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> Passwords are not equal</div>";
    	}
    	try {
	    	//Check if email already in use
	    	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect =JDBCUtil.getConnection();
	    	
	    	PreparedStatement ps2 = connect.prepareStatement("select * from users where email = ?");
			ps2.setString(1, email);
			ResultSet rs2 = ps2.executeQuery();
			if(rs2.next()) {
				error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\">Email already has an account</div>";
			}
			
			//Check if username already in use
	    	PreparedStatement ps3 = connect.prepareStatement("select * from users where username = ?");
			ps3.setString(1, name);
			ResultSet rs3 = ps3.executeQuery();
			if(rs3.next()) {
				error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\">Username is already in use, please pick another one</div>";
			}
    	}
    	catch(Exception e){
        	e.printStackTrace();
        }
    	
    	
    	
    	if(!alreadySent) {
	    	if (!error.equals("")) {
	    		request.setAttribute("error", error);
				request.getRequestDispatcher("register.jsp").include(request, response);
	    	}
			else
			{
	//	        RequestDispatcher dispatch = null;
		    	try {
		    		Class.forName("com.mysql.cj.jdbc.Driver");
		    		Connection connect =JDBCUtil.getConnection();
		    			PreparedStatement ps = connect.prepareStatement("insert into users(email,name,password) values(?,?,?)");
		        		ps.setString(1, email);
		        		ps.setString(2, name);
		        		ps.setString(3, passwordConfirmed);
		        		int rowCount = ps.executeUpdate();
	//	        		dispatch.forward(request, response);
		        		String cookieName = name.replace(" ", "&");
		        		
		        		Cookie cookie = new Cookie("Email", cookieName);
		        		cookie.setMaxAge(60*60*24);
		        		response.addCookie(cookie);
		        		
		        		response.sendRedirect("home.html");
	//	        		response.sendRedirect("Shairport/form.html");
	//	        		request.setAttribute("name", name);
	//	        		request.getRequestDispatcher("loggedIn.jsp").forward(request, response);
		        }
		        catch(Exception e){
		        	e.printStackTrace();
		        }
			}
    	}
    	
        
//    	PrintWriter pw = response.getWriter();
//    	pw.println(email);
//    	pw.println(name);
//    	pw.println(password);
//    	pw.println(passwordConfirmed);
        
    }