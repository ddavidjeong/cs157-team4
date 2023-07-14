package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.userBean;
import sql.login;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/loginPage/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("userid");
		String email = request.getParameter("Email");
		
		login login = new login();
		userBean userInfo = login.check(user_id, email);
		
		if(userInfo.isLogin_flag()) {
			//if login successfully, go to tenant or landlord page
			System.out.println("Login Sucessfully");
			HttpSession session = request.getSession(); //pass the userInfo class to next page
			session.setAttribute("userInfo", userInfo);
			RequestDispatcher dispatcher =
					request.getRequestDispatcher("WEB-INF/loginPage/tenant_or_landlord.jsp");
			dispatcher.forward(request, response);
		} else {
			// if login fail, go login page again
			System.out.println("Login Failed");
			RequestDispatcher dispatcher =
					request.getRequestDispatcher("WEB-INF/loginPage/login.jsp");
			dispatcher.forward(request, response);
		}
	}
	

}
