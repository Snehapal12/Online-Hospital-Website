<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>
<%@page import="Project.ConnectionProvider;"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>About Us</title>
        <link rel="stylesheet" href="style.css" type="text/css" media="screen">
        <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <style>
        .card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 20%;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}
</style>
    </head>
    <body>
        <div class="header">
        <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
        <div class="header-right">
        <a href="index.jsp">Home</a>
        <a href="adminLogin.jsp">Admin Login</a>
        <a href="DoctorLogin.jsp">Doctor Login</a>
        <a href="addnewPatitent.jsp">Patient Appointment</a>
        <a class="active" href="about.jsp">About Us</a>
  </div>
</div>
    <center>
        <h3>About Us</h3>
        <hr style="width:150px; border: 1.5px solid;">        
        <h1 style="font-family: 'Lobster', cursive; color:orange;">Our Specialist To Help You In Fast Recovery...</h1>
            <%
                try
                {
                  Connection con=ConnectionProvider.getCon();
                  Statement st=con.createStatement();
                  ResultSet rs=st.executeQuery("select * from doctor");
                  while(rs.next())
                  {
                      
            %>
            <br>
           <div class="card">
            <img src="img_avatar.png" alt="Avatar" style="width:100%;height:200px">
            <div class="container">
            <h4><b><%=rs.getString(2)%></b></h4> 
            <p>Specialist:&nbsp;<%=rs.getString(10)%></p>
            <p>Age:&nbsp;<%=rs.getString(3)%></p>
            <p>Date:&nbsp;<%=rs.getString(6)%></p>
            <p>Gender:&nbsp;<%=rs.getString(7)%></p>
            </div>
            </div> 
            <br>
            <%
                  }
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
                
            %>
       
    
    </center>
    </body>
</html>
