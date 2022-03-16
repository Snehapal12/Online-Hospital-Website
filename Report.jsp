<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
    <title>Report</title>
        <link href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'rel='stylesheet'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
<style>
input[type="text"]
{
    border: none;
    background:silver;
    height: 45px;
    font-size: 16px;
	padding:15px;
	width:18%;	
	border-radius: 25px;
	
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>  
    <br>
<form action="Invoice.jsp" method="post">
    <center>
      <input type="text" id="my_date_picker" name="date" placeholder="Choose Start Date..."required>      
        <script>
            $(function()
            {                
                $( "#my_date_picker" ).datepicker({
                dateFormat: 'yy-mm-dd',                
                });
            });
        </script>
        <input type="text" id="my_date_picker1" name="date1" placeholder="Choose End Date..." required>
        <script>
            $(function()
            {
                $( "#my_date_picker1" ).datepicker({
                dateFormat: 'yy-mm-dd',                 
                });
            });
        </script>
        <button type="submit" class="button">Print</button> 
    </center>
    <hr>
    <hr>
    <center>
    <table id="customers">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Age</th>
            <th>Address</th>
            <th>Mobile Number</th>
            <th>Date</th>
            <th>Timing</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Blood Group</th>
            <th>Specialist</th>            
        </tr>
        <tr>
            <%
                String date=request.getParameter("date");               
                String date1=request.getParameter("date1");           
                try
                {
                  Connection con=ConnectionProvider.getCon();
                  Statement st=con.createStatement();
                  String data;                  
                  if(date!=null && date1!=null)
                  {
                     data="select * from patient where date between '"+date+"' and '"+date1+"' and status='completed' order by date";                     
                  }
                  else
                  {
                     data="select * from patient where status='completed'"; 
                  }
                  ResultSet rs=st.executeQuery(data);
                  while(rs.next())
                  {
                      
            %>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
            <td><%=rs.getString(9)%></td>
            <td><%=rs.getString(10)%></td>
            <td><%=rs.getString(11)%></td>            
            </tr>
            <%
                  }
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
                
            %>
       
    </table>
            
</center>
</form> 
</body>
</html>
