<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*;" %>
<%
String aadhar_no        = request.getParameter("aadhar_no");
String pan_no           = request.getParameter("pan_no");
String elect_no         = request.getParameter("elect_no");
String bank_no          = request.getParameter("bank_no");
String bank_name        = request.getParameter("bank_name");
String branch           = request.getParameter("branch");
String ifsc_code        = request.getParameter("ifsc_code");
String bocw_regist      = request.getParameter("bocw_regist");
String regist_date      = request.getParameter("regist_date");
String vaccine_name     = request.getParameter("vaccine_name");
String dose1_date       = request.getParameter("dose1_date");
String dose2_date       = request.getParameter("dose2_date");
String policy_no        =request.getParameter("policy_no");
String policy_date      = request.getParameter("policy_date");
String end_date         = request.getParameter("end_date");

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
sql="select max(aadhar_no)+1 from kyc_details";
out.println(sql);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  aadhar_no=Integer.toString(rs.getInt(1));
}
response.sendRedirect("newjsp.jsp?opn=0&opi=0&opu=0&opd=0&ops=0&aadhar_no="+aadhar_no+"");
}
else if(opi.equals("i"))
{
op="i";
sql="insert into kyc_details values("
        + ""+aadhar_no+",'"+pan_no+"','"+elect_no+"','"+end_date+"',"
        + "'"+bank_no+"','"+bank_name+"','"+branch+"','"+policy_date+"',"
        + "'"+ifsc_code+"','"+bocw_regist+"','"+regist_date+"','"+vaccine_name+"',"
        + "'"+dose1_date+"','"+policy_no+"','"+dose2_date+"')";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Inserted')");
out.println("</script>");
out.println(" Record Inserted ");
}
else if(opu.equals("u"))
{
op="u";
sql="update kyc_details set "
        + "pan_no='"+pan_no+"',elect_no='"+elect_no+"',bank_no='"+bank_no+"',end_date='"+end_date+"'"
        + ",bank_name='"+bank_name+"',branch='"+branch+"',ifsc_code='"+ifsc_code+"',vaccine_name='"+vaccine_name+"'"
        +",regist_date='"+regist_date+"',bocw_regist='"+bocw_regist+"',policy_no='"+policy_no+"',dose1_date='"+dose1_date+"',policy_date='"+policy_date+"'"
        +",dose2_date='"+dose2_date+"' where aadhar_no="+aadhar_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Updated')");
out.println("</script>");
out.println(" Record Updated ");
}
else if(opd.equals("d"))
{
op="d";
sql="delete from kyc_details where aadhar_no="+aadhar_no+"";
stmt.executeUpdate(sql);
out.println("<script>");
out.println("alert('1 Record Deleted')");
out.println("</script>");
out.println(" Record Deleted ");
}
else if(ops.equals("s"))
{
op="s";
sql="select * from kyc_details where aadhar_no="+aadhar_no+"";
out.println(sql);

ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
  aadhar_no     = Integer.toString(rs.getInt(1));
  pan_no        = rs.getString(2);
  elect_no      = rs.getString(3);
  bank_no       = rs.getString(4);
  bank_name     = rs.getString(5);
  branch        = rs.getString(6);
  ifsc_code     = rs.getString(7);
  bocw_regist   = rs.getString(8);
  regist_date   = rs.getString(9);
  vaccine_name  = rs.getString(10);
  dose1_date    = rs.getString(11);
  dose2_date    = rs.getString(12);
  policy_no     = rs.getString(13);
  policy_date   = rs.getString(14);
  end_date      = rs.getString(15);
}
response.sendRedirect("newjsp.jsp?"
        + "opn=0&opi=0&opu=0&opd=0&ops=0"
        + "&aadhar_no="+aadhar_no+"&pan_no="+pan_no+"&elect_no="+elect_no+"&uan_no="+end_date+""
        + "&bank_no="+bank_no+"&bank_name="+bank_name+"&branch="+branch+"&regist_date="+regist_date+""
        + "&ifsc_code="+ifsc_code+"&bocw_regist="+bocw_regist+"&vaccine_name="+vaccine_name+"&policy_date="+policy_date+""
        + "&dose1_date="+dose1_date+"&policy_no="+policy_no+"&dose2_date="+dose2_date+"");
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
out.println("<title>KYC Details</title>");
out.println("<script>");
out.println("function allset()"
+"{"
+"document.getElementById('aadhar_no').value    ='"+aadhar_no+"';"
+"document.getElementById('pan_no').value      ='"+pan_no+"';"
+"document.getElementById('elect_no').value      ='"+elect_no+"';"
+"document.getElementById('bank_no').value      ='"+bank_no+"';"
+"document.getElementById('bank_name').value    ='"+bank_name+"';"
+"document.getElementById('branch').value      ='"+branch+"';"
+"document.getElementById('ifsc_code').value  ='"+ifsc_code+"';"
+"document.getElementById('bocw_regist').value   ='"+bocw_regist+"';"
+"document.getElementById('regist_date').value     ='"+regist_date+"';"
+"document.getElementById('dose1_date').value      ='"+dose1_date+"';"
+"document.getElementById('dose2_date').value     ='"+dose2_date+"';"
+"document.getElementById('policy_no').value     ='"+policy_no+"';"
+"document.getElementById('vaccine_name').value     ='"+vaccine_name+"';"
+"document.getElementById('policy_date').value  ='"+policy_date+"';"
+"document.getElementById('end_date').value      ='"+end_date+"';"
+"}");

out.println("function new_v()"
+"{"
+"window.location.replace('newjsp.jsp?opn=n&opi=0&opu=0&opd=0&ops=0&aadhar_no=0');"
+"}");

out.println("function insert_v()"
+"{"
+"aadhar_no   = document.getElementById('aadhar_no').value;"
+"pan_no     = document.getElementById('pan_no').value;"
+"elect_no     = document.getElementById('elect_no').value;"
+"bank_no     = document.getElementById('bank_no').value;"
+"bank_name   = document.getElementById('bank_name').value;"
+"branch     = document.getElementById('branch').value;"
+"ifsc_code = document.getElementById('ifsc_code').value;"
+"bocw_regist  = document.getElementById('bocw_regist').value;"
+"regist_date    = document.getElementById('regist_date').value;"
+"dose1_date     = document.getElementById('dose1_date').value;"
+"dose2_date    = document.getElementById('dose2_date').value;"
+"policy_no    = document.getElementById('policy_no').value;"
+"vaccine_name    = document.getElementById('vaccine_name').value;"
+"policy_date    =document.getElementById('policy_date').value;"
+"end_date     =document.getElementById('end_date').value;"
+"window.location.replace('newjsp.jsp?"
        + "opn=0&opi=i&opu=0&opd=0&ops=0"
        + "&aadhar_no='+aadhar_no+'&pan_no='+pan_no+'&elect_no='+elect_no+'&policy_date='+policy_date+'"
        + "&bank_no='+bank_no+'&bank_name='+bank_name+'&branch='+branch+'&vaccine_name='+vaccine_name+'&end_date='+end_date+'"
        + "&ifsc_code='+ifsc_code+'&bocw_regist='+bocw_regist+'&regist_date='+regist_date+'"
        + "&dose1_date='+dose1_date+'&policy_no='+policy_no+'&dose2_date='+dose2_date);"
+"}");

out.println("function update_v()"
+"{"
+"aadhar_no   = document.getElementById('aadhar_no').value;"
+"pan_no     = document.getElementById('pan_no').value;"
+"elect_no     = document.getElementById('elect_no').value;"
+"bank_no     = document.getElementById('bank_no').value;"
+"bank_name   = document.getElementById('bank_name').value;"
+"branch     = document.getElementById('branch').value;"
+"ifsc_code = document.getElementById('ifsc_code').value;"
+"bocw_regist  = document.getElementById('bocw_regist').value;"
+"regist_date    = document.getElementById('regist_date').value;"
+"dose1_date     = document.getElementById('dose1_date').value;"
+"dose2_date    = document.getElementById('dose2_date').value;"
+"policy_no    = document.getElementById('policy_no').value;"
+"vaccine_name    = document.getElementById('vaccine_name').value;"
+"policy_date = document.getElementById('policy_date').value;"
+"end_date     = document.getElementById('end_date').value;"
+"window.location.replace('newjsp.jsp?"
        + "opn=0&opi=0&opu=u&opd=0&ops=0"
        + "&aadhar_no='+aadhar_no+'&pan_no='+pan_no+'&elect_no='+elect_no+'&policy_date='+policy_date+'"
        + "&bank_no='+bank_no+'&bank_name='+bank_name+'&branch='+branch+'&vaccine_name='+vaccine_name+'"
        + "&ifsc_code='+ifsc_code+'&bocw_regist='+bocw_regist+'&regist_date='+regist_date+'&end_date='+end_date+'"
        + "&dose1_date='+dose1_date+'&policy_no='+policy_no+'&dose2_date='+dose2_date);"
+"}");

out.println("function delete_v()"
+"{"
+"aadhar_no = document.getElementById('aadhar_no').value;"
+"window.location.replace('newjsp.jsp?opn=0&opi=0&opu=0&opd=d&ops=0&aadhar_no='+aadhar_no);"
+"}");

out.println("function search_v()"
+"{"
+"aadhar_no = document.getElementById('aadhar_no').value;"        
+"window.location.replace('newjsp.jsp?opn=0&opi=0&opu=0&opd=0&ops=s&aadhar_no='+aadhar_no);"
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
out.println("<tr><td>Aadhar No</td><td><input type='text' id='aadhar_no' name='aadhar_no'></td></tr>");
out.println("<tr><td>Pan No</td><td><input type='text' id='pan_no' name='pan_no'></td></tr>");
out.println("<tr><td>Electricity Ser No</td><td><input type='text' id='elect_no' name='elect_no'></td></tr>");
out.println("<tr><td>Bank Account No</td><td><input type='text' id='bank_no' name='bank_no'></td></tr>");
out.println("<tr><td>Bank Name</td><td><input type='text' id='bank_name' name='bank_name'></td></tr>");
out.println("<tr><td>Branch</td><td><input type='text' id='branch' name='branch'></td></tr>");
out.println("<tr><td>IFSC Code</td><td><input type='text' id='ifsc_code' name='ifsc_code'></td></tr>");
out.println("<tr><td>Bocw Registation</td><td><input type='text' id='bocw_regist' name='bocw_regist'></td></tr>");
out.println("<tr><td>Registation Date</td><td><input type='text' id='regist_date' name='regist_date'></td></tr>");
out.println("<tr><td>Vaccine Name</td><td><input type='text' id='vaccine_name' name='vaccine_name'></td></tr>");
out.println("<tr><td>Dose1 Date</td><td><input type='text' id='dose1_date' name='dose1_date'></td></tr>");
out.println("<tr><td>Dose2 Date</td><td><input type='text' id='dose2_date' name='dose2_date'></td></tr>");
out.println("<tr><td>Policy No</td><td><input type='text' id='policy_no' name='policy_no'></td></tr>");
out.println("<tr><td>Policy Issue Date</td><td><input type='text' id='policy_date' name='policy_date'></td></tr>");
out.println("<tr><td>Policy End Date</td><td><input type='text' id='end_date' name='end_date'></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='new_v()'>NEW</a></td><td align='center'><a href='#' onclick='insert_v()'>INSERT</a></td></tr>");
out.println("<tr><td align='center'><a href='#' onclick='update_v()'>UPDATE</a></td><td align='center'><a href='#' onclick='delete_v()'>DELETE</a></td></tr>");
out.println("<tr><td colspan='2' align='center'><a href='#' onclick='search_v()'>SEARCH</a></td></tr>");
out.println("</table>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
%>
