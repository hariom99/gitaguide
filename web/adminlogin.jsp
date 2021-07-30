<%@page import="dao.AdminDao" %>
<jsp:useBean id="obj" class="dto.AdminLogin" ></jsp:useBean>
<jsp:setProperty name="obj" property="*" ></jsp:setProperty>
<%
 AdminDao ad = new AdminDao();
 int i = ad.adminLogin(obj);
 if(i>0)
 {
  response.sendRedirect("adminhome.jsp");
  String admin="admin";
  session.setAttribute("admin",admin);
%>
<%
 }
else
{
%>
<script>alert("wrong username or password !");</script>
<jsp:include page="admin.html" ></jsp:include>
<%}%>