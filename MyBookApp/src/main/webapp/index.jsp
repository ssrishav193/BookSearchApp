<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Book Web App</title>
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
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h1 {
        margin-top: 40px;
        color: #2c3e50;
        font-size: 36px;
    }

    nav {
        margin: 20px 0;
    }

    nav a {
        margin: 0 15px;
        text-decoration: none;
        color: #007bff;
        font-weight: 600;
        padding: 8px 16px;
        border-radius: 6px;
        transition: background 0.3s, color 0.3s;
    }

    nav a:hover {
        background-color: #007bff;
        color: white;
    }

    form {
        background: #ffffff;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        width: 320px;
    }

    label {
        font-weight: 600;
        display: block;
        margin-bottom: 8px;
        color: #333;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        margin-bottom: 20px;
        box-sizing: border-box;
        transition: border 0.3s;
    }

    input[type="text"]:focus {
        border-color: #007bff;
        outline: none;
    }

    button {
        width: 100%;
        padding: 10px;
        background: #007bff;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s;
    }

    button:hover {
        background: #0056b3;
    }

    p {
        color: green;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
    }
</style>
</head>
<body>
    <h1>My Book Web App</h1>
    <nav>
        <a href='index.jsp'>Home</a>
        <a href='admin-login.jsp'>Login</a>
    </nav>

    <%
        String n = (String) session.getAttribute("msg");
        if (n != null) {
    %>
        <p><%=n%></p>
    <%
        session.setAttribute("msg", null);
        }
    %>

    <form action="SearchBook" method="post">
        <label for="name">Book Name:</label>
        <input type="text" name="name" id="name" required />
        <button type="submit">Search Book</button>
    </form>
</body>
</html>
