<%-- 
    Document   : login
    Created on : Jul 22, 2019, 8:48:56 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Processing</title>
<link rel="stylesheet" type="text/css" href="mycss.css">
    </head>
    <body>
<%
    String uname=request.getParameter("user");
    String pass=request.getParameter("pass");
    try
    {
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/priya","root","");
      Statement stmt=con.createStatement();                
      ResultSet rs=stmt.executeQuery("select * from login where username='"+uname+"' and password='"+pass+"'");
      if(rs.next())
        {  
            out.println("Login Successfull");
%>
<script type="text/javascript">
            alert('Login Successfull');
            window.location = "home.jsp";
</script>
<% 
    /* response.sendRedirect("home.jsp");*/
        }
      else
        {  
           out.println("Login Failed");
%>
<script type="text/javascript">
            alert('Login Failed');
            window.location = "index.html";
</script>
<%        
        }
      con.close();
     }
     catch(Exception e)
     { out.println(e); }
%>
    </body>
</html>