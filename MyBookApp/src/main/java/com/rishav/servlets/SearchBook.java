package com.rishav.servlets;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import com.rishav.hibernate.Book;
import com.rishav.hibernate.HbUtility;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchBook
 */
@WebServlet("/SearchBook")
public class SearchBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SearchBook() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		Session ses=HbUtility.getSessionFactory().openSession();
		List<Book> books=ses.createQuery("select b from Book b where b.name like :name",Book.class)
		.setParameter("name", "%"+name+"%")
		.list();
		ses.close();
		HttpSession session=request.getSession();		
		if(books.isEmpty()) {
			session.setAttribute("msg", "Book not Found!");
			response.sendRedirect("index.jsp");
		}else {
			request.setAttribute("books", books);
			RequestDispatcher rd = request.getRequestDispatcher("BookDetails.jsp");
			rd.forward(request, response);
		}
		
	}

}
