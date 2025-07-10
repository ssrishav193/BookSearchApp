package com.rishav.servlets;

import java.io.IOException;
import org.hibernate.Session;

import com.rishav.hibernate.HbUtility;
import com.rishav.hibernate.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchBook
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		Session ses=HbUtility.getSessionFactory().openSession();
		Login login=ses.get(Login.class, id);
		HttpSession session=request.getSession();
		if(login==null) {
			session.setAttribute("msg", "Invalid Credentials!");
			response.sendRedirect("index.jsp");
		}else {
			if(password.equals(login.getPassword())) {
				session.setAttribute("name", login.getName());
				response.sendRedirect("AdminHome.jsp");
			}else {
				session.setAttribute("msg", "Invalid Credentials!");
				response.sendRedirect("index.jsp");
			}
		}
		
		
		
	}

}
