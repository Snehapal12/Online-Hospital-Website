<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*;"%>
<%
 String username=request.getParameter("username");
 String password=request.getParameter("password");
 try
 {
      Connection con=ConnectionProvider.getCon();
      Statement stmt=con.createStatement();
      ResultSet rs=stmt.executeQuery("select * from admin where username='"+username+"' and password='"+password+"'");
      if(rs.next())
      {
        response.sendRedirect("home.jsp");
      }
      else
      {
           response.sendRedirect("adminLogin.jsp?msg=invalid");
      }      
     
 }
 catch(Exception ex)
 {
    out.println(ex);
 }
%>