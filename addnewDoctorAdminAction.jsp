<%@page import="Project.ConnectionProvider;"%>
<%@page import="java.sql.*;"%>
<%@page import="java.util.Date"%>

<%
    String id=request.getParameter("id");
    String fullname=request.getParameter("fullname");
    int age=Integer.parseInt(request.getParameter("age"));
    String age1=String.valueOf(age);
    String address=request.getParameter("address");
    String mobilenumber=request.getParameter("mobilenumber");
    String date=request.getParameter("date");
    String gender=request.getParameter("gender");
    String email=request.getParameter("email");
    String bloodgroup=request.getParameter("bloodgroup"); 
    String specialist=request.getParameter("specialist"); 
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    try
    {
        Connection con=ConnectionProvider.getCon();
        Statement stmt=con.createStatement();
        stmt.executeUpdate("insert into doctor values('"+id+"','"+fullname+"','"+age1+"',"
                + "'"+address+"','"+mobilenumber+"','"+date+"','"+gender+"',"
                + "'"+email+"','"+bloodgroup+"','"+specialist+"','"+username+"','"+password+"')");
        response.sendRedirect("addnewDoctorAdmin.jsp?msg=valid");
    }
    catch(Exception e)
    {
        response.sendRedirect("addnewDoctorAdmin.jsp?msg=invalid");
        //out.println(e);
    }
%>