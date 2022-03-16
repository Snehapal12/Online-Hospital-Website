<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<br> 
<img width="120" height="100" src="Logo2.PNG">
<center>    
    <h2>Online Patient Appointment</h2>
    <table border="1">
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
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
                  Statement st=con.createStatement();
                  ResultSet rs=st.executeQuery("select * from patient where date between '"+date+"' and '"+date1+"' and status='completed' order by date");
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


