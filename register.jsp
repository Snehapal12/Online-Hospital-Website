<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String cust_id    = request.getParameter("cust_id");
String fname     = request.getParameter("fname");
String mname      = request.getParameter("mname");
String lname      = request.getParameter("lname");
String address    = request.getParameter("address");
String phone      = request.getParameter("phone");
String adhaar_no  = request.getParameter("adhaar_no");
String district   = request.getParameter("district");
String pin_code     = request.getParameter("pin_code");
String esic_no     = request.getParameter("esic_no");
String city      = request.getParameter("city");
String gender     = request.getParameter("gender");
String state     =request.getParameter("state");
String date_birth = request.getParameter("date_birth");
String uan_no = request.getParameter("uan_no");

String opn = request.getParameter("opn");
String opi = request.getParameter("opi");
String opu = request.getParameter("opu");
String opd = request.getParameter("opd");
String ops = request.getParameter("ops");
String op="0";
String sql="";
        
try
{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
 Statement stmt=con.createStatement();

if(opn.equals("n"))
{
op="n";
sql="select max(cust_id)+1 from customer_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  cust_id=Integer.toString(rs.getInt(1));
}
response.sendRedirect("register.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&cust_id="+cust_id+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into customer_details values("
        + ""+cust_id+",'"+fname+"','"+mname+"','"+uan_no+"',"
        + "'"+lname+"','"+address+"','"+phone+"','"+date_birth+"',"
        + "'"+adhaar_no+"','"+district+"','"+pin_code+"','"+esic_no+"',"
        + "'"+city+"','"+state+"','"+gender+"')";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Inserted')");
out.println("</script>");
out.println(" Record Inserted ");
}
else if(opu.equals("u"))
{
op="u";
sql="update customer_details set "
        + "fname='"+fname+"',mname='"+mname+"',lname='"+lname+"',uan_no='"+uan_no+"'"
        + ",address='"+address+"',phone='"+phone+"',adhaar_no='"+adhaar_no+"',esic_no='"+esic_no+"'"
        +",district='"+district+"',pin_code='"+pin_code+"',state='"+state+"',city='"+city+"',date_birth='"+date_birth+"'"
        +",gender='"+gender+"' where cust_id="+cust_id+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from customer_details where cust_id="+cust_id+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from customer_details where cust_id="+cust_id+"";
out.println(sql);

ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  cust_id    = Integer.toString(rs.getInt(1));
  fname      = rs.getString(2);
  mname      = rs.getString(3);
  lname      = rs.getString(4);
  address    = rs.getString(5);
  phone      = rs.getString(6);
  adhaar_no  = rs.getString(7);
  district   = rs.getString(8);
  pin_code     = rs.getString(9);
  esic_no     = rs.getString(10);
  city      = rs.getString(11);
  gender     = rs.getString(12);
  state     = rs.getString(13);
  date_birth = rs.getString(14);
  uan_no     = rs.getString(15);
}
response.sendRedirect("register.jsp?"
        + "opn=0&opi=0&opu=0&opd=0&ops=0"
        + "&cust_id="+cust_id+"&fname="+fname+"&mname="+mname+"&uan_no="+uan_no+""
        + "&lname="+lname+"&address="+address+"&phone="+phone+"&esic_no="+esic_no+""
        + "&adhaar_no="+adhaar_no+"&district="+district+"&pin_code="+pin_code+"&date_birth="+date_birth+""
        + "&city="+city+"&state="+state+"&gender="+gender+"");
}
else
{
  op="Invalid";
}
}
catch(Exception e)
{ out.print(e);}

out.println("<html>");
out.println("<head>");
out.println("<title>REGISTER</title>");
out.println("<script>");
out.println("function allset()"
+"{"
+"document.getElementById('cust_id').value    ='"+cust_id+"';"
+"document.getElementById('fname').value      ='"+fname+"';"
+"document.getElementById('mname').value      ='"+mname+"';"
+"document.getElementById('lname').value      ='"+lname+"';"
+"document.getElementById('address').value    ='"+address+"';"
+"document.getElementById('phone').value      ='"+phone+"';"
+"document.getElementById('adhaar_no').value  ='"+adhaar_no+"';"
+"document.getElementById('district').value   ='"+district+"';"
+"document.getElementById('pin_code').value     ='"+pin_code+"';"
+"document.getElementById('city').value      ='"+city+"';"
+"document.getElementById('gender').value     ='"+gender+"';"
+"document.getElementById('state').value     ='"+state+"';"
+"document.getElementById('esic_no').value     ='"+esic_no+"';"
+"document.getElementById('date_birth').value  ='"+date_birth+"';"
+"document.getElementById('uan_no').value      ='"+uan_no+"';"
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('register.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&cust_id=0');"
+"}");

out.println("function insert_v()"
+"{"
+"cust_id   = document.getElementById('cust_id').value;"
+"fname     = document.getElementById('fname').value;"
+"mname     = document.getElementById('mname').value;"
+"lname     = document.getElementById('lname').value;"
+"address   = document.getElementById('address').value;"
+"phone     = document.getElementById('phone').value;"
+"adhaar_no = document.getElementById('adhaar_no').value;"
+"district  = document.getElementById('district').value;"
+"pin_code    = document.getElementById('pin_code').value;"
+"city     = document.getElementById('city').value;"
+"gender    = document.getElementById('gender').value;"
+"state    = document.getElementById('state').value;"
+"esic_no    = document.getElementById('esic_no').value;"
+"date_birth =document.getElementById('date_birth').value;"
+"uan_no     =document.getElementById('uan_no').value;"
+"window.location.replace('register.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0"
        + "&cust_id='+cust_id+'&fname='+fname+'&mname='+mname+'&date_birth='+date_birth+'"
        + "&lname='+lname+'&address='+address+'&phone='+phone+'&esic_no='+esic_no+'&uan_no='+uan_no+'"
        + "&adhaar_no='+adhaar_no+'&district='+district+'&pin_code='+pin_code+'"
        + "&city='+city+'&state='+state+'&gender='+gender);"
+"}");

out.println("function update_v()"
+"{"
+"cust_id   = document.getElementById('cust_id').value;"
+"fname     = document.getElementById('fname').value;"
+"mname     = document.getElementById('mname').value;"
+"lname     = document.getElementById('lname').value;"
+"address   = document.getElementById('address').value;"
+"phone     = document.getElementById('phone').value;"
+"adhaar_no = document.getElementById('adhaar_no').value;"
+"district  = document.getElementById('district').value;"
+"pin_code    = document.getElementById('pin_code').value;"
+"city     = document.getElementById('city').value;"
+"gender    = document.getElementById('gender').value;"
+"state    = document.getElementById('state').value;"
+"esic_no    = document.getElementById('esic_no').value;"
+"date_birth = document.getElementById('date_birth').value;"
+"uan_no     = document.getElementById('uan_no').value;"
+"window.location.replace('register.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0"
        + "&cust_id='+cust_id+'&fname='+fname+'&mname='+mname+'&date_birth='+date_birth+'"
        + "&lname='+lname+'&address='+address+'&phone='+phone+'&esic_no='+esic_no+'"
        + "&adhaar_no='+adhaar_no+'&district='+district+'&pin_code='+pin_code+'&uan_no='+uan_no+'"
        + "&city='+city+'&state='+state+'&gender='+gender);"
+"}");

out.println("function delete_v()"
+"{"
+"cust_id = document.getElementById('cust_id').value;"
+"window.location.replace('register.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&cust_id='+cust_id);"
+"}");

out.println("function search_v()"
+"{"
+"cust_id = document.getElementById('cust_id').value;"        
+"window.location.replace('register.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&cust_id='+cust_id);"
+"}");

out.println("</script>");
out.println("<link rel='stylesheet' type='text/css' href='mycss.css'>");
out.println("</head>");
out.println("<body onload='allset()'>");
out.println("<br><br><br>");
out.println("<table align='center'>");
out.println("<tr><td>Customer ID</td><td><input type='text' id='cust_id' name='cust_id'></td></tr>");
out.println("<tr><td>First Name</td><td><input type='text' id='fname' name='fname'></td></tr>");
out.println("<tr><td>Middle Name</td><td><input type='text' id='mname' name='mname'></td></tr>");
out.println("<tr><td>Last Name</td><td><input type='text' id='lname' name='lname'></td></tr>");
out.println("<tr><td>Address</td><td><input type='text' id='address' name='address'></td></tr>");
out.println("<tr><td>Phone</td><td><input type='text' id='phone' name='phone'></td></tr>");
out.println("<tr><td>Adhaar No</td><td><input type='text' id='adhaar_no' name='adhaar_no'></td></tr>");
out.println("<tr><td>District</td><td><input type='text' id='district' name='district'></td></tr>");
out.println("<tr><td>PIN Code</td><td><input type='text' id='pin_code' name='pin_code'></td></tr>");
out.println("<tr><td>City</td><td><input type='text' id='city' name='city'></td></tr>");
out.println("<tr><td>Date Of Birth</td><td><input type='text' id='date_birth' name='birth'></td></tr>");
out.println("<tr><td>UAN No</td><td><input type='text' id='uan_no' name='uan_no'></td></tr>");
//out.println("<tr><td>Gender</td><td><input type='radio' id='gender' name='gender' value='MALE'>MALE</td></tr>");
//out.println("<tr><td></td><td><input type='radio' id='gender' name='gender' value='FEMALE'>FEMALE</td></tr>");
out.println("<tr><td>GENDER</td><td><select id='gender' name='gender'>");
out.println("<option value='MALE'>MALE</option>");
out.println("<option value='FEMALE'>FEMALE</option>");
out.println("<option value='OTHER'>OTHER</option>");
out.println("<tr><td>State</td><td><input type='text' id='state' name='state'></td></tr>");
out.println("<tr><td>Esic No</td><td><input type='text' id='esic_no' name='esic_no'></td></tr>");
out.println("</select></td></tr>");

out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td><td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td><td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>
