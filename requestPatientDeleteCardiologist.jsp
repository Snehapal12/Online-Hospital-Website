<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String mobilenumber=request.getParameter("mobilenumber");
    try
    {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        st.executeUpdate("delete from patient where mobilenumber='"+mobilenumber+"' and specialist='Cardiologist'");
        response.sendRedirect("viewPatientListCardiologist.jsp");
    }
    catch(Exception e)
    {
       response.sendRedirect("viewPatientListCardiologist.jsp"); 
    }
%>