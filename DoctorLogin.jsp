<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"],select,input[type="submit"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}
</style>
</head>
<body>
<div class="header">
  <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a href="adminLogin.jsp">Admin Login</a>
    <a class="active" href="DoctorLogin.jsp">Doctor Login</a>
    <a href="addnewPatitent.jsp">Patient Appointment</a>
    <a href="about.jsp">About Us</a>
  </div>
</div>
<body>
<div class="container">
<br>
	<br>
        <%
            String msg=request.getParameter("msg");
            if("invalid".equals(msg))
            {
        %>
        <center><font color="red" size="5">Something Went Wrong ! Try Again !</font></center>
        <%
            }
        %>             
        
        <form action="doctorLoginAction.jsp" method="post">          
            <div class="form-group">
                <center><h2>Username</h2></center>
                <input type="text" placeholder="Enter Username" name="username" required>
                <center><h2>Password</h2></center>
                <input type="password" placeholder="Enter Password" name="password" required> 
                <center><h2>Specialist</h2></center>
                <select name="specialist">
                    <option value="Dentist">Dentist</option>
                    <option value="Gynaecologist">Gynaecologist</option>                    
                    <option value="Cardiologist">Cardiologist</option>
                    <option value="Dermatologist">Dermatologist</option>          	

                </select>
                <center><button type="submit" class="button">Submit</button></center>
        </form>	
</div>             
<br>
<br>
<br>
<br>
</body>
</html>
