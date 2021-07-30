<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.getSession().getServletContext().setAttribute("session",null);

session.invalidate();

response.sendRedirect("admin.html");
%>
