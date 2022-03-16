<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String id=request.getParameter("id");
    try
    {
      Connection con=ConnectionProvider.getCon();
      Statement st=con.createStatement();
      st.executeUpdate("delete from doctor where id="+id+"");
      response.sendRedirect("editDeleteListDoctor.jsp?msg=deleted");
      
    }
    catch(Exception e)
    {
      response.sendRedirect("editDeleteListDoctor.jsp?msg=invalid");  
    }
%>