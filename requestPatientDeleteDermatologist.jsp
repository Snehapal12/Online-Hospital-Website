<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String mobilenumber=request.getParameter("mobilenumber");
    try
    {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        st.executeUpdate("delete from patient where mobilenumber='"+mobilenumber+"' and specialist='Dermatologist'");
        response.sendRedirect("viewPatientListDermatologist.jsp");
    }
    catch(Exception e)
    {
       response.sendRedirect("viewPatientListDermatologist.jsp"); 
    }
%>