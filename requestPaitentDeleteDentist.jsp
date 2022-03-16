<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String mobilenumber=request.getParameter("mobilenumber");
    try
    {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        st.executeUpdate("delete from patient where mobilenumber='"+mobilenumber+"' and specialist='Dentist'");
        response.sendRedirect("viewPatientListDentist.jsp");
    }
    catch(Exception e)
    {
       response.sendRedirect("viewPatientListDentist.jsp"); 
    }
%>