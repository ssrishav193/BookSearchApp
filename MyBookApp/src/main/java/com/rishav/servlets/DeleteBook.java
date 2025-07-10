package com.rishav.servlets;

import java.io.IOException;

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

/**
 * Servlet implementation class SearchBook
 */
@WebServlet("/DeleteBook")
@MultipartConfig
public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DeleteBook() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		Session ses=HbUtility.getSessionFactory().openSession();
		Book b=ses.get(Book.class, name);
		HttpSession session=request.getSession();
		if(b==null) {
			session.setAttribute("msg","Book NOT Found to Delete!");
			
		}else {
			Transaction tx=ses.beginTransaction();
			ses.remove(b);
			tx.commit();
			ses.close();
			session.setAttribute("msg", "Book Deleted Successfully!");
		}	
		response.sendRedirect("AllBooks.jsp");		
	}

}
