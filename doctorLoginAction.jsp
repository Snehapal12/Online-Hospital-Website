<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*;"%>
<%
 String username=request.getParameter("username");
 String password=request.getParameter("password");
 String specialist=request.getParameter("specialist");
 try
 {
     Connection con=ConnectionProvider.getCon();
     Statement stmt=con.createStatement();
     ResultSet rs=stmt.executeQuery("select * from doctor where username='"+username+"' and password='"+password+"' and specialist='"+specialist+"'");
     
     if(specialist.equals("Dentist"))
     {
       if(rs.next())
      {
            response.sendRedirect("viewPatientListDentist.jsp");
        }
        else
        {
            response.sendRedirect("DoctorLogin.jsp?msg=invalid");
        }
     }
     else if(specialist.equals("Cardiologist"))
     {
        if(rs.next())
        {
            response.sendRedirect("viewPatientListCardiologist.jsp");
        }
        else
        {
            response.sendRedirect("DoctorLogin.jsp?msg=invalid");
        }
     }     
     else if(specialist.equals("Gynaecologist"))
     {
        if(rs.next())
        {
            response.sendRedirect("viewPatientListGynaecologist.jsp");
        }
        else
        {
            response.sendRedirect("DoctorLogin.jsp?msg=invalid");
        }
     }
     else if(specialist.equals("Dermatologist"))
     {
       if(rs.next())
       {
            response.sendRedirect("viewPatientListDermatologist.jsp");
        }
        else
        {
           response.sendRedirect("DoctorLogin.jsp?msg=invalid");
       }
    }   
     
    }
 catch(Exception ex)
 {
     out.println(ex);
 }
%>