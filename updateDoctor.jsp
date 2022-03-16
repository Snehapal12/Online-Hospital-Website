<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>
<%
    String id=request.getParameter("id");
    try
    {
        Connection con= ConnectionProvider.getCon();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from doctor where id="+id+"");
        while(rs.next())
        {
%>
<div class="container">
    <form action="updateDoctorAction.jsp" metho="post">
        <input type="hidden" name="id" value="<%out.println(id);%>">
        <h2>Full Name</h2>
        <input type="text" value="<%=rs.getString(2)%>" name="fullname">
        <hr>
        <h2>Age</h2>
        <input type="text" value="<%=rs.getString(3)%>" name="age">
        <hr>
        <h2>Address</h2>
        <input type="text" value="<%=rs.getString(4)%>" name="address">
        <hr>
        <h2>Mobile Number</h2>
        <input type="number" value="<%=rs.getString(5)%>" name="mobilenumber">
        <hr>
        <h2>Email</h2>
        <input type="email" value="<%=rs.getString(8)%>" name="email">        
        <hr>   
        <h2>UserName</h2>
        <input type="text" value="<%=rs.getString(11)%>" name="username">
        <br>
        <hr>
        <h2>Password</h2>
        <input type="password" value="<%=rs.getString(12)%>" name="password">
        <hr>
        <center><button type="submit" class="button">Save</button></center>
    </form>
</div>
<%
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>
<br>
<br>
<br>
<br>
</body>
</html>