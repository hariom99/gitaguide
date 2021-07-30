<%@page import="dao.User" %>
<jsp:useBean id="ob1" class="dto.SaveTransaction" ></jsp:useBean>
<jsp:setProperty name="ob1" property="*"></jsp:setProperty>
<%
 User getUser = new User();
 int i = getUser.setTransaction(ob1);
 response.sendRedirect("myorders.jsp");
%>
