

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class directToTickets
 */
@WebServlet("/directToTickets")
public class directToTickets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public directToTickets() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Cookie ck[] = request.getCookies();
    	String email="";
    	for(int i=0;i<ck.length;i++){  
    		if (ck[i].getName().contentEquals("Email") 
    				||ck[i].getName().contentEquals("GEmail"))
    		{
    			email = ck[i].getValue();
    		}
    	} 		
		ArrayList<Carpool> myCarpools = carpoolParser.getMyTickets(email);
		request.setAttribute("myCarpools", myCarpools);
		request.setAttribute("name", TicketParser.getNamefromemail(email));
		request.setAttribute("major", updateprofileServlet.getMajor(email));
		request.setAttribute("gradyear", updateprofileServlet.getGradyear(email));
		request.setAttribute("email",email);
		request.setAttribute("phone",TicketParser.getPhonefromemail(email));
		request.getRequestDispatcher("myticket.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}