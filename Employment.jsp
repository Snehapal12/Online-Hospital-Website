<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String pre_emp         = request.getParameter("pre_emp");
String date_join       = request.getParameter("date_join");
String designation     = request.getParameter("designation");
String department      = request.getParameter("department");
String zone            = request.getParameter("zone");
String qualification   = request.getParameter("qualification");
String emp_status      = request.getParameter("emp_status");
String date_leav       = request.getParameter("date_leav");
String under_team      = request.getParameter("under_team");


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
sql="select max(pre_emp)+1 from employee";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  pre_emp=Integer.toString(rs.getInt(1));
}
response.sendRedirect("Employment.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&pre_emp="+pre_emp+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into employee values("
        + ""+pre_emp+",'"+qualification+"','"+emp_status+"',"
        + "'"+designation+"','"+zone+"','"+under_team+"',"
        + "'"+date_leav+"','"+date_join+"','"+department+"')";
        
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Inserted')");
out.println("</script>");
out.println(" Record Inserted ");
}
else if(opu.equals("u"))
{
op="u";
sql="update employee set "
        + "pre_emp='"+pre_emp+"',date_join='"+date_join+"',date_leav='"+date_leav+"'"
        + ",department='"+department+"',qualification='"+qualification+"',zone='"+zone+"'"
        +",designation='"+designation+"',emp_status='"+emp_status+"',under_team='"+under_team+"'";
        
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from employee where pre_emp="+pre_emp+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from employee where pre_emp="+pre_emp+"";
out.println(sql);

ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  pre_emp        = Integer.toString(rs.getInt(1));
  date_join      = rs.getString(2);
  designation    = rs.getString(3);
  department     = rs.getString(4);
  zone           = rs.getString(5);
  qualification  = rs.getString(6);
  emp_status     = rs.getString(7);
  date_leav      = rs.getString(8);
  under_team     = rs.getString(9);
  
}
response.sendRedirect("Employment.jsp?"
        + "opn=0&opi=0&opu=0&opd=0&ops=0"
        + "&pre_emp="+pre_emp+"&date_join="+date_join+"&designation="+designation+""
        + "&zone="+zone+"&qualification="+qualification+"&emp_status="+emp_status+""
        + "&date_leav="+date_leav+"&under_team="+under_team+"&department="+department+"");
        
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
+"document.getElementById('pre_emp').value        ='"+pre_emp+"';"
+"document.getElementById('date_join').value      ='"+date_join+"';"
+"document.getElementById('zone').value           ='"+zone+"';"
+"document.getElementById('qualification').value  ='"+qualification+"';"
+"document.getElementById('designation').value    ='"+designation+"';"
+"document.getElementById('department').value     ='"+department+"';"
+"document.getElementById('emp_status').value     ='"+emp_status+"';"
+"document.getElementById('date_leav').value      ='"+date_leav+"';"
+"document.getElementById('under_team').value     ='"+under_team+"';"
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('Employment.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&pre_emp=0');"
+"}");

out.println("function insert_v()"
+"{"
+"pre_emp       = document.getElementById('pre_emp').value;"
+"date_join     = document.getElementById('date_join').value;"
+"zone          = document.getElementById('zone').value;"
+"designation   = document.getElementById('designation').value;"
+"department    = document.getElementById('department').value;"
+"qualification = document.getElementById('qualification').value;"
+"emp_status    = document.getElementById('emp_status').value;"
+"date_leav     = document.getElementById('date_leav').value;"
+"under_team    = document.getElementById('under_team').value;"
+"window.location.replace('Employment.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0"
        + "&pre_emp='+pre_emp+'&date_join='+date_join+'&zone='+zone+'"
        + "&qualification='+qualification+'&department='+department+'&designation='+designation+'"
        + "&date_leav='+date_leav+'&emp_status='+emp_status+'&under_team='+under_team);"
        
+"}");

out.println("function update_v()"
+"{"
+"pre_emp       = document.getElementById('pre_emp').value;"
+"date_join     = document.getElementById('date_join').value;"
+"qualification = document.getElementById('qualification').value;"
+"designation   = document.getElementById('designation').value;"
+"department    = document.getElementById('department').value;"
+"zone          = document.getElementById('zone').value;"
+"emp_status    = document.getElementById('emp_status').value;"
+"date_leav     = document.getElementById('date_leav').value;"
+"under_emp     = document.getElementById('under_team').value;"
+"window.location.replace('Employment.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0"
        + "&pre_emp='+pre_emp+'&date_join='+date_join+'&qualification='+qualification+'"
        + "&designation='+designation+'&department='+department+'&zone='+zone+'"
        + "&emp_status='+emp_status+'&under_team='+under_team);"
        
+"}");

out.println("function delete_v()"
+"{"
+"pre_emp = document.getElementById('pre_emp').value;"
+"window.location.replace('Employment.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&pre_emp='+pre_emp);"
+"}");

out.println("function search_v()"
+"{"
+"pre_emp = document.getElementById('pre_emp').value;"        
+"window.location.replace('Employment.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&pre_emp='+pre_emp);"
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
out.println("<table align='center'>");
out.println("<tr><td>Previous Employer</td><td><input type='text' id='pre_emp' name='pre_emp'></td></tr>");
out.println("<tr><td>Date of Joining</td><td><input type='text' id='date_join' name='date_join'></td></tr>");
out.println("<tr><td>Designation</td><td><input type='text' id='designation' name='designation'></td></tr>");
out.println("<tr><td>Department</td><td><input type='text' id='department' name='department'></td></tr>");
out.println("<tr><td>Zone</td><td><input type='text' id='zone' name='zone'></td></tr>");
out.println("<tr><td>Qualification</td><td><input type='text' id='qualification' name='qualification'></td></tr>");
out.println("<tr><td>Employee Status</td><td><input type='text' id='emp_status' name='emp_status'></td></tr>");
out.println("<tr><td>Date of Leaving</td><td><input type='text' id='date_leav' name='date_leav'></td></tr>");
out.println("<tr><td>Under Team</td><td><input type='text' id='under_team' name='under_team'></td></tr>");
out.println("</select></td></tr>");

out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td><td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td><td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>
