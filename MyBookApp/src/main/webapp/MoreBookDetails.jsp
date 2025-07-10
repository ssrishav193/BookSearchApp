<%@page import="com.rishav.hibernate.HbUtility"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.rishav.hibernate.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = (String) session.getAttribute("name");
  if (name == null) {
      session.setAttribute("msg", "Please Login First!");
      response.sendRedirect("admin-login.jsp");
  } else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<link rel="shortcut icon" href="bookIcon.png" type="image/x-icon">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(rgba(223, 207, 186, 0.625), 
    rgba(213, 192, 218, 0.6), rgba(212, 142, 142, 0.498)), url("https://cdn.pixabay.com/photo/2015/09/10/09/50/library-934285_1280.jpg");
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
        padding: 30px;
        margin: 0;
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 20px;
    }

    nav {
        text-align: center;
        background-color: #ffffffcc;
        padding: 12px 0;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        border-radius: 0 0 12px 12px;
        margin-bottom: 30px;
    }

    nav a {
        margin: 0 12px;
        text-decoration: none;
        color: #007bff;
        font-weight: 600;
        padding: 6px 14px;
        border-radius: 5px;
        transition: background 0.3s;
    }

    nav a:hover {
        background-color: #007bff;
        color: white;
    }

    nav strong {
        margin-left: 10px;
        color: #2c3e50;
    }

    .book-card {
        background-color: #fff;
        padding: 25px;
        margin: auto;
        margin-top: 30px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        border-radius: 12px;
        max-width: 450px;
        text-align: center;
    }

    .book-card img {
        height: 150px;
        border-radius: 8px;
        margin-bottom: 15px;
    }

    .book-card p {
        margin: 10px 0;
        font-size: 16px;
        color: #333;
    }

    .book-card b {
        color: #007bff;
    }

    .book-card form {
        margin-top: 20px;
    }

    .book-card button {
        background-color: #e74c3c;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: bold;
        transition: background 0.3s ease;
    }

    .book-card button:hover {
        background-color: #c0392b;
    }

    .error {
        color: red;
        text-align: center;
    }
</style>
</head>
<body>
    <h1>My Book Web App</h1>
    <nav>
        <a href='AdminHome.jsp'>Home</a>
        <a href='AllBooks.jsp'>All Books</a>
        <a href='Logout'>Logout</a>
        <strong>Welcome: <%= name %></strong>
    </nav>

    <%
        String n = request.getParameter("name");
        Session ses = HbUtility.getSessionFactory().openSession();
        Book b = ses.get(Book.class, n);
        ses.close();

        if (b != null) {
    %>
    <div class="book-card">
        <%
            if (b.getImage() != null && b.getImage().length != 0) {
        %>
           <img src="GetImage?name=<%= b.getName() %>" alt="Book Image" />
        <% 
           } else {  
        %>
           <img src="book.png" alt="Default Book" />
        <%
           }
        %>
        <p><b>Name:</b> <%= b.getName() %></p>
        <p><b>Author:</b> <%= b.getAname() %></p>
        <p><b>Publisher:</b> <%= b.getPname() %></p>
        <p><b>Price:</b> ₹<%= b.getPrice() %></p>
        <form action="DeleteBook" method="post">
            <input type="hidden" name="name" value="<%= b.getName() %>" />
            <button>Delete Book</button>
        </form>
    </div>
    <%
        } else {
    %>
    <div class="book-card">
        <p class="error">Book not found with name: <b><%= n %></b></p>
    </div>
    <%
        }
    %>
</body>
</html>
<%
  }
%>
