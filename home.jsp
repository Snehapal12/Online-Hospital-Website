<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String search_id         = request.getParameter("search_id");
String search_una        = request.getParameter("search_una");
String search_esic       = request.getParameter("search_esic");
String search_aadhar     = request.getParameter("search_aadhar");
String emp_id            = request.getParameter("emp_id");
String fname             = request.getParameter("fname");
String mname             = request.getParameter("mname");
String lname             = request.getParameter("lname");
String present_address   = request.getParameter("address");
String phone             = request.getParameter("phone");
String adhaar_no         = request.getParameter("adhaar_no");
String pin_code          = request.getParameter("pin_code");
String gender            = request.getParameter("gender");
String date_birth     = request.getParameter("date_birth");
String uan_no            = request.getParameter("uan_no");
String city              = request.getParameter("city");
String state             = request.getParameter("state");
String district          = request.getParameter("district");
String esic_no           = request.getParameter("esic_no");

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
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/priya","root","");
 Statement stmt=con.createStatement();

if(opn.equals("n"))
{
op="n";
sql="select max(cust_id)+1 from customer_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  emp_id=Integer.toString(rs.getInt(1));
}
response.sendRedirect("register.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&cust_id="+emp_id+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into customer_details values("
        +""+search_id+",'"+search_una+",'"+search_esic+",'"+search_aadhar+"',"
        + ""+emp_id+",'"+fname+"','"+mname+"',"
        + "'"+lname+"','"+present_address+"','"+phone+"',"
        + "'"+adhaar_no+"','"+city+"','"+pin_code+"',"
        + "'"+uan_no+"','"+state+"','"+district+"',"
        + ""+esic_no+","+date_birth+",'"+gender+"')";

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
        + "fname='"+fname+"',mname='"+mname+"',lname='"+lname+"'"
        +"city='"+city+"',esic_no='"+esic_no+"',date_birth='"+date_birth+"'"
        + ",present_address='"+present_address+"',phone='"+phone+"',adhaar_no='"+adhaar_no+"'"
        +",district='"+district+"',pin_code='"+pin_code+"',state="+state+""
        +",gender='"+gender+"' where cust_id="+emp_id+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from customer_details where cust_id="+emp_id+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from customer_details where cust_id="+emp_id+"";
out.println(sql);

ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  emp_id    = Integer.toString(rs.getInt(1));
  fname      = rs.getString(2);
  mname      = rs.getString(3);
  lname      = rs.getString(4);
  present_address    = rs.getString(5);
  phone      = rs.getString(6);
  adhaar_no  = rs.getString(7);
  district   = rs.getString(8);
  pin_code     = rs.getString(9);
  city      = rs.getString(10);
  gender     = rs.getString(11);
  esic_no      = rs.getString(14);
}
response.sendRedirect("register.jsp?"
        + "opn=0&opi=0&opu=0&opd=0&ops=0"
        + "&cust_id="+emp_id+"&fname="+fname+"&mname="+mname+""
        + "&lname="+lname+"&address="+present_address+"&phone="+phone+""
        + "&adhaar_no="+adhaar_no+"&district="+district+"&pan_no="+pin_code+""
        + "&city="+city+"&state="+state+""
        +"&date_birth="+date_birth+""
        + "&esic_no="+esic_no+"&gender="+gender+"");
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
+"document.getElementById('emp_id').value    ='"+emp_id+"';"
+"document.getElementById('fname').value      ='"+fname+"';"
+"document.getElementById('mname').value      ='"+mname+"';"
+"document.getElementById('lname').value      ='"+lname+"';"
+"document.getElementById('present_address').value    ='"+present_address+"';"
+"document.getElementById('phone').value      ='"+phone+"';"
+"document.getElementById('adhaar_no').value  ='"+adhaar_no+"';"
+"document.getElementById('district').value   ='"+district+"';"
+"document.getElementById('pin_code').value     ='"+pin_code+"';"
+"document.getElementById('state').value      ='"+state+"';"
+"document.getElementById('gender').value     ='"+gender+"';"
+"document.getElementById('city').value       ='"+city+"';"
+"document.getElementById('date_birth').value ='"+date_birth+"';"
+"document.getElementById('esic_no').value    ='"+esic_no+"';"   
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('register.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&cust_id=0');"
+"}");

out.println("function insert_v()"
+"{"
+"emp_id   = document.getElementById('emp_id').value;"
+"fname     = document.getElementById('fname').value;"
+"mname     = document.getElementById('mname').value;"
+"lname     = document.getElementById('lname').value;"
+"present_address   = document.getElementById('present_address').value;"
+"phone     = document.getElementById('phone').value;"
+"adhaar_no = document.getElementById('adhaar_no').value;"
+"district  = document.getElementById('district').value;"
+"pin_code    = document.getElementById('pin_code').value;"
+"city     = document.getElementById('city').value;"
+"gender    = document.getElementById('gender').value;"
+"state    = document.getElementById('state').value;"
+"date_birth  = document.getElementById('date_birth').value;"
+"esic_no    = document.getElementById('esic_no').value;"
        
+"window.location.replace('register.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0"
        + "&emp_id='+emp_id+'&fname='+fname+'&mname='+mname+'"
        + "&lname='+lname+'&present_address='+present_address+'&phone='+phone+'"
        + "&adhaar_no='+adhaar_no+'&district='+district+'&pin_code='+pin_code+'"
        +"&state='+state+'&city='+city+'&date_birth='+date_birth+'"
        +"&una_no='+una_no+'"
        + "&esic_no='+esic_no+'&gender='+gender);"
+"}");

out.println("function update_v()"
+"{"
+"emp_id   = document.getElementById('emp_id').value;"
+"fname     = document.getElementById('fname').value;"
+"mname     = document.getElementById('mname').value;"
+"lname     = document.getElementById('lname').value;"
+"present_address   = document.getElementById('present_address').value;"
+"phone     = document.getElementById('phone').value;"
+"adhaar_no = document.getElementById('adhaar_no').value;"
+"district  = document.getElementById('district').value;"
+"pin_code    = document.getElementById('pin_code').value;"
+"esic_no     = document.getElementById('esic_no').value;"
+"gender    = document.getElementById('gender').value;"
+"state     =document.getElementById('state').value;"
+"city      =document.getElementByid('city').value;"
+"date_birth  = document.getElementById('date_birth').value;"
+"una_no    = document.getElementById('una_no').value;"
+"window.location.replace('register.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0"
        + "&emp_id='+emp_id+'&fname='+fname+'&mname='+mname+'"
        + "&lname='+lname+'&present_address='+present_address+'&phone='+phone+'"
        + "&adhaar_no='+adhaar_no+'&district='+district+'&pin_code='+pin_code+'"
        + "&una_no='+una_no+'&esic_no='+esic_no+'&gender='+gender);"
+"}");

out.println("function delete_v()"
+"{"
+"emp_id = document.getElementById('emp_id').value;"
+"window.location.replace('register.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&emp_id='+emp_id);"
+"}");

out.println("function search_v()"
+"{"
+"cust_id = document.getElementById('emp_id').value;"        
+"window.location.replace('register.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&emp_id='+emp_id);"
+"}");

out.println("</script>");
out.println("<link rel='stylesheet' type='text/css' href='mycss.css'>");
out.println("</head>");
out.println("<body onload='allset()'>");
out.println("<div class='navbar'>"
+"<a href='home.jsp'>HOME</a>"
+"<a href='Basic.jsp'>Basic Information</a>"
+"<a href='Employment.jsp'>"
+"Employment Details</a>"
+"<a href='KYC.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&cust_id=0'>"
+"KYC Details</a>"
+"<a href='contact.jsp?vno=0'>"
+"CONTACT</a>"
+"</div>");
out.println("<br><br><br>");
out.println("<table align='left'>");
out.println("<tr><td>Search by ID</td><td><input type='text' id='search_id' name='search_id'></td></tr>");
out.println("<tr><td>Search by UNA</td><td><input type='text' id='search_una' name='search_una'></td></tr>");
out.println("<tr><td>Search by ESIC</td><td><input type='text' id='search_esic' name='search_esic'></td></tr>");
out.println("<tr><td>Search by Aadhar</td><td><input type='text' id='search_aadhar' name='search_aadhar'></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("<br><br><br>");
out.println("<table align='right'>");
out.println("<tr><td>UAN/PF No</td><td><input type='text' id='uan_no' name='uan_no'></td></tr>");
out.println("<tr><td>City/Taluka</td><td><input type='text' id='city' name='city'></td></tr>");
out.println("<tr><td>State</td><td><input type='text' id='state' name='state'></td></tr>");
out.println("<tr><td>District</td><td><input type='text' id='district' name='district'></td></tr>");
out.println("<tr><td>ESIC No</td><td><input type='text' id='esic_no' name='esic_no'></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td><td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td><td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("</table>");

out.println("<table align='center'>");
out.println("<tr><td>Employee ID</td><td><input type='text' id='emp_id' name='emp_id'></td></tr>");
out.println("<tr><td>First Name</td><td><input type='text' id='fname' name='fname'></td></tr>");
out.println("<tr><td>Middle Name</td><td><input type='text' id='mname' name='mname'></td></tr>");
out.println("<tr><td>Last Name</td><td><input type='text' id='lname' name='lname'></td></tr>");
out.println("<tr><td>Date of Birth</td><td><input type='text' id='date_birth' name='date_birth'></td></tr>");
out.println("<tr><td> Present Address</td><td><input type='text' id='address' name='address'></td></tr>");
out.println("<tr><td>Phone</td><td><input type='text' id='phone' name='phone'></td></tr>");
out.println("<tr><td>Adhaar No</td><td><input type='text' id='adhaar_no' name='adhaar_no'></td></tr>");
out.println("<tr><td>Pin Code</td><td><input type='text' id='pin_code' name='pin_code'></td></tr>");

//out.println("<tr><td>Gender</td><td><input type='radio' id='gender' name='gender' value='MALE'>MALE</td></tr>");
//out.println("<tr><td></td><td><input type='radio' id='gender' name='gender' value='FEMALE'>FEMALE</td></tr>");
out.println("<tr><td>GENDER</td><td><select id='gender' name='gender'>");
out.println("<option value='MALE'>MALE</option>");
out.println("<option value='FEMALE'>FEMALE</option>");
out.println("<option value='OTHER'>OTHER</option>");
out.println("</select></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>
