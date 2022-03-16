<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
 <link href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'rel='stylesheet'>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script> 
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"],input[type="date"]
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
</div>    
    <%
        String msg=request.getParameter("msg");
        if("valid".equals(msg))
        {
            %>
            <script>
                alert("Appointment Registered! Valid Up To 2 Hours.");
            </script>
            <!--<center><font color="red" size="5">Appointment Registered</font></center>-->
            <%
        }%>
        <%
        
        if("invalid".equals(msg))
        {
            %>
            <script>
                alert("Appointment Not Registered! Please Try Again");
            </script>
            <!--<center><font color="red" size="5">Some thing went wrong ! Try Again !</font></center>-->
            <%
        }%>
            
 <%
    int id=1;
    try
    {
     Connection con=ConnectionProvider.getCon();
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select max(id) from patient");
     if(rs.first())
     {
         id=rs.getInt(1);
         id=id+1;
     }
     %>
    <div class="container">
         <h1 style="color:red;">Patient Id:<%out.println(id);%></h1>
     <%
    }
    catch(Exception e)
    {}

 %>
<br>
<div class="container">
    <form action="addnewPatitentAdminAction.jsp" method="post">
        <center><font color="lightgreay" size="5">Enter Patient Details</font></center>
        <input type="hidden" name="id" value="<%out.println(id);%>">
        <hr>
        <h2>Full Name</h2>
        <input type="text" placeholder="Enter Full Name" name="fullname" required>
        <hr>
        <h2>Age</h2>
        <input type="text" placeholder="Enter Age" name="age" required>
        <hr>
        <h2>Address</h2>
        <input type="text" placeholder="Enter Address" name="address" required>
        <hr>
        <h2>Mobile Number</h2>
        <input type="text" placeholder="Enter Mobile Number" name="mobilenumber" required>
        <hr>
        <h2>Date</h2>
        <input type="text" id="my_date_picker" name="date" required>      
        <script>
            $(function()
            {
                var minDate=new Date();
                $( "#my_date_picker" ).datepicker({
                dateFormat: 'yy-mm-dd',
                minDate:minDate,
                });
            });
        </script>
        <hr>
        <h2>Timing</h2>
        <select name="timing">
            <option value="11:00 AM">11:00 AM</option>
            <option value="11:30 AM">11:30 AM</option>
            <option value="2:00 PM">2:00 PM</option>
            <option value="2:30 PM">2:30 PM</option>
            <option value="3:00 PM">3:00 PM</option>
            <option value="4:00 PM">4:00 PM</option>
            <option value="6:00 PM">6:00 PM</option>
            <option value="6:30 PM">6:30 PM</option>
            <option value="7:00 PM">7:00 PM</option>
            <option value="7:30 PM">7:30 PM</option>
            <option value="8:00 PM">8:00 PM</option>
            <option value="8:30 PM">8:30 PM</option>
            <option value="9:00 PM">9:00 PM</option>
            <option value="9:30 PM">9:30 PM</option>
        </select>   
        <hr>
        <h2>Gender</h2>
        <select name="gender">
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Others">Others</option>
        </select>
        <hr>
        <h2>Email</h2>
        <input type="email" placeholder="Enter Email" name="email" required>
        <hr>
        <h2>Blood Group</h2>
        <select name="bloodgroup">
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
        </select>
        <hr>
        <h2>Specialist</h2>
        <select name="specialist">
            <option value="Dentist">Dentist</option>
            <option value="Gynaecologist">Gynaecologist</option>
            <option value="Dermatologist">Dermatologist</option>
            <option value="Cardiologist">Cardiologist</option>
        </select>
        <hr>
        <br>
        <center><button type="submit" class="button">Save</button></center>
    </form>
</div>
<br>
<br>
<br>
<br>
</body>
</html>