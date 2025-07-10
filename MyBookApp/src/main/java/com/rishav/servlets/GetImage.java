package com.rishav.servlets;

import java.io.IOException;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.rishav.hibernate.Book;
import com.rishav.hibernate.HbUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class SearchBook
 */
@WebServlet("/GetImage")
public class GetImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public GetImage() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		Session ses=HbUtility.getSessionFactory().openSession();
		Book b=ses.get(Book.class, name);
		byte[] image=b.getImage();
		response.getOutputStream().write(image);
			
	}
}
