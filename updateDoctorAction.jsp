<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String id=request.getParameter("id");
    String fullname=request.getParameter("fullname");
    int age=Integer.parseInt(request.getParameter("age"));
    String age1=String.valueOf(age);
    String address=request.getParameter("address");
    String mobilenumber=request.getParameter("mobilenumber");
    String email=request.getParameter("email");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    
    try
    {
       Connection con=ConnectionProvider.getCon();
       Statement stmt=con.createStatement();
        stmt.executeUpdate("update doctor set fullname='"+fullname+"',age='"+age1+"',"
                + "address='"+address+"',mobilenumber='"+mobilenumber+"',"
                + "email='"+email+"',username='"+username+"',password='"+password+"' where id="+id+"");
        
       response.sendRedirect("editDeleteListDoctor.jsp?msg=valid");
    }
    catch(Exception e)
    {
         //response.sendRedirect("editDeleteListDoctor.jsp?msg=invalid");
        out.println(e);
    }
    
    
%>