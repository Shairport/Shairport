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

@WebServlet("/google")
public class googleServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
//        doGet(request, response);
    	doGet(request,response);
    	
    }
    
    
    
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
//        doGet(request, response);
    	try {
    		
    		
    		System.out.print("WE MADE IT HERE");
    		System.out.print("WE MADE IT HERE");
    		System.out.print("WE MADE IT HERE");
    	
    	String name = "";
    	String email = "";
    	
    	Cookie[] cookies = request.getCookies();
	  	for(Cookie cookie: cookies){
		  	if(cookie.getName().equals("Name")) {	
	  			name = cookie.getValue();
		  	}
		  	if(cookie.getName().equals("Email")) {	
	  			email = cookie.getValue();
		  	}
	  	}
    	
	  	
	    	//Check if email already in use
	    	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect =JDBCUtil.getConnection();
	    	
	    	PreparedStatement ps2 = connect.prepareStatement("select * from users where email = ?");
			ps2.setString(1, email);
			ResultSet rs2 = ps2.executeQuery();
			if(rs2.next()) {
				response.sendRedirect("mellhome.jsp");
			}
			else {
				PreparedStatement ps = connect.prepareStatement("insert into users(email,name,password) values(?,?,?)");
        		ps.setString(1, email);
        		ps.setString(2, name);
        		ps.setString(3, "GOOGLE LOGIN");
        		int rowCount = ps.executeUpdate();
        		response.sendRedirect("mellhome.jsp");
			}
			
			//Check if username already in use
    	}
    	catch(Exception e){
        	e.printStackTrace();
        }
	  	
        
    }
}