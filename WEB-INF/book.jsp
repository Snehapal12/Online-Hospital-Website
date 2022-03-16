<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String emp_no         = request.getParameter("emp_no");
String pre_emp        = request.getParameter("pre_emp");
String date_join      = request.getParameter("date_join");
String designation    = request.getParameter("designation");
String department     = request.getParameter("department");
String zone           = request.getParameter("zone");
String qualification  = request.getParameter("qualification");
String emp_status     = request.getParameter("emp_status");
String date_leav      = request.getParameter("date_leav");
String under_team     = request.getParameter("under_team");

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
sql="select max(emp_no)+1 from employee_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  emp_no=Integer.toString(rs.getInt(1));
}
response.sendRedirect("book.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&emp_no="+emp_no+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into employee_details values("
        + ""+emp_no+",'"+pre_emp+"','"+date_join+"','"+designation+"',"
        + "'"+department+"','"+zone+"','"+qualification+"',"
        + "'"+emp_status+"','"+date_leav+"','"+under_team+"')";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Inserted')");
out.println("</script>");
out.println(" Record Inserted ");
}
else if(opu.equals("u"))
{
op="u";
/*sql="update vehicle_details set v_model='"+v_model+"',v_name='"+v_name+"',v_manu='"+v_manu+"'"
   +"  where vehicle_no="+vehicle_no+"";*/
sql="update employee_details set "
        + "pre_emp='"+pre_emp+"',date_join='"+date_join+"',designation='"+designation+"'"
        +",department='"+department+"',emp_status='"+emp_status+"',under_team='"+under_team+"'"
        +",zone='"+zone+"',qualification='"+qualification+"',date_leav='"+date_leav+"'"
        +"where emp_no="+emp_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from employee_details where emp_no="+emp_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from employee_details where emp_no="+emp_no+"";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  emp_no          = Integer.toString(rs.getInt(1));
  pre_emp         = rs.getString(2);
  date_join       = rs.getString(3);
  designation     = rs.getString(4);
  department      = rs.getString(5);
  zone            = rs.getString(6);
  qualification   = rs.getString(7);
  emp_status      = rs.getString(8);
  date_leav       = rs.getString(9);
  under_team     = rs.getString(10);
}
response.sendRedirect("book.jsp?"
        + "opn=0&opi=0&opu=0&opd=0&ops=0"
        + "&emp_no="+emp_no+"&pre_emp="+pre_emp+"&date_join="+date_join+""
        + "&designation="+designation+"&emp_status="+emp_status+""
        + "&date_leav="+date_leav+"&under_team="+under_team+""
        + "&department="+department+"&zone="+zone+"&qualification="+qualification+"");
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
out.println("<title>Employee Details</title>");
out.println("<script>");
out.println("function allset()"
+"{"
+"document.getElementById('emp_no').value          ='"+emp_no+"';"
+"document.getElementById('pre_emp').value         ='"+pre_emp+"';"
+"document.getElementById('date_join').value       ='"+date_join+"';"
+"document.getElementById('designation').value     ='"+designation+"';"
+"document.getElementById('department').value      ='"+department+"';"
+"document.getElementById('zone').value            ='"+zone+"';"
+"document.getElementById('qualification').value   ='"+qualification+"';"
+"document.getElementById('emp_status').value      ='"+emp_status+"';"
+"document.getElementById('date_leav').value       ='"+date_leav+"';"
+"document.getElementById('under_team').value      ='"+under_team+"';"
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('book.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&emp_no=0&no_seat=0');"
+"}");

out.println("function ins()"
+"{"
+"window.location.replace('book.jsp?opn=0&opi=i&opu=0&opd=0&ops=0&emp_no=0');"
+"}");

out.println("function insert_v()"
+"{"
+"emp_no        = document.getElementById('emp_no').value;"
+"pre_emp       = document.getElementById('pre_emp').value;"
+"date_join     = document.getElementById('date_join').value;"
+"designation   = document.getElementById('designation').value;"
+"department    = document.getElementById('department').value;"
+"zone          = document.getElementById('zone').value;"
+"qualification = document.getElementById('qualification').value;"
+"emp_status    = document.getElementById('emp_status').value;"
+"date_leav     = document.getElementById('date_join').value;"
+"under_team    = document.getElementById('under_team').value;"
+"window.location.replace('book.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0"
        + "&emp_no='+emp_no+'&pre_emp='+pre_emp+'&designation='+designation+'&date_join='+date_join+'"
        + "&department='+department+'&zone='+zone+'&date_leav='+date_leav+'"
        + "&qualification='+qualification+'&emp_status='+emp_status+'&under_team='+under_team);"

+"}");

out.println("function update_v()"
+"{"
+"emp_no    = document.getElementById('emp_no').value;"
+"pre_emp = document.getElementById('pre_emp').value;"
+"date_join  = document.getElementById('date_join').value;"
+"designation  = document.getElementById('designation').value;"
+"department  = document.getElementById('department').value;"
+"zone   = document.getElementById('zone').value;"
+"qualification = document.getElementById('qualification').value;"
+"emp_status    = document.getElementById('emp_status').value;"
+"date_leav     = document.getElementById('date_leav').value;"
+"under_team    = document.getElementById('under_team').value;"
+"window.location.replace('book.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0"
        + "&emp_no='+emp_no+'&pre_emp='+pre_emp+'&date_join='+date_join+'"
        + "&designation='+designation+'&emp_status='+emp_status+'"
        + "&date_leav='+date+leav+'&under_team='+under_team+'"
        + "&department='+department+'&zone='+zone+'&qualification='+qualification);"
+"}");

out.println("function delete_v()"
+"{"
+"emp_no = document.getElementById('emp_no').value;"
+"window.location.replace('book.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&emp_no='+emp_no);"
+"}");

out.println("function search_v()"
+"{"
+"emp_no = document.getElementById('emp_no').value;"        
+"window.location.replace('book.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&emp_no='+emp_no);"
+"}");

out.println("</script>");
out.println("<link rel='stylesheet' type='text/css' href='mycss.css'>");
out.println("</head>");
out.println("<body onload='allset()'>");
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
out.println("<table align='center'>");
out.println("<tr><td>Employee No</td><td><input type='text' id='emp_no' name='emp_no'></td></tr>");
out.println("<tr><td>Pre Employee Name</td><td><input type='text' id='pre_emp' name='pre_emp'></td></tr>");
out.println("<tr><td>Date join</td><td><input type='text' id='date_join' name='date_join'></td></tr>");
out.println("<tr><td>Designation</td><td><input type='text' id='designation' name='designation'></td></tr>");
out.println("<tr><td>Department</td><td><input type='text' id='department' name='department'></td></tr>");
out.println("<tr><td>Zone</td><td><input type='text' id='zone' name='zone'></td></tr>");
out.println("<tr><td>Qualification</td><td><input type='text' id='qualification' name='qualification'></td></tr>");
out.println("<tr><td>Employee Status</td><td><input type='text' id='emp_status' name='emp_status'></td></tr>");
out.println("<tr><td>Date Of Leav</td><td><input type='text' id='date_leav' name='date_leav'></td></tr>");
out.println("<tr><td>Under Team</td><td><input type='text' id='under_team' name='under_team'></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td><td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td><td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>