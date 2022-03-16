<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String mobilenumber=request.getParameter("mobilenumber");
    try
    {
        Connection con=ConnectionProvider.getCon();
        Statement stmt=con.createStatement();
        stmt.executeUpdate("update patient set status='completed' where mobilenumber='"+mobilenumber+"' and specialist='Dentist'");
        
        response.sendRedirect("viewPatientListDentist.jsp");
    }
    catch(Exception e)
    {
       response.sendRedirect("viewPatientListDentist.jsp"); 
    }
%>