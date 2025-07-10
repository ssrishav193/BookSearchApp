package com.rishav.servlets;

import java.io.IOException;

import org.apache.tomcat.jakartaee.commons.io.IOUtils;
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
@WebServlet("/AddBook")
@MultipartConfig
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddBook() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String aname=request.getParameter("aname");
		String pname=request.getParameter("pname");		
		int price=Integer.parseInt(request.getParameter("price"));
		

		byte[] image=null;
		Part p=request.getPart("image");
		image = IOUtils.toByteArray(p.getInputStream());
		if(image.length==0) {
			image=null;
		}
		HttpSession session=request.getSession();
		if(image != null && image.length > 2*1000*1000) {
			session.setAttribute("msg", "File Size exceed 2MB!");
		}else {
			if (image != null && image.length == 0) {
			        image = null;
			    }
			
			Book book = new Book();
			book.setName(name);
			book.setAname(aname);
			book.setPname(pname);
			book.setPrice(price);
			book.setImage(image);
			
			Session ses=HbUtility.getSessionFactory().openSession();
			Book b=ses.get(Book.class, name);
			
			if(b==null) {
				Transaction tx=ses.beginTransaction();
				ses.persist(book);
				tx.commit();
				ses.close();
				session.setAttribute("msg", "Book Added Successfully!");
			}else {
				session.setAttribute("msg", "Book Already Exist!");
			}
		}
		
			
		
		
		response.sendRedirect("AdminHome.jsp");		
	}

}
