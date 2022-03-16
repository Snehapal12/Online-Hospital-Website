<%@page import="Project.ConnectionProvider;"%>
<%@page import="java.sql.*;"%>
<%@page import="java.util.Date;"%>
<%
    String id=request.getParameter("id");
    String fullname=request.getParameter("fullname");
    int age=Integer.parseInt(request.getParameter("age"));
    String age1=String.valueOf(age);
    String address=request.getParameter("address");
    String mobilenumber=request.getParameter("mobilenumber");
    String date=request.getParameter("date");
    String timing=request.getParameter("timing");
    String gender=request.getParameter("gender");
    String email=request.getParameter("email");
    String bloodgroup=request.getParameter("bloodgroup"); 
    String specialist=request.getParameter("specialist");
    String status="pending";
    try
    {
        Connection con=ConnectionProvider.getCon();
        Statement stmt=con.createStatement();
        stmt.executeUpdate("insert into patient values("+id+",'"+fullname+"','"+age1+"',"
                + "'"+address+"','"+mobilenumber+"','"+date+"','"+timing+"','"+gender+"',"
                + "'"+email+"','"+bloodgroup+"','"+specialist+"','"+status+"')");
        response.sendRedirect("addnewPatitentAdmin.jsp?msg=valid");
    }
    catch(Exception e)
    {
        response.sendRedirect("addnewPatitentAdmin.jsp?msg=invalid");
        //out.println(e);
    }
%>