<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String cust_id    = request.getParameter("cust_id");
String brand      = request.getParameter("brand");
String name       = request.getParameter("name");

out.println("<html>");
out.println("<head>");
out.println("<title>ALL CAR</title>");
out.println("<script>");

out.println("function search_cust_id()"
+"{"
+"cust_id = document.getElementById('cust_id').value;"
+"window.location.replace(all.jsp?)name=0&brand=0&cust_id='+cust_id);"
+ "}");
        
out.println("function search_name()"
+"{"
+"var name = document.getElementById('name').value;"        
+"window.location.replace('all.jsp?cust_id=0&brand=0&name='+name);"
+"}");

out.println("function search_brand()"
+"{"
+"var name = document.getElementById('name').value;"        
+"window.location.replace('all.jsp?cust_id=0&name=0&brand='+name);"
+"}");

out.println("</script>");
out.println("<link rel='stylesheet' type='text/css' href='mycss.css'>");
out.println("</head>");
out.println("<body>");
out.println("<div class='navbar'>"
+"<a href='home.jsp'>HOME</a>"
+"<a href='register.jsp'>Customer Registartion</a>"
+"<a href='newjsp.jsp'>"
+"KYC Details</a>"
+"<a href='book.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&cust_id=0'>"
+"Employment Details</a>"
+"<a href='all.jsp?brand=0&name=0'>ALL CAR</a>"
+"<a href='contact.jsp?vno=0'>"
+"CONTACT</a>"
+"</div>");
out.println("<br><br><br>");
out.println("<table>");
out.println("<tr>"
        + "<td colspan='2' align='center'>SEARCH PRODUCT"
        + "<input type='text' id='name' name='name'></td>"
        + "<td colspan='2' align='center'>"
        + "<a href='#' onclick='search_brand()'>SEARCH BRAND</a></td>"
        + "<td colspan='2' align='center'>"
        + "<a href='#' onclick='search_name()'>SEARCH NAME</a></td></tr>");
String sql="";

if(brand.equals("0"))
{
 sql="select * from vehicle_details where v_name like '%"+name+"%'";   
}
else if(name.equals("0"))
{
 sql="select * from vehicle_details where v_manu like '%"+brand+"%'";
}
else
{
  sql="select * from vehicle_details";
}

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
Statement stmt=con.createStatement();

//sql="select * from vehicle_details where v_manu like '%"+brand+"%'";
//out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
out.println("<tr><th colspan='3'>"
           +"<img src='"+rs.getString(3)+".jpg' height='250' width='500'></th></tr>");
out.println("<tr><th>Vehicle No</th><th>Vehicle Model</th><th>Vehicle Name</th><th>Manufacturer</th>"
        + "<th>Color</th><th>Price</th>"
        + "<th>no_seat</th></tr>");

out.println("<tr><td>"+Integer.toString(rs.getInt(1))+"<td>"+rs.getString(2)+"</td>"
        + "<td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td>"
        + "<td>"+rs.getString(6)+"</td>"
        + "<td>"+Integer.toString(rs.getInt(7))+"</td></tr>");
}
}
catch(Exception e)
{ out.print(e);}

out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>