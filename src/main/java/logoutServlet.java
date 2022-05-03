import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;
import java.util.concurrent.TimeUnit;


@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	
	@Serial
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // delete cookies because they logged out
    	Cookie ck[] = request.getCookies();
    	for(int i=0;i<ck.length;i++){  
    		if (ck[i].getName().contentEquals("Email") 
    				||ck[i].getName().contentEquals("GEmail"))
    		{
    			ck[i].setValue("");
    			ck[i].setMaxAge(0);
    			response.addCookie(ck[i]);
    		}
    	} 
    	// go back to index page
    	try {
			TimeUnit.SECONDS.sleep(1);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//    	request.getRequestDispatcher("mellhome.jsp").include(request, response);
    	response.sendRedirect(request.getContextPath() + "/mellhome.jsp");
    	
    }

    /**
     * @throws ServletException 
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }

}