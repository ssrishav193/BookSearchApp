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
<title>Admin Home</title>
<link rel="shortcut icon" href="bookIcon.png" type="image/x-icon">
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(rgba(223, 207, 186, 0.625), 
    rgba(213, 192, 218, 0.6), rgba(212, 142, 142, 0.498)), url("https://cdn.pixabay.com/photo/2015/09/10/09/50/library-934285_1280.jpg");
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
        min-height: 100vh;
    }

    h1 {
        text-align: center;
        padding-top: 30px;
        font-size: 36px;
        color: #2c3e50;
    }

    nav {
        margin-top: 20px;
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
        padding: 6px 14px;
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

    h2 {
        text-align: center;
        margin: 25px 0 10px;
        color: #333;
    }

    form {
        background-color: #fff;
        max-width: 450px;
        margin: auto;
        padding: 25px 30px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    label {
        font-weight: 600;
        margin-top: 10px;
        display: block;
        color: #333;
    }

    input[type="text"],
    input[type="number"],
    input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 15px;
        border-radius: 8px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        transition: border 0.3s;
    }

    input:focus {
        border-color: #007bff;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s;
    }

    button:hover {
        background-color: #0056b3;
    }

    p {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-top: 15px;
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
        <p><%= n %></p>
    <%
            session.setAttribute("msg", null);
        }
    %>

    <h2>Add New Book</h2>
    <form action="AddBook" method="post" enctype="multipart/form-data">
        <label for="name">Book Name:</label>
        <input type="text" name="name" id="name" required />

        <label for="aname">Author Name:</label>
        <input type="text" name="aname" id="aname" />

        <label for="pname">Publisher Name:</label>
        <input type="text" name="pname" id="pname" />

        <label for="price">Price:</label>
        <input type="number" name="price" id="price" required />

        <label for="image">Front Cover:</label>
        <input type="file" name="image" id="image" accept=".jpg,.png" />

        <button type="submit">Add Book</button>
    </form>
</body>
</html>
<%
}
%>
