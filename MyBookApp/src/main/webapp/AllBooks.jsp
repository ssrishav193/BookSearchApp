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
<title>All Books</title>
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
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        margin-top: 30px;
        color: #2c3e50;
    }

    nav {
        margin: 20px auto;
        text-align: center;
        background: #ffffffcc;
        padding: 12px 0;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        border-radius: 0 0 12px 12px;
    }

    nav a {
        margin: 0 12px;
        text-decoration: none;
        color: #007bff;
        font-weight: 600;
        padding: 8px 16px;
        border-radius: 5px;
        transition: background 0.3s;
    }

    nav a:hover {
        background-color: #007bff;
        color: white;
    }

    nav strong {
        margin: 0 10px;
        color: #2c3e50;
    }

    p.message {
        text-align: center;
        font-weight: bold;
        color: green;
        margin-top: 10px;
    }

    .book-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 20px;
        gap: 20px;
    }

    .book-card {
        background-color: white;
        width: 280px;
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        transition: transform 0.2s;
    }

    .book-card:hover {
        transform: translateY(-5px);
    }

    .book-card p {
        margin: 8px 0;
        font-size: 15px;
        color: #333;
    }

    .book-card b {
        color: #007bff;
    }

    .book-card form {
        margin-top: 15px;
        text-align: center;
    }

    .book-card button {
        padding: 8px 14px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .book-card button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <h1>My Book Web App</h1>

    <nav>
        <a href='AdminHome.jsp'>Home</a>
        Welcome: <strong><%= name %></strong>
        <a href='AllBooks.jsp'>All Books</a>
        <a href='Logout'>Logout</a>
    </nav>

    <%
        String n = (String) session.getAttribute("msg");
        if (n != null) {
    %>
        <p class="message"><%= n %></p>
    <%
            session.setAttribute("msg", null);
        }
    %>

    <div class="book-container">
    <%
        Session ses = HbUtility.getSessionFactory().openSession();
        List<Book> books = ses.createQuery("from Book", Book.class).list();
        ses.close();
        for (Book b : books) {
    %>
        <div class="book-card">
            <p><b>Name:</b> <%= b.getName() %></p>
            <p><b>Author:</b> <%= b.getAname() %></p>
            <form action="MoreBookDetails.jsp" method="post">
                <input type="hidden" name="name" value="<%= b.getName() %>">
                <button type="submit">More Details</button>
            </form>
        </div>
    <%
        }
    %>
    </div>
</body>
</html>
<%
}
%>
