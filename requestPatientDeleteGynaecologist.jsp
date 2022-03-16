<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String mobilenumber=request.getParameter("mobilenumber");
    try
    {
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        st.executeUpdate("delete from patient where mobilenumber='"+mobilenumber+"' and specialist='Gynaecologist'");
        response.sendRedirect("viewPatientListGynaecologist.jsp");
    }
    catch(Exception e)
    {
       response.sendRedirect("viewPatientListGynaecologist.jsp"); 
    }
%>